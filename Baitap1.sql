-- bỏ database
drop database if exists fresher_training_management;
-- tạo database mới
create database if not exists fresher_training_management;
-- sử dụng database cụ thể
use fresher_training_management;


-- tạo bảng Trainee
create table trainee(
    TraineeID INT PRIMARY KEY auto_increment NOT NULL,
    Full_Name VARCHAR(50) NOT NULL,
    Birth_Date Date NOT NULL,
    Gender ENUM('male', 'female', 'unknown'),
    ET_IQ tinyint check(ET_IQ >= 0 AND ET_IQ <=20),
    ET_Gmath tinyint check(ET_Gmath >= 0 AND ET_Gmath <=20),
    ET_English tinyint check(ET_English >= 0 AND ET_English <=50),
    Training_Class VARCHAR(50) NOT NULL,
    Evaluation_Notes VARCHAR(250)
);


-- thêm cột VTI_Account vào bảng Trainee
ALTER TABLE Trainee
ADD VTI_Account VARCHAR(50) NOT NULL UNIQUE;
