create table User(userId int primary key,username varchar(10),userpicture BLOB);

create table Role(roleid int primary key,roletitle varchar(10));

Create table UserhasRole (UserId int,roleid int,primary key(Userid,roleid),foreign key(UserId) references User(userId)
 on delete cascade,foreign key(roleid) references Role(roleid) on delete cascade);

create table State(stateid int primary key,StateCode varchar(5),statename varchar(10));

create table Picture (pictureid int primary key,businessid int,picture BLOB,foreign key(businesssid) 
references Business(BusinessId) on delete cascade);

create table Business(BusinessId int primary key,BusinessName varchar(10),BusinessDetail varchar(10),Businesstell int,
BusinessUrl varchar(30),Street varchar(10),City varchar(10),zipcode varchar(10),StateId int,Haswifi char(3),
Hasparking varchar(3),foreign key(StateId) references State(stateid) on delete cascade);

create table Review(ReviewID int, UserID int,ModeratorID int,BusinessID int,ReviewText varchar(10),ReviewRating int,
ReviewStatus varchar(10),foreign key(UserId) references User(UserId) on delete cascade,
foreign key(ModeratorId) references User(UserId) on delete cascade,foreign key(BusinessId) references Business(BusinessId)
 on delete cascade);

create table schedule (scheduleid int primary key,BusinessId int, day date,FromHour time,EndHour time,
foreign key(BusinessId) references Business(BusinessId) on delete cascade);

create table Tag (TagId int primary key,Tagtext varchar(10));

create table BusinesshasTag ( BusinessId int,TagId int, foreign key(BusinessId) references Business(BusinessId) 
on delete cascade,foreign key(TagId) references Tag(TagId) on delete cascade);

INSERT User (userId, username, userpicture) VALUES (1, N'Alyssa', NULL);
INSERT User (userId, username, userpicture) VALUES (2, N'Jess', NULL);
INSERT User (userId, username, userpicture) VALUES (3, N'Jake', NULL);
INSERT User (userId, username, userpicture) VALUES (4, N'Tanner', NULL);
INSERT User (userId, username, userpicture) VALUES (5, N'Olivia', NULL);

INSERT Role (roleid, roletitle) VALUES (1, N'Admin');
INSERT Role (roleid, roletitle) VALUES (2, N'User');
INSERT Role (roleid, roletitle) VALUES (3, N'Developer');
INSERT Role (roleid, roletitle) VALUES (4, N'BA');
INSERT Role (roleid, roletitle) VALUES (5, N'SuperUser');

INSERT UserhasRole (UserId, roleid) VALUES (1, 1);
INSERT UserhasRole (UserId, roleid) VALUES (1, 2);
INSERT UserhasRole (UserId, roleid) VALUES (2, 3);
INSERT UserhasRole (UserId, roleid) VALUES (3, 3);
INSERT UserhasRole (UserId, roleid) VALUES (4, 5);
INSERT UserhasRole (UserId, roleid) VALUES (5, 1);

INSERT State (stateid, StateCode, statename) VALUES (1, N'CO', N'Colorado');
INSERT State (stateid, StateCode, statename) VALUES (2, N'CA', N'California');
INSERT State (stateid, StateCode, statename) VALUES (3, N'FL', N'Flordia');

INSERT Business (BusinessId, BusinessName, BusinessDetail, Businesstell, BusinessUrl, Street, City, zipcode, 
StateId, Haswifi, Hasparking) VALUES (1, N'Consultant', N'Imigration', 2, N'www.test.com', N'3 Nortan', N'NY', 
N'78654', 1, N'1 ', N'1');
INSERT Business (BusinessId, BusinessName, BusinessDetail, Businesstell, BusinessUrl, Street, City, zipcode, 
StateId, Haswifi, Hasparking) VALUES (2, N'Finance', N'LoanLender', 1, N'www.fin.com', N'4 Jordan', N'CA', 
N'23456', 2, N'1 ', N'0');

INSERT Picture (pictureid, businessid, picture) VALUES (1, 1, NULL);
INSERT Picture (pictureid, businessid, picture) VALUES (2, 2, NULL);

INSERT Review (ReviewID, UserID, ModeratorID, BusinessID, ReviewText, ReviewRating, ReviewStatus) 
VALUES (1, 1, 1, 1, N'Better', 3, N'Average');
INSERT Review (ReviewID, UserID, ModeratorID, BusinessID, ReviewText, ReviewRating, ReviewStatus) 
VALUES (2, 2, 1, 2, N'Good', 2, N'Good');
INSERT Review (ReviewID, UserID, ModeratorID, BusinessID, ReviewText, ReviewRating, ReviewStatus) 
VALUES (3, 1, 2, 2, N'Average', 4, N'Average');
INSERT Review (ReviewID, UserID, ModeratorID, BusinessID, ReviewText, ReviewRating, ReviewStatus)
 VALUES (4, 2, 2, 1, N'Best', 1, N'Best');

INSERT schedule (scheduleid, BusinessId, day, FromHour, EndHour) VALUES (1, 1, CAST(N'2017-01-01' AS Date), 
CAST(N'01:40:11.9430000' AS Time), CAST(N'23:40:11.9430000' AS Time));
INSERT schedule (scheduleid, BusinessId, day, FromHour, EndHour) VALUES (2, 2, CAST(N'2018-02-02' AS Date),
 CAST(N'01:40:11.9430000' AS Time), CAST(N'23:40:11.9430000' AS Time));

INSERT Tag (TagId, Tagtext) VALUES (1, N'Finance');
INSERT Tag (TagId, Tagtext) VALUES (2, N'Consultant');

INSERT BusinesshasTag (BusinessId, TagId) VALUES (1, 1);
INSERT BusinesshasTag (BusinessId, TagId) VALUES (2, 2);

