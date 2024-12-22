-- Создание таблицы факультетов
CREATE TABLE Faculties (
    FacultyID SERIAL PRIMARY KEY,
    FacultyName VARCHAR(100) NOT NULL
);

-- Создание таблицы дисциплин
CREATE TABLE Disciplines (
    DisciplineID SERIAL PRIMARY KEY,
    DisciplineName VARCHAR(100) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);

-- Создание таблицы преподавателей
CREATE TABLE Teachers (
    TeacherID SERIAL PRIMARY KEY,
    TeacherName VARCHAR(100) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);

-- Создание таблицы учебных групп
CREATE TABLE StudyGroups (
    GroupID SERIAL PRIMARY KEY,
    GroupName VARCHAR(50) NOT NULL,
    FacultyID INT NOT NULL,
    FOREIGN KEY (FacultyID) REFERENCES Faculties(FacultyID)
);

-- Создание таблицы расписания занятий
CREATE TABLE Schedule (
    ScheduleID SERIAL PRIMARY KEY,
    DisciplineID INT NOT NULL,
    TeacherID INT NOT NULL,
    GroupID INT NOT NULL,
    RoomNumber VARCHAR(10) NOT NULL,
    LessonDate DATE NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL,
    FOREIGN KEY (DisciplineID) REFERENCES Disciplines(DisciplineID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID),
    FOREIGN KEY (GroupID) REFERENCES StudyGroups(GroupID)
);
-- Добавление факультетов
INSERT INTO Faculties (FacultyName) VALUES ('Факультет математики'), ('Факультет информатики');

-- Добавление дисциплин
INSERT INTO Disciplines (DisciplineName, FacultyID) VALUES 
('Математический анализ', 1),
('Программирование', 2);

-- Добавление преподавателей
INSERT INTO Teachers (TeacherName, FacultyID) VALUES 
('Иванов И.И.', 1),
('Петров П.П.', 2);

-- Добавление учебных групп
INSERT INTO StudyGroups (GroupName, FacultyID) VALUES 
('МАТ-101', 1),
('ИНФ-201', 2);

-- Добавление расписания занятий
INSERT INTO Schedule (DisciplineID, TeacherID, GroupID, RoomNumber, LessonDate, StartTime, EndTime) VALUES
(1, 1, 1, '101', '2024-12-10', '09:00', '10:30'),
(2, 2, 2, '202', '2024-12-10', '11:00', '12:30');
