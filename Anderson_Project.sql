/* ################################################## */
/*                   CHRIS ANDERSON                   */
/*      CSCI 3222 - DATABASE MANAGEMENT SYSTEMS       */
/*              PROFESSOR MICHAELE LAWS               */
/*             SEMESTER PROJECT - TN CLUB             */
/* ################################################## */


/* ################# SETUP DATABASE ################# */

/* CREATE DATABASE */

DROP DATABASE IF EXISTS tnclub;
CREATE DATABASE tnclub;

/* SELECT DATABASE */

USE tnclub;


/* ################## SETUP TABLES ################## */

/* CREATE CLUB INFO TABLE */

DROP TABLE IF EXISTS clubInfo;
CREATE TABLE clubInfo (
	clubID INT NOT NULL AUTO_INCREMENT,
	clubName VARCHAR(50) NOT NULL,
	clubOwner VARCHAR(50) NOT NULL,
	clubHours VARCHAR(25) NOT NULL,
	clubAddress VARCHAR(50) NOT NULL,
	clubCity VARCHAR(25) NOT NULL,
	clubState CHAR(2) NOT NULL,
	clubZip INT(5) NOT NULL,
	clubPhone VARCHAR(10) NOT NULL,
	PRIMARY KEY (clubID)
	);

/* CREATE MEMBER INFO TABLE */

DROP TABLE IF EXISTS memberInfo;
CREATE TABLE memberInfo (
	memberID INT NOT NULL AUTO_INCREMENT,
	memberName VARCHAR(50) NOT NULL,
	memberJoin DATE NOT NULL,
	memberBirthday DATE NOT NULL,
	memberAddress VARCHAR(50),
	memberCity VARCHAR(25),
	memberState CHAR(2),
	memberZip INT(5),
	memberPhone VARCHAR(10),
	memberEmail VARCHAR(50),
	PRIMARY KEY (memberID)
	);

/* CREATE GROUP INFO TABLE */

DROP TABLE IF EXISTS groupInfo;
CREATE TABLE groupInfo (
	groupID INT NOT NULL AUTO_INCREMENT,
	groupMinAge INT NOT NULL,
	groupMaxAge INT NOT NULL,
	PRIMARY KEY (groupID)
	);

/* CREATE FACILITY INFO TABLE */

DROP TABLE IF EXISTS facilityInfo;
CREATE TABLE facilityInfo (
	facilityID INT NOT NULL AUTO_INCREMENT,
	facilityName VARCHAR(40),
	restrictGroupID INT NOT NULL,
	PRIMARY KEY (facilityID)
	);

/* CREATE ACTIVITY INFO TABLE */

DROP TABLE IF EXISTS activityInfo;
CREATE TABLE activityInfo (
	activityID INT NOT NULL AUTO_INCREMENT,
	activityDesc VARCHAR(40),
	facilityID INT NOT NULL,
	PRIMARY KEY (activityID)
	);

/* CREATE ACTIVITY DETAILS TABLE */

DROP TABLE IF EXISTS activityDetails;
CREATE TABLE activityDetails (
	memberActivityID INT NOT NULL AUTO_INCREMENT,
	memberActivityDate DATE NOT NULL,
	memberActivityTime TIME NOT NULL,
	memberID INT NOT NULL,
	activityID INT NOT NULL,
	PRIMARY KEY (memberActivityID)
	);

/* CREATE TRANSACTION TYPE TABLE */

DROP TABLE IF EXISTS transactionType;
CREATE TABLE transactionType (
	ttID INT NOT NULL AUTO_INCREMENT,
	ttDesc VARCHAR(25),
	ttCat VARCHAR(10),
	PRIMARY KEY (ttID)
	);
	
/* CREATE TRANSACTION DETAILS TABLE */

DROP TABLE IF EXISTS transactionDetails;
CREATE TABLE transactionDetails (
	transID INT NOT NULL AUTO_INCREMENT,
	transDate DATE NOT NULL,
	transAmount DECIMAL(5,2) NOT NULL,
	ttID INT NOT NULL,
	memberID INT,
	PRIMARY KEY (transID)
	);


