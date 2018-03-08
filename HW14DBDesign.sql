IF EXISTS (SELECT * FROM sys.databases WHERE name = 'College')
 DROP DATABASE College
 GO

create database College
Go

Use College
Go

create table Students(
ID int identity(1,1) Not Null CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED, 
FName varchar(30) Not Null,
LName varchar(30) Not Null,
SSN int Not Null,
[Address] varchar(30) Not Null,
City varchar(30) Not Null,
[State] varchar(10) Not Null,
Zip int Not Null,
PhoneNbr varchar(10)
)

create table Classes(
ID int identity(1,1) Not null constraint [PK_Class] PRIMARY KEY CLUSTERED, 
Title varchar(30) Not Null,
Number int Not Null,
Department varchar(30) Not Null,
Students_ID int CONSTRAINT FK_Classes_Students FOREIGN KEY (Students_ID)     
    REFERENCES dbo.Students(ID)
)

create table Scores(
ID int identity(1,1) Not null constraint [PK_Score] PRIMARY KEY CLUSTERED, 
[Type] varchar(30) Not Null,
[Description] varchar(30) Not Null,
DateAssigned datetime Not Null,
DateDue datetime Not Null,
DateSubmitted datetime Not Null,
PointsEarned int Not Null,
PointsPossible int Not Null,
Classes_ID int CONSTRAINT FK_Scores_Classes FOREIGN KEY (Classes_ID)     
    REFERENCES dbo.Classes(ID)
)


--Populate with sample data
insert into Students(FName, LName, SSN, [Address], City, [State], Zip, PhoneNbr) 
values ('Bob','Barker', 123456789, 'Barker Lane', 'Sin City', 'OH', 44070, '2165551212' ),
	   ('John', 'Doe', 234567891, 'Doe Lane', 'Sin City', 'OH', 44070, '2165551212' ),
	   ('Sally', 'Jones', 345678912, 'Jones', 'Sin City', 'OH', 44070, '2165551212' )

insert into Classes(Title, Number, Department, Students_ID) 
values ('Algebra', 101, 'Math', 1),
       ('Geometry', 102, 'Math', 2),
	   ('Trigonometry', 103, 'Math', 3),
	   ('American History', 104, 'History', 3),
	   ('Native American History', 105, 'History', 1),
	   ('African History', 106, 'History', 2)

insert into Scores([Type], [Description], DateAssigned, DateDue, DateSubmitted, PointsEarned, [PointsPossible], Classes_ID) 
values ('HW', 'Home Work', '20180202', '20180209', '20180210', 100, 100, 2),
       ('Quiz', 'Quiz1',  '20180202', '20180209', '20180210', 80, 100, 1),
	   ('Quiz', 'Quiz2',  '20180202', '20180209', '20180210', 70, 100, 3)


--Display Tables
select * from students
select * from classes
select * from scores