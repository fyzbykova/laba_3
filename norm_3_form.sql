-- Создание Hub для факультетов
CREATE TABLE Hub_Faculty (
    FacultyHashKey UUID PRIMARY KEY, -- Хеш-ключ факультета
    FacultyBusinessKey SERIAL NOT NULL UNIQUE, -- Бизнес-ключ факультета
    LoadDateTime TIMESTAMP NOT NULL, -- Дата и время загрузки
    RecordSource VARCHAR(50) NOT NULL -- Источник записи
);

-- Создание Hub для дисциплин
CREATE TABLE Hub_Discipline (
    DisciplineHashKey UUID PRIMARY KEY,
    DisciplineBusinessKey SERIAL NOT NULL UNIQUE,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL
);

-- Создание Hub для преподавателей
CREATE TABLE Hub_Teacher (
    TeacherHashKey UUID PRIMARY KEY,
    TeacherBusinessKey SERIAL NOT NULL UNIQUE,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL
);

-- Создание Hub для учебных групп
CREATE TABLE Hub_StudyGroup (
    GroupHashKey UUID PRIMARY KEY,
    GroupBusinessKey SERIAL NOT NULL UNIQUE,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL
);

-- Создание Link для связи между факультетами и дисциплинами
CREATE TABLE Link_Faculty_Discipline (
    LinkHashKey UUID PRIMARY KEY, -- Хеш-ключ связи
    FacultyHashKey UUID NOT NULL,
    DisciplineHashKey UUID NOT NULL,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    FOREIGN KEY (FacultyHashKey) REFERENCES Hub_Faculty(FacultyHashKey),
    FOREIGN KEY (DisciplineHashKey) REFERENCES Hub_Discipline(DisciplineHashKey)
);

-- Создание Link для связи между преподавателями и дисциплинами
CREATE TABLE Link_Teacher_Discipline (
    LinkHashKey UUID PRIMARY KEY,
    TeacherHashKey UUID NOT NULL,
    DisciplineHashKey UUID NOT NULL,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    FOREIGN KEY (TeacherHashKey) REFERENCES Hub_Teacher(TeacherHashKey),
    FOREIGN KEY (DisciplineHashKey) REFERENCES Hub_Discipline(DisciplineHashKey)
);

-- Создание Link для связи между группами и дисциплинами
CREATE TABLE Link_Group_Discipline (
    LinkHashKey UUID PRIMARY KEY,
    GroupHashKey UUID NOT NULL,
    DisciplineHashKey UUID NOT NULL,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    FOREIGN KEY (GroupHashKey) REFERENCES Hub_StudyGroup(GroupHashKey),
    FOREIGN KEY (DisciplineHashKey) REFERENCES Hub_Discipline(DisciplineHashKey)
);

-- Создание Satellite для факультетов
CREATE TABLE Sat_Faculty (
    FacultyHashKey UUID NOT NULL,
    FacultyName VARCHAR(100) NOT NULL,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    PRIMARY KEY (FacultyHashKey, LoadDateTime),
    FOREIGN KEY (FacultyHashKey) REFERENCES Hub_Faculty(FacultyHashKey)
);

-- Создание Satellite для дисциплин
CREATE TABLE Sat_Discipline (
    DisciplineHashKey UUID NOT NULL,
    DisciplineName VARCHAR(100) NOT NULL,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    PRIMARY KEY (DisciplineHashKey, LoadDateTime),
    FOREIGN KEY (DisciplineHashKey) REFERENCES Hub_Discipline(DisciplineHashKey)
);

-- Создание Satellite для преподавателей
CREATE TABLE Sat_Teacher (
    TeacherHashKey UUID NOT NULL,
    TeacherName VARCHAR(100) NOT NULL,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    PRIMARY KEY (TeacherHashKey, LoadDateTime),
    FOREIGN KEY (TeacherHashKey) REFERENCES Hub_Teacher(TeacherHashKey)
);

-- Создание Satellite для учебных групп
CREATE TABLE Sat_StudyGroup (
    GroupHashKey UUID NOT NULL,
    GroupName VARCHAR(50) NOT NULL,
    LoadDateTime TIMESTAMP NOT NULL,
    RecordSource VARCHAR(50) NOT NULL,
    PRIMARY KEY (GroupHashKey, LoadDateTime),
    FOREIGN KEY (GroupHashKey) REFERENCES Hub_StudyGroup(GroupHashKey)
);