/* ################## INSERT DATA ################### */

/* POPULATE CLUB INFO TABLE */

INSERT INTO clubInfo (
	clubName,
	clubOwner,
	clubHours,
	clubAddress,
	clubCity,
	clubState,
	clubZip,
	clubPhone
	) VALUES (
	"Tennessee Recreation Club",
	"Chris Anderson",
	"8AM - 8PM",
	"1234 Anywhere Street",
	"Knoxville",
	"TN",
	"37996",
	"8655551234"
	);

/* POPULATE MEMBER INFO TABLE */

INSERT INTO memberInfo (
	memberName,
	memberJoin,
	memberBirthday,
	memberAddress,
	memberCity,
	memberState,
	memberZip,
	memberPhone,
	memberEmail
	) VALUES 
	("Carol Johnson","2010-02-15","1979-09-16","4677 Farm Meadow Drive","Monterey","TN","38574","9312603741","caroljohnson@teleworm.us"),
	("Michael Freeman","2010-02-15","1988-10-13","446 Lightning Point Drive","Covington","TN","38019","9014760855","michaelfreeman@armyspy.com"),
	("Melvin Rogers","2010-05-12","1994-07-01","1490 Wiseman Street","Knoxville","TN","37917","8655236842","mrogers@armyspy.com"),
	("Judy McElroy","2011-01-27","1958-05-28","1929 Valley Street","Oliver Springs","TN","37840","8654356710","judy@dayrep.com"),
	("Sung Hart","2011-07-01","1978-01-27","3275 Raver Croft Drive","Newport","TN","37821","4236130435","SMHart@yahoo.com"),
	("Robert Humphrey","2011-12-23","1970-03-12","1933 Berkshire Circle","Knoxville","TN","37933","8656759228","robertkhumphrey@hotmail.com"),
	("Jack Watson","2012-02-23","2000-10-27","4823 Corbin Branch Road","Knoxville","TN","37917","4235466344","jwat@armyspy.com"),
	("Lorna Redding","2012-04-19","1950-01-27","98 Arlington Avenue","Knoxville","TN","37902","8659637494","reddgirl@yahoo.com"),
	("William Hodges","2012-11-8","1990-03-19","816 Spring Avenue","Powell","TN","37849","8659478552","ligganclick1990@gmail.com"),
	("Jose Coleman","2013-02-14","1969-05-22","3880 Meadowlark Road","Maryville","TN","37801","8659704326","colemanjb@teleworm.us");

/* POPULATE GROUP INFO TABLE */

INSERT INTO groupInfo (groupMinAge,groupMaxAge) VALUES ("12","18"),("19","55"),("56","115");

/* POPULATE FACILITY INFO TABLE */

INSERT INTO facilityInfo (facilityName,restrictGroupID) VALUES 
	("Main Clubhouse",""),
	("Short Order Grill",""),
	("Bar","1"),
	("Basketball Court",""),
	("Tennis Court",""),
	("Shuffle Board",""),
	("Climbing Wall",""),
	("Movie Room",""),
	("Computer Room","3"),
	("Weight Room","");

/* POPULATE ACTIVITY INFO TABLE */

INSERT INTO activityInfo (activityDesc,facilityID) VALUES
	("Enter Club","1"),
	("Order Sandwich","2"),
	("Order Salad","2"),
	("Order Beer","3"),
	("Play Basketball","4"),
	("Play Tennis","5"),
	("Play Shuffleboard","6"),
	("Climbing","7"),
	("Watch TV","8"),
	("Watch Movie","8"),
	("Use Computer","9"),
	("Play Computer Game","9"),
	("Play Video Game","9"),
	("Lift Weights","10");

/* POPULATE ACTIVITY DETAILS TABLE */

INSERT INTO activityDetails (memberActivityDate,memberActivityTime,memberID,activityID) VALUES
	("2010-02-14","161500","2","1"),
	("2010-02-14","163027","2","14"),
	("2010-04-27","181518","4","1"),
	("2010-04-27","181746","4","5"),
	("2011-06-15","141654","7","1"),
	("2011-06-15","141805","7","8"),
	("2012-01-19","200419","3","1"),
	("2012-03-30","191537","8","1"),
	("2012-03-30","191658","8","2"),
	("2012-03-30","191658","8","3"),
	("2013-02-27","103500","10","1"),
	("2013-02-27","103500","10","8");
	
