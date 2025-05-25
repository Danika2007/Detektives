create table Tagok (
    tag_id INT PRIMARY KEY,
    nev VARCHAR(100),
    magassag INT,
    hajszin VARCHAR(50),
    munka VARCHAR(100),
    arulo BOOLEAN default FALSE
);

create table Detektivek (
    detektiv_id INT PRIMARY KEY,
    tapasztalat_ev INT,
    szuletesi_ev INT,
);

create table Allitasok (
    allitas_id INT PRIMARY KEY,
    tag_id INT,
    detektiv_id INT,
    allitas_szoveg text,
    FOREIGN KEY (tag_id) REFERENCES Tagok(tag_id),
    FOREIGN KEY (detektiv_id) REFERENCES Detektivek(detektiv_id)
);

INSERT INTO Tagok VALUES
(1, 'Anna', 165, 'barna', 'bolti eladó', FALSE),
(2, 'Csilla', 170, 'fekete', 'grafikus', FALSE),

INSERT INTO Detektivek VALUES
(1, 'Jani Holmes', 11, 1991),
(2, 'Kala Pál', 9, 1993);

INSERT INTO Allitasok VALUES
(1, 1, 1, 'Nem én vagyok az áruló. Szerintem Csilla gyanús.'),
(2, 2, 1, 'Láttam valakit éjjel kilopózni a sátorból.'),
(1, 1, 2, 'Nem emlékszem semmire.'),
(1, 2, 1, 'Szerintem a tettes rajzolással foglalkozik.');

select t.nev, a.allitas_szoveg 
from Allitasok a 
join Tagok t on a.tag_id = t.tag_id 
where a.allitas_szoveg like '%Csilla%';

select distinct d.nev from Allitasok a join Detektivek d on a.detektiv_id = d.detektiv_id;

select nev from Tagok where munka = 'grafikus';