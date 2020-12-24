
CREATE TABLE Teacher (
  teacher_id int IDENTITY(1,1) PRIMARY KEY,
  firstName nvarchar(100) NOT NULL,
  lastName nvarchar(100) NOT NULL,
  gender nvarchar(50) NOT NULL,
  subject_ nvarchar(100) not NULL
);


CREATE TABLE Pupil (
  pupil_id int IDENTITY(1,1) PRIMARY KEY,
  firstName nvarchar(100) NOT NULL,
  lastName nvarchar(100) NOT NULL,
  gender nvarchar(50) NOT NULL,
  class int not NULL
);
CREATE TABLE teacher_pupil (
  t_id int NOT NULL,
  p_id int NOT NULL,
  FOREIGN KEY (t_id) REFERENCES Teacher (teacher_id) ON DELETE cascade ON UPDATE CASCADE,
  FOREIGN KEY (p_id) REFERENCES Pupil (pupil_id) ON DELETE cascade ON UPDATE CASCADE,
  PRIMARY KEY (t_id, p_id)
);

INSERT INTO Teacher VALUES ('teacher1','t_lastName1','t_gender1','t_subject1');
INSERT INTO Teacher VALUES ('teacher2','t_lastName2','t_gender2','t_subject2');
INSERT INTO Teacher VALUES ('teacher3','t_lastName3','t_gender3','t_subject3');
INSERT INTO Teacher VALUES ('teacher4','t_lastName4','t_gender4','t_subject4');

INSERT INTO Pupil VALUES ('pupil1','p_lastName1','p_gender1',7);
INSERT INTO Pupil VALUES ('pupil2','p_lastName2','p_gender2',2);
INSERT INTO Pupil VALUES ('pupil3','p_lastName3','p_gender3',6);
INSERT INTO Pupil VALUES ('pupil4','p_lastName4','p_gender4',8);
INSERT INTO Pupil VALUES ('pupil5','p_lastName5','p_gender5',9);
INSERT INTO Pupil VALUES ('pupil6','p_lastName6','p_gender6',12);
INSERT INTO Pupil VALUES ('გიორგი','p_lastName7','p_gender7',10);
INSERT INTO Pupil VALUES ('გიორგი','p_lastName8','p_gender8',11);
INSERT INTO Pupil VALUES ('გიორგი','p_lastName9','p_gender9',12);

INSERT INTO teacher_pupil VALUES (1, 3);
INSERT INTO teacher_pupil VALUES (1, 4);
INSERT INTO teacher_pupil VALUES (3, 2);
INSERT INTO teacher_pupil VALUES (2, 6);
INSERT INTO teacher_pupil VALUES (2, 7);
INSERT INTO teacher_pupil VALUES (2, 8);
INSERT INTO teacher_pupil VALUES (3, 9);
INSERT INTO teacher_pupil VALUES (1, 7);


select * from teacher_pupil
select * from Teacher
select * from Pupil


select * from Teacher
where Teacher.teacher_id in(
	select teacher_pupil.t_id from teacher_pupil
	where teacher_pupil.p_id in (
	select Pupil.pupil_id from Pupil
	where Pupil.firstName='გიორგი'
	)
)

