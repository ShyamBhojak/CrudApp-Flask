from flask import Flask, render_template, redirect, url_for, request, flash
import pymysql

app = Flask(__name__)
app.secret_key = 'flash message'
app.config['MYSQL_HOST'] = "localhost"
app.config['MYSQL_USER'] = "root"
app.config['MYSQL_PASSWORD'] = ""
app.config['MYSQL_DB'] = "online_sessions"

connection = pymysql.connect(
    host = app.config['MYSQL_HOST'],
    user = app.config['MYSQL_USER'],
    password = app.config['MYSQL_PASSWORD'],
    db = app.config['MYSQL_DB']
)
cursor = connection.cursor()
cursor.execute("SHOW TABLES")
tables = [table[0] for table in cursor]

@app.route('/')
def index():
    try:
        if 'students' in tables:
            sql = "SELECT * FROM `students`"
            cursor.execute(sql)
            records = cursor.fetchall()
        else:
            raise pymysql.err.OperationalError("No such table 'students' exist!")
    except pymysql.err.OperationalError as p:
        print(p)
    return render_template('index.html',students = records)

cursor.execute("SELECT `name` FROM `students`")
names = [name[0] for name in cursor]

@app.route('/insert', methods=['POST'])
def insert():
    if request.method == 'POST':
        name = request.form['name']
        course = request.form['course']
        lecture_time = request.form['lecture_time']
        try:
            if name in names:
                raise pymysql.err.IntegrityError(f"record with {name} already exists!")
            else:
                query = 'INSERT INTO `students`(`name`,`course`,`lecture_time`) VALUES (%s,%s,%s)'
                cursor.execute(query,(name,course,lecture_time))
                connection.commit()
                flash(f"Student {name} registered successfully!")
        except pymysql.err.IntegrityError as p:
            print(p)
    return redirect(url_for('index'))

@app.route('/update', methods=['POST'])
def update():
    if request.method == 'POST':
        idEdit = request.form['idEdit']
        nameEdit = request.form['nameEdit']
        courseEdit = request.form['courseEdit']
        lecture_time_edit = request.form['lecture_time_edit']
        # print(nameEdit,courseEdit,lecture_time_edit,idEdit)

        query = 'UPDATE `students` SET `name` = %s, `course` = %s, `lecture_time` = %s WHERE `id` = %s'
        cursor.execute(query,(nameEdit,courseEdit,lecture_time_edit,idEdit))
        connection.commit()
        flash(f"Student at id {idEdit} updated successfully!")

    return redirect(url_for('index'))


if __name__ == "__main__":
    app.run(debug=True)