/* POPULATE TRANSACTION TYPE TABLE */

INSERT INTO transactionType (ttDesc,ttCat) VALUES
	("Bill Paid","Debit"),
	("Due Collected","Credit"),
	("Tax Paid","Debit"),
	("Food Purchase","Credit");

/* POPULATE TRANSACTION DETAILS TABLE */

INSERT INTO transactionDetails (transDate,transAmount,ttID,memberID) VALUES
	("2011-02-28","19.08","1",""),
	("2011-03-15","145.73","1",""),
	("2011-03-19","50.00","2","1"),
	("2011-06-27","199.57","3",""),
	("2011-11-02","15.75","1",""),
	("2011-11-14","12.00","4","5"),
	("2012-01-15","175.19","3",""),
	("2012-04-01","36.75","4","2"),
	("2012-06-15","50.00","2","8"),
	("2012-08-20","50.00","2","9"),
	("2012-10-30","276.83","1","");


/* ################# SETUP QUERIES ################## */

/* A list of all the member names and the date they joined */

SELECT memberName,memberJoin FROM memberInfo;

/* How many members are in each age group? */

SELECT COUNT(*) AS "Age 12-18" FROM memberInfo WHERE ROUND(DATEDIFF(DATE_FORMAT(NOW(),'%Y-%m-%d'),DATE_FORMAT(memberBirthday,'%Y-%m-%d')) / 365) BETWEEN 12 AND 18;
SELECT COUNT(*) AS "Age 19-55" FROM memberInfo WHERE ROUND(DATEDIFF(DATE_FORMAT(NOW(),'%Y-%m-%d'),DATE_FORMAT(memberBirthday,'%Y-%m-%d')) / 365) BETWEEN 19 AND 55;
SELECT COUNT(*) AS "Age 56 +" FROM memberInfo WHERE ROUND(DATEDIFF(DATE_FORMAT(NOW(),'%Y-%m-%d'),DATE_FORMAT(memberBirthday,'%Y-%m-%d')) / 365) > 56;

/* The total amount of money earned from dues at the club for a specific month (pick any month, depending on the data you enter) */

SELECT SUM(transAmount) FROM transactionDetails WHERE ttID = 2 AND MONTH(transDate) = 3;

/* Names and age of all members who have used the climbing wall */

SELECT memberInfo.memberName,ROUND(DATEDIFF(DATE_FORMAT(NOW(),'%Y-%m-%d'),DATE_FORMAT(memberInfo.memberBirthday,'%Y-%m-%d')) / 365) AS "memberAge" FROM memberInfo LEFT JOIN activityDetails ON memberInfo.memberID = activityDetails.memberID WHERE activityDetails.activityID = 8;

/* The name, age and activity of members who used the club between 6pm and 8pm */

SELECT memberInfo.memberName,ROUND(DATEDIFF(DATE_FORMAT(NOW(),'%Y-%m-%d'),DATE_FORMAT(memberInfo.memberBirthday,'%Y-%m-%d')) / 365) AS "memberAge",activityInfo.activityDesc FROM memberInfo LEFT JOIN activityDetails ON memberInfo.memberID = activityDetails.memberID LEFT JOIN  activityInfo ON activityDetails.activityID = activityInfo.activityID WHERE activityDetails.memberActivityTime BETWEEN "18:00" AND "20:00";

/* A list of all members not allowed into the bar */

SELECT memberName FROM memberInfo WHERE ROUND(DATEDIFF(DATE_FORMAT(NOW(),'%Y-%m-%d'),DATE_FORMAT(memberInfo.memberBirthday,'%Y-%m-%d')) / 365) BETWEEN 12 AND 18;

/* The name and phone number of all members whose phone number begins with "423" */

SELECT memberName,memberPhone FROM memberInfo WHERE memberPhone LIKE "423%";


/* ################# END OF SCRIPT ################## */