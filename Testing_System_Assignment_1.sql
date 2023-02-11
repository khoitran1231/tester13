

drop database if exists testing_system;

create database if not exists testing_system;

use testing_system;


drop table if exists department;


-- table 1
create table department (
	DepartmentID tinyint primary key auto_increment,
    DepartmentName VARCHAR(50) NOT NULL unique
);

-- table 2
create table `position` (
	PositionID tinyint primary key auto_increment,
    PositionName enum('Dev', 'Test', 'Scrum Master', 'PM')
);

drop table `account`;


-- table 3
create table `account` (
	AccountID smallint primary key auto_increment,
    Email VARCHAR(50) unique NOT NULL,
    Username VARCHAR(50) unique not null,
    FullName VARCHAR(100),
    DepartmentID tinyint, constraint account_department_fk foreign key(DepartmentID) references department(DepartmentID),
    PositionID tinyint, constraint account_position_fk foreign key(PositionID) references `position`(PositionID),
    CreateDate Date
    -- constraint foreign key(DepartmentID) references department(DepartmentID)
);

-- table 4
create table `group` (
	GroupID tinyint primary key auto_increment,
    GroupName VARCHAR(100) NOT NULL UNIQUE,
    CreatorID int,
    CreateDate Date not null
);


-- table 5
create table groupaccount (
	GroupID tinyint primary key auto_increment, constraint groupaccount_group_fk foreign key(GroupID) references `group`(GroupID),
    AccountID smallint unique auto_increment, constraint groupaccount_account_fk foreign key(AccountID) references `account`(AccountID),
    JoinDate date not null
);


-- table 6
create table typequestion(
	TypeID tinyint primary key auto_increment,
    TypeName enum('Essay', 'Multiple-Choice')
);


-- table 7
create table categoryquestion(
	CategoryID tinyint primary key auto_increment,
    CategoryName VARCHAR(50) not null
);


-- table 8
create table question(
	QuestionID tinyint primary key auto_increment,
    Content VARCHAR(250) not null,
    CategoryID tinyint, constraint question_categoryquestion_fk foreign key(CategoryID) references categoryquestion(CategoryID),
    TypeID tinyint, constraint question_typequestion_fk foreign key(TypeID) references typequestion(TypeID),
    CreatorID tinyint not null, constraint question_group_fk foreign key(CreatorID) references `group`(CreatorID),
    CreateDate date not null
);


-- table 9
create table answer(
	AnswerID tinyint primary key auto_increment,
    Content varchar(250) not null,
    QuestionID tinyint, constraint answer_question_fk foreign key(QuestionID) references question(QuestionID),
    isCorrect enum('true', 'false')
);


-- table 10
create table exam(
	ExamID tinyint primary key auto_increment,
    `Code` tinyint not null,
    Title varchar(50) not null,
    CategoryID tinyint,
    Duration time,
    CreatorID tinyint not null,
    CreatorDate date
);


-- table 11
create table examquestion(
	ExamID tinyint, constraint examquestion_exam_fk foreign key(ExamID) references exam(ExamID),
    QuestionID tinyint, constraint examquestion_question_fk foreign key(QuestionID) references question(QuestionID)
);