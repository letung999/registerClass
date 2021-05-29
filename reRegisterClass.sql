
use RegisterClass
create database RegisterClass

create table Department(
idDepartment varchar(10) not null primary key,
nameDepartment nvarchar(100) not null,
phoneNumber varchar(20) not null,
)
go
create table Teacher(
idTeacher int not null primary key,
idDepartment varchar(10) not null,
nameTeacher varchar(100) not null,
salary decimal(5, 2),
constraint FK_DeT foreign key(idDepartment) references Department(idDepartment)
)
go
create table Student(
idStudent int not null primary key,
idDepartment varchar(10) not null,
fullName nvarchar(100) not null,
dob date not null,
address nvarchar(100) not null,
constraint FK_DeS foreign key (idDepartment) references Department(idDepartment)
)
go
create table topic(
idTopic varchar(20) not null primary key,
nameTopic varchar(200) not null,
fee float not null,
placePractice nvarchar(100) not null,
)

create table tutorial(
idStudent int not null,
idTopic varchar(20) not null,
idTeacher int not null,
mark decimal(5, 2) not null
constraint FK_TS foreign key(idStudent) references Student(idStudent),
constraint FK_TP foreign key (idTopic) references Topic(idTopic),
constraint FK_TT foreign key (idTeacher) references Teacher(idTeacher)
)

insert into topic values
('TP1','xe Do Line' ,100, 'FPT'),
('TP2','He Thong Loc Nuoc' ,300, 'Bosch'),
('TP3','He Thong Web Ban Hang' ,100, 'Nash Tech'),
('TP4','He Thong Xu li Nuoc Thai' ,500, 'FPT'),
('TP5','ROBOT' ,700, 'Renasat'),
('TP6','He Thong Quan Li Chuoi Cua Hang' ,400, 'Beamin'),
('TP7','He Thong Ban Co Phieu' ,500, 'FPT'),
('TP8','Quan Li He Thong San Giao Dich' ,150, 'Axon'),
('TP9','Xay Dung He Thong Dang Ki Mon Hoc' ,250, 'FPT')

insert into Department values
('K1', 'Cong Nghe Thong Tin', '0905587389'),
('K2', 'Cong Nghe Ky Thuat Dien Dien Tu', '0905587389'),
('K3', 'Dien Tu Vien Thong', '0905587389'),
('K4', 'An Toan Thong Tin', '0905587389'),
('K5', 'Cong Nghe Da Phuong Tien', '0905587389'),
('K6', 'Quan Tri Kinh Doanh', '0905587389'),
('K7', 'Ke Toan', '0905587389'),
('K8', 'Vien Thong', '0905587389')

insert into Teacher values
(10, 'K1', 'Nguyen Thi Thu Hang',100),
(11, 'K2', 'Tran Thi Thu Lan',150),
(12, 'K3', 'Trinh Le Phuong',200),
(13, 'K4', 'Nguyen Hanh Trang',180),
(14, 'K5', 'Dam Thu Trang',140),
(15, 'K6', 'Nguyen Viet Hung',150),
(16, 'K7', 'Lam Thi Thu Huong',190),
(17, 'K8', 'Thai Thi Thanh Thuy',300),
(18, 'K7', 'Nguyen Doan Hoang Long',500),
(19, 'K6', 'La Quoc Tuan',100),
(20, 'K2', 'Nguyen Thi Thuy Nga',280)


insert into Student values
(101 ,'K1', 'Le Quang Tung', '2020-11-01','Quang Ngai'),
(102 ,'K1', 'Nguyen Hoang Nam', '2020-05-30','Quang Nam'),
(103 ,'K2', 'Nguyen Quoc Chi', '2020-09-02','Ha Noi'),
(104, 'K3', 'Nguyen Hoang Viet', '2020-11-01','Tp Ho Chi Minh'),
(105 ,'K3', 'Nguyen Quoc Trung', '2020-07-03','Tp Ho Chi Minh'),
(106 ,'K4', 'Nguyen Viet Hoang', '2020-12-01','Ha Noi'),
(107 ,'K5', 'Nguyen Hoang Long', '2020-09-01','Quang Binh'),
(108 ,'K6', 'Van Thai Bang', '2020-02-01','Quang Tri'),
(109 ,'K7', 'Lam Tung Duong', '2020-10-01','Da Nang'),
(110 ,'K8', 'Thai Thuy Linh', '2020-04-01','Hue')


insert into tutorial values
(101, 'TP1', 10, 9.01),
(102, 'TP2', 10, 8.01),
(103, 'TP2', 10, 7.01),
(104, 'TP1', 10, 5.01),
(105, 'TP2', 10, 8.01),
(106, 'TP1', 10, 6.01),
(107, 'TP7', 10, 4.01),
(108, 'TP8', 10, 9.01)

delete from tutorial
select * from tutorial
update tutorial set idStudent = 106 where idTopic = 'TP3'
/*
Đưa ra thông tin gồm mã số, họ tênvà tên khoa của tất cả các giảng viên
Đưa ra thông tin gồm mã số, họ tênvà tên khoa của các giảng viên của khoa ‘Cong Nghe Thong Tin Cong Nghe Ky Thuat Dien Dien Tu’
Cho biết số sinh viên của khoa ‘Cong Nghe Thong Tin’
Đưa ra danh sách gồm mã số, họ tênvà tuổi của các sinh viên khoa ‘Cong Nghe Thong Tin’
Cho biết số giảng viên của khoa ‘Cong Nghe Thong Tin’
Cho biết thông tin về sinh viên không tham gia thực tập
Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa
Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le Quang Tung’ đang theo học*/


select t.idTeacher[ID Teacher], t.nameTeacher[Name Teacher], d.nameDepartment[Name Department]
from Teacher as t, Department as d
where d.idDepartment = t.idDepartment
group by t.idTeacher, t.nameTeacher, d.nameDepartment
-------------------------------------------------------------------------------------------------------------------------
select t.idTeacher[ID Teacher], t.nameTeacher[Name Teacher],d.nameDepartment[Name Department] 
from Teacher as t, Department as d
where t.idDepartment = d.idDepartment
and d.nameDepartment = 'Quan Tri Kinh Doanh'
group by t.idTeacher, t.nameTeacher,d.nameDepartment
---------------------------------------------------------------------------------------------------------------------------
select s.fullName, d.nameDepartment, count(s.idDepartment) from Student as s, Department as d
where s.idDepartment = d.idDepartment and d.nameDepartment ='Cong Nghe Thong Tin'
group by s.fullName, d.nameDepartment
---------------------------------------------------------------------------------------------------------------------------
select s.idStudent, s.fullName, s.dob from Student as s, Department as d
where s.idDepartment = d.idDepartment and d.nameDepartment ='Cong Nghe Thong tin'
---------------------------------------------------------------------------------------------------------------------------
select count(t.idTeacher) from Teacher as t, Department as d
where t.idDepartment = d.idDepartment and d.nameDepartment ='Cong Nghe Ky Thuat Dien Dien Tu'
---------------------------------------------------------------------------------------------------------------------------
select s.fullName from Student as s
where s.idStudent not in(select t.idStudent from tutorial as t)
----------------------------------------------------------------------------------------------------------------------------
select d.nameDepartment, d.idDepartment, COUNT(t.idTeacher) as [Number Teacher For Department ]
from Department as d, Teacher as t
where d.idDepartment = t.idDepartment
group by d.nameDepartment, d.idDepartment
-----------------------------------------------------------------------------------------------------------------------------
select d.phoneNumber [Phone Number For Department]  from Department as d, Student as s
where s.idDepartment = d.idDepartment and s.fullName ='Le Quang Tung'

/*Cho biết mã số và tên của các đề tài do giảng viên 'Nguyen Thi Thu Hang' hướng dẫn
Cho biết tên đề tài không có sinh viên nào thực tập
Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 2 sinh viên trở lên.
Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất
Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập
Đưa ra mã số, họ tên và điểm của các sinh viên khoa 'Cong Nghe Thong Tin'
Đưa ra tên khoa, số lượng sinh viên của mỗi khoa
Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập
Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập dưới 7.0*/

select t.idTopic, t.nameTopic from Teacher as te,topic as t
inner join tutorial as tu on tu.idTopic = t.idTopic
where tu.idTeacher = te.idTeacher and te.nameTeacher = 'Nguyen Thi Thu Hang'
------------------------------------------------------------------------------------------------------------
select t.nameTopic from topic as t where (t.idTopic not in(select tu.idTopic from tutorial as tu))
------------------------------------------------------------------------------------------------------------
select te.idDepartment, te.nameTeacher, de.nameDepartment 
from  tutorial as tu,Teacher as te
inner join Department as de on de.idDepartment = te.idDepartment
where te.idTeacher = tu.idTeacher
group by te.idDepartment, te.nameTeacher, de.nameDepartment 
having COUNT(tu.idTeacher) > 2
--------------------------------------------------------------------------------------------------------------
declare @max_fee int
select @max_fee = (select max(t.fee) from topic as t)
select t.nameTopic from topic as t
where t.fee = @max_fee
--------------------------------------------------------------------------------------------------------------
select t.idTopic, t.nameTopic from topic as t
inner join tutorial as tu on tu.idTopic = t.idTopic
group by t.idTopic, t.nameTopic
having count(tu.idTopic) > 1
----------------------------------------------------------------------------------------------------------------
select s.idStudent, s.fullName  from Student as s
inner join Department as d on d.idDepartment = s.idDepartment
where d.nameDepartment = 'Cong Nghe Thong Tin'
-----------------------------------------------------------------------------------------------------------------
select d.nameDepartment[Name Department],count(s.idStudent) as [Number Student for Deparment]  from Department as d
inner join Student as s on s.idDepartment = d.idDepartment
group by  d.nameDepartment
------------------------------------------------------------------------------------------------------------------
select s.idStudent, s.fullName from Student as s
where s.idStudent not in (select t.idStudent from tutorial as t)
------------------------------------------------------------------------------------------------------------------
select s.idStudent, s.fullName, t.mark from Student as s
inner join tutorial as t on t.idStudent = s.idStudent
where t.mark < 7.0
group by  s.idStudent, s.fullName, t.mark 
order by t.mark desc
