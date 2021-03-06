DROP DATABASE IF EXISTS ReportsDB;
CREATE DATABASE ReportsDB;
USE ReportsDB;

CREATE TABLE User (
  userID INT NOT NULL AUTO_INCREMENT,
  identification INT NOT NULL,
  name VARCHAR(250) NOT NULL,
  PRIMARY KEY (userID)
);

CREATE TABLE Course (
  courseID INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  PRIMARY KEY (courseID)
);

CREATE TABLE Report (
  reportID INT NOT NULL AUTO_INCREMENT,
  user INT NOT NULL,
  course INT NOT NULL,
  server VARCHAR(100) NULL,
  currentDate DATE NULL,
  detail VARCHAR(250) NOT NULL,
  PRIMARY KEY (reportID),
  FOREIGN KEY (user) REFERENCES User(userID),
  FOREIGN KEY (course) REFERENCES Course(courseID)
);

-- ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY MYSQL_ROOT_PASSWORD;