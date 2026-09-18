# Öğrenci, Bölüm ve Ders ilişkilerini 3NF kurallarına uygun olarak normalize edip DDL sorgularını yazın.

CREATE TABLE IF NOT EXISTS departments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO departments (name) VALUES ('Bilgisayar'), ('Tarih'), ('Coğrafya');

CREATE TABLE IF NOT EXISTS lessons (
                         id INT AUTO_INCREMENT PRIMARY KEY,
                         name VARCHAR(100) NOT NULL,
                         department_id INT,

                         FOREIGN KEY (department_id)REFERENCES departments(id)
);

INSERT INTO lessons (name, department_id) VALUES ('Algoritma', 1), ('Ortaçağ Tarihi', 2), ('Göller Akarsular', 3);


CREATE TABLE IF NOT EXISTS students (
                                        id INT AUTO_INCREMENT PRIMARY KEY,
                                        name VARCHAR(100) NOT NULL
    );

INSERT INTO students (name) VALUES ('Okan'), ('Eylul'), ('Eflin');

CREATE TABLE IF NOT EXISTS lesson_student(
                                             lesson_id INT,
                                             student_id INT,

                                             PRIMARY KEY (student_id, lesson_id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(id)
    );

INSERT INTO lesson_student (lesson_id, student_id) VALUES (1,1), (1,2), (1,3), (2,3), (3,1);

SELECT
    s.`name` AS 'ÖĞRENCİ',
    d.`name` AS 'BÖLÜM',
    l.`name` AS 'DERS'
FROM
    students s
        JOIN lesson_student ls ON s.id = ls.student_id
        JOIN lessons l ON ls.lesson_id = l.id
        JOIN departments d ON l.department_id = d.id;
