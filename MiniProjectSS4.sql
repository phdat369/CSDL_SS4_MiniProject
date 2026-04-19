create database miniprojectss4;
use miniprojectss4;

create table student (
   student_id char(5) primary key,
   student_name varchar(100) not null,
   student_birthday date not null,
   student_email varchar(100) unique not null
);
create table instructor (
   instructor_id char(5) primary key,
   instructor_name varchar(100) not null,
   instructor_email varchar(100) not null unique
);
create table course (
   course_id int auto_increment primary key,
   course_name varchar(100) not null unique,
   course_description varchar(150) not null,
   course_session int check (course_session > 0),
   instructor_id char(5) not null,
   foreign key (instructor_id) references instructor (instructor_id)
);
create table enrollment (
   date_register date default (current_time()),
   student_id char(5) not null,
   course_id int not null,
   unique (student_id,course_id),
   foreign key (student_id) references student (student_id),
   foreign key (course_id) references course (course_id)
);
create table score (
   student_id char(5) not null,
   course_id int not null,
   midterm_score float check (midterm_score >= 0 and midterm_score <= 10),
   final_score float check (final_score >= 0 and final_score <= 10),
   unique (student_id,course_id),
   foreign key (student_id) references student (student_id),
   foreign key (course_id) references course (course_id)
);

insert into student (student_id,student_name,student_birthday,student_email)
values ('SV001','Nguyễn Văn A','2007-09-20','nva@gmail.com'),
       ('SV002','Trần Thị B','2007-12-26','ttb@gmail.com'),
       ('SV003','Lê Văn C','2007-02-03','lvc@gmail.com'),
       ('SV004','Phạm Thị D','2007-06-17','ptd@gmail.com'),
       ('SV005','Phan Thanh E','2007-11-30','pte@gmail.com');

insert into instructor (instructor_id,instructor_name,instructor_email)
values ('GV001','Nguyễn Văn Anh','abc@gmail.com'),
       ('GV002','Phạm Thành Đạt','phdat369@gmail.com'),
       ('GV003','Phan Trung Thành','ptt@gmail.com'),
       ('GV004','Trần Hoài Thương','tht@gmail.com'),
       ('GV005','Lê Thị Thảo','ltt@gmail.com');

insert into course (course_name,course_description,course_session,instructor_id)
values ('Lập trình C++','Giúp bạn nâng cao lập trình',21,'GV001'),
       ('Lập trình Python','Nâng cao kĩ năng',15,'GV002'),
       ('Cơ sở dữ liệu','Thao tác với dữ liệu',30,'GV003'),
       ('Nhập môn phần mềm','Giới thiệu vè phần mềm',17,'GV004'),
       ('Tạo web cơ bản','Làm quen với web',10,'GV005');
       
insert into enrollment (date_register,student_id,course_id)
values ('2026-01-20','SV001',2);

insert into score (student_id,course_id,midterm_score,final_score)
values ('SV001',1,9.4,8.5);

update student
set student_email = 'aaa@gmail.com' 
where student_id = 'SV001';

update course
set course_description = 'Hãy học theo tôi'
where course_id = 5;

update score
set midterm_score = 10
where student_id = 'SV001' and  course_id = 1;

delete from score
where student_id = 'SV001' and  course_id = 1;

select student_id,student_name,student_birthday,student_email
from student;

select instructor_id,instructor_name,instructor_email
from instructor;

select course_id,course_name,course_description,course_session,instructor_id
from course;

select date_register,student_id,course_id
from enrollment;

select student_id,course_id,midterm_score,final_score
from score;