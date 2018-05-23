-- department
insert into department values('B.S. in Computer Science', 0, 40, 10, 15, 15, 0);
insert into department values('B.A. in Philosophy', 0, 35, 15, 20, 0, 0);
insert into department values('B.S. in Mechanical Engineering', 0, 50, 20, 20, 10, 0);
insert into department values('M.S. in Computer Science', 0, 45, 0, 0, 0, 45);


-- STUDENT
insert into student values(1, 'Benjamin', NULL, 'B', 'SD', 'Undergrad', 'Yes');
insert into student values(2, 'Kristen', NULL, 'W', 'SD', 'Undergrad', 'Yes');
insert into student values(3, 'Daniel', NULL, 'F', 'SD', 'Undergrad', 'Yes');
insert into student values(4, 'Claire', NULL, 'J', 'SD', 'Undergrad', 'Yes');
insert into student values(5, 'Julie', NULL, 'C', 'SD', 'Undergrad', 'Yes');
insert into student values(6, 'Kevin', NULL, 'L', 'SD', 'Undergrad', 'Yes');
insert into student values(7, 'Michael', NULL, 'B', 'SD', 'Undergrad', 'Yes');
insert into student values(8, 'Joseph', NULL, 'J', 'SD', 'Undergrad', 'Yes');
insert into student values(9, 'Devin', NULL, 'P', 'SD', 'Undergrad', 'Yes');
insert into student values(10, 'Logan', NULL, 'F', 'SD', 'Undergrad', 'Yes');
insert into student values(11, 'Vikram', NULL, 'N', 'SD', 'Undergrad', 'Yes');
insert into student values(12, 'Rachel', NULL, 'Z', 'SD', 'Undergrad', 'Yes');
insert into student values(13, 'Zach', NULL, 'M', 'SD', 'Undergrad', 'Yes');
insert into student values(14, 'Justin', NULL, 'H', 'SD', 'Undergrad', 'Yes');
insert into student values(15, 'Rahul', NULL, 'R', 'SD', 'Undergrad', 'Yes');
insert into student values(16, 'Dave', NULL, 'C', 'SD', 'MS', 'Yes');
insert into student values(17, 'Nelson', NULL, 'H', 'SD', 'MS', 'Yes');
insert into student values(18, 'Andrew', NULL, 'P', 'SD', 'MS', 'Yes');
insert into student values(19, 'Nathan', NULL, 'S', 'SD', 'MS', 'Yes');
insert into student values(20, 'John', NULL, 'H', 'SD', 'MS', 'Yes');
insert into student values(21, 'Anwell', NULL, 'W', 'SD', 'MS', 'Yes');
insert into student values(22, 'Tim', NULL, 'K', 'SD', 'MS', 'Yes');

-- Undergrad
insert into undergrad values(1, 'Warren', 'B.S. in Computer Science', NULL, NULL);
insert into undergrad values(2, 'Warren', 'B.S. in Computer Science', NULL, NULL);
insert into undergrad values(3, 'Warren', 'B.S. in Computer Science', NULL, NULL);
insert into undergrad values(4, 'Warren', 'B.S. in Computer Science', NULL, NULL);
insert into undergrad values(5, 'Warren', 'B.S. in Computer Science', NULL, NULL);
insert into undergrad values(6, 'Warren', 'B.S. in Mechanical Engineering', NULL, NULL);
insert into undergrad values(7, 'Warren', 'B.S. in Mechanical Engineering', NULL, NULL);
insert into undergrad values(8, 'Warren', 'B.S. in Mechanical Engineering', NULL, NULL);
insert into undergrad values(9, 'Warren', 'B.S. in Mechanical Engineering', NULL, NULL);
insert into undergrad values(10, 'Warren', 'B.S. in Mechanical Engineering', NULL, NULL);
insert into undergrad values(11, 'Warren', 'B.A. in Philosophy', NULL, NULL);
insert into undergrad values(12, 'Warren', 'B.A. in Philosophy', NULL, NULL);
insert into undergrad values(13, 'Warren', 'B.A. in Philosophy', NULL, NULL);
insert into undergrad values(14, 'Warren', 'B.A. in Philosophy', NULL, NULL);
insert into undergrad values(15, 'Warren', 'B.A. in Philosophy', NULL, NULL);

-- grad
insert into grad values(16, 'MS', 'M.S. in Computer Science', NULL);
insert into grad values(17, 'MS', 'M.S. in Computer Science', NULL);
insert into grad values(18, 'MS', 'M.S. in Computer Science', NULL);
insert into grad values(19, 'MS', 'M.S. in Computer Science', NULL);
insert into grad values(20, 'MS', 'M.S. in Computer Science', NULL);
insert into grad values(21, 'MS', 'M.S. in Computer Science', NULL);
insert into grad values(22, 'MS', 'M.S. in Computer Science', NULL);

-- course
insert into course values('CSE8A', 'B.S. in Computer Science', 'S/U', 'lower', 'no', 4, 4);
insert into course values('CSE105', 'B.S. in Computer Science', 'letter', 'upper', 'no', 4, 4);
insert into course values('CSE123', 'B.S. in Computer Science', 'letter', 'upper', 'no', 4, 4);
insert into course values('CSE250A', 'M.S. in Computer Science', 'letter', 'grad', 'no', 4, 4);
insert into course values('CSE250B', 'M.S. in Computer Science', 'letter', 'grad', 'no', 4, 4);
insert into course values('CSE255', 'M.S. in Computer Science', 'letter', 'grad', 'no', 4, 4);
insert into course values('CSE232A', 'M.S. in Computer Science', 'letter', 'grad', 'no', 4, 4);
insert into course values('CSE221', 'M.S. in Computer Science', 'S/U', 'grad', 'no', 4, 4);
insert into course values('MAE3', 'B.S. in Mechanical Engineering', 'letter', 'lower', 'no', 4, 4);
insert into course values('MAE107', 'B.S. in Mechanical Engineering', 'letter', 'upper', 'no', 4, 4);
insert into course values('MAE108', 'B.S. in Mechanical Engineering', 'letter', 'upper', 'no', 2, 2);
insert into course values('PHIL10', 'B.A. in Philosophy', 'letter', 'lower', 'no', 4, 4);
insert into course values('PHIL12', 'B.A. in Philosophy', 'letter', 'lower', 'no', 4, 4);
insert into course values('PHIL165', 'B.A. in Philosophy', 'S/U', 'upper', 'no', 2, 2);
insert into course values('PHIL167', 'B.A. in Philosophy', 'letter', 'upper', 'no', 4, 4);


-- class
insert into class values('Introduction to Computer Science: Java', 'CSE8A', 'wi2017', 2017);
insert into class values('Introduction to Computer Science: Java', 'CSE8A', 'fa2017', 2017);
insert into class values('Introduction to Computer Science: Java', 'CSE8A', 'wi2018', 2018);
insert into class values('Introduction to Computer Science: Java', 'CSE8A', 'sp2018', 2018);
insert into class values('Introduction to Computer Science: Java', 'CSE8A', 'sp2019', 2019);
insert into class values('Intro to Theory', 'CSE105', 'sp2017', 2017);
insert into class values('Intro to Theory', 'CSE105', 'sp2018', 2018);
insert into class values('Intro to Theory', 'CSE105', 'fa2018', 2018);
insert into class values('Probabilistic Reasoning', 'CSE250A', 'wi2017', 2017);
insert into class values('Probabilistic Reasoning', 'CSE250A', 'wi2018', 2018);
insert into class values('Probabilistic Reasoning', 'CSE250A', 'wi2019', 2019);
insert into class values('Machine Learning', 'CSE250B', 'sp2017', 2017);
insert into class values('Machine Learning', 'CSE250B', 'fa2019', 2019);
insert into class values('Data Mining and Predictive Analytics', 'CSE255', 'wi2018', 2018);
insert into class values('Data Mining and Predictive Analytics', 'CSE255', 'sp2018', 2018);
insert into class values('Data Mining and Predictive Analytics', 'CSE255', 'wi2019', 2019);
insert into class values('Databases', 'CSE232A', 'wi2018', 2018);
insert into class values('Databases', 'CSE232A', 'sp2019', 2019);
insert into class values('Operating Systems', 'CSE221', 'fa2017', 2017);
insert into class values('Operating Systems', 'CSE221', 'sp2018', 2018);
insert into class values('Operating Systems', 'CSE221', 'fa2018', 2018);
insert into class values('Computational Methods', 'MAE107', 'fa2017', 2017);
insert into class values('Computational Methods', 'MAE107', 'sp2019', 2019);
insert into class values('Probability and Statistics', 'MAE108', 'wi2017', 2017);
insert into class values('Probability and Statistics', 'MAE108', 'sp2017', 2017);
insert into class values('Probability and Statistics', 'MAE108', 'sp2018', 2018);
insert into class values('Probability and Statistics', 'MAE108', 'fa2019', 2019);
insert into class values('Intro to Logic', 'PHIL10', 'wi2018', 2018);
insert into class values('Intro to Logic', 'PHIL10', 'wi2019', 2019);
insert into class values('Scientific Reasoning', 'PHIL12', 'sp2019', 2019);
insert into class values('Scientific Reasoning', 'PHIL12', 'sp2018', 2018);
insert into class values('Freedom, Equality, and the Law', 'PHIL165', 'fa2017', 2017);
insert into class values('Freedom, Equality, and the Law', 'PHIL165', 'wi2018', 2018);
insert into class values('Freedom, Equality, and the Law', 'PHIL165', 'sp2018', 2018);
insert into class values('Freedom, Equality, and the Law', 'PHIL165', 'sp2019', 2019);


-- faculty
insert into faculty values('Justin Bieber', 'Associate Professor');
insert into faculty values('Flo Rida', 'Professor');
insert into faculty values('Selena Gomez', 'Professor');
insert into faculty values('Adele', 'Professor');
insert into faculty values('Taylor Swift', 'Professor');
insert into faculty values('Kelly Clarkson', 'Professor');
insert into faculty values('Adam Levine', 'Professor');
insert into faculty values('Bjork', 'Professor');



-- section
insert into section values(1, 100, 'MAE108', 'sp2018', 2018, 'Adele');
insert into section values(2, 100, 'CSE221', 'sp2018', 2018, 'Kelly Clarkson');
insert into section values(3, 100, 'CSE255', 'sp2018', 2018, 'Flo Rida');
insert into section values(4, 100, 'PHIL12', 'sp2018', 2018, 'Adam Levine');
insert into section values(5, 100, 'CSE221', 'sp2018', 2018, 'Kelly Clarkson');
insert into section values(6, 100, 'CSE105', 'sp2018', 2018, 'Taylor Swift');
insert into section values(7, 100, 'PHIL165', 'sp2018', 2018, 'Adam Levine');
insert into section values(8, 100, 'MAE108', 'sp2018', 2018, 'Selena Gomez');
insert into section values(9, 100, 'CSE221', 'sp2018', 2018, 'Justin Bieber');
insert into section values(10, 100, 'CSE8A', 'sp2018', 2018, 'Adele');


-- meeting
insert into meeting values(1, 'LEC', 'M', NULL, 'W', NULL, 'F', 10, 11, 'AM', 00, 00, 'AM');
insert into meeting values(2, 'LEC', 'M', NULL, 'W', NULL, 'F', 10, 11, 'AM', 00, 00, 'AM');
insert into meeting values(3, 'LEC', 'M', NULL, 'W', NULL, 'F', 12, 1, 'PM', 00, 00, 'PM');
insert into meeting values(4, 'LEC', 'M', NULL, 'W', NULL, 'F', 12, 1, 'PM', 00, 00, 'PM');
insert into meeting values(5, 'LEC', 'M', NULL, 'W', NULL, 'F', 12, 1, 'PM', 00, 00, 'PM');
insert into meeting values(6, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 2, 3, 'PM', 00, 00, 'PM');
insert into meeting values(6, 'DIS', NULL, NULL, NULL, NULL, 'F', 6, 7, 'PM', 00, 00, 'PM');
insert into meeting values(7, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 3, 4, 'PM', 00, 00, 'PM');
insert into meeting values(8, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 3, 4, 'PM', 00, 00, 'PM');
insert into meeting values(9, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 5, 6, 'PM', 00, 00, 'PM');
insert into meeting values(10, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 5, 6, 'PM', 00, 00, 'PM');
insert into meeting values(10, 'DIS', NULL, NULL, 'W', NULL, NULL, 7, 8, 'PM', 00, 00, 'PM');
-- 24h
insert into meeting values(1, 'LEC', 'M', NULL, 'W', NULL, 'F', 10, 11, 'AM', 00, 00, 'AM');
insert into meeting values(2, 'LEC', 'M', NULL, 'W', NULL, 'F', 10, 11, 'AM', 00, 00, 'AM');
insert into meeting values(3, 'LEC', 'M', NULL, 'W', NULL, 'F', 12, 13, 'PM', 00, 00, 'PM');
insert into meeting values(4, 'LEC', 'M', NULL, 'W', NULL, 'F', 12, 13, 'PM', 00, 00, 'PM');
insert into meeting values(5, 'LEC', 'M', NULL, 'W', NULL, 'F', 12, 13, 'PM', 00, 00, 'PM');
insert into meeting values(6, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 14, 15, 'PM', 00, 00, 'PM');
insert into meeting values(6, 'DIS', NULL, NULL, NULL, NULL, 'F', 18, 19, 'PM', 00, 00, 'PM');
insert into meeting values(7, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 15, 16, 'PM', 00, 00, 'PM');
insert into meeting values(8, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 15, 16, 'PM', 00, 00, 'PM');
insert into meeting values(9, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 17, 18, 'PM', 00, 00, 'PM');
insert into meeting values(10, 'LEC', NULL, 'Tu', NULL, 'Th', NULL, 17, 18, 'PM', 00, 00, 'PM');
insert into meeting values(10, 'DIS', NULL, NULL, 'W', NULL, NULL, 19, 20, 'PM', 00, 00, 'PM');

-- takes
insert into takes values( 16, 2, 'letter', 4, 'LEC');
insert into takes values( 17, 9, 'S/U', 4, 'LEC');
insert into takes values( 18, 5, 'letter', 4, 'LEC');
insert into takes values( 19, 2, 'letter', 4, 'LEC');
insert into takes values( 20, 9, 'letter', 4, 'LEC');
insert into takes values( 21, 5, 'S/U', 4, 'LEC');
insert into takes values( 22, 3, 'letter', 4, 'LEC');
insert into takes values( 16, 3, 'letter', 4, 'LEC');
insert into takes values( 17, 3, 'letter', 4, 'LEC');
insert into takes values( 1, 10, 'S/U', 4, 'LEC');
insert into takes values( 1, 10, 'S/U', 4, 'DIS');
insert into takes values( 5, 10, 'letter', 4, 'LEC');
insert into takes values( 5, 10, 'letter', 4, 'DIS');
insert into takes values( 3, 10, 'letter', 4, 'LEC');
insert into takes values( 3, 10, 'letter', 4, 'DIS');
insert into takes values( 7, 1, 'letter', 4, 'LEC');
insert into takes values( 8, 1, 'letter', 4, 'LEC');
insert into takes values( 9, 8, 'letter', 4, 'LEC');
insert into takes values( 4, 6, 'letter', 4, 'LEC');
insert into takes values( 4, 6, 'letter', 4, 'DIS');
insert into takes values( 12, 4, 'letter', 4, 'LEC');
insert into takes values( 13, 7, 'S/U', 4, 'LEC');
insert into takes values( 14, 4, 'letter', 4, 'LEC');
insert into takes values( 15, 7, 'letter', 4, 'LEC');





-- categories
insert into categories values('TOTAL_UNIT', 'CSE8A', 'B.S. in Computer Science', NULL, 40);
insert into categories values('MAJ_UNIT_LOWDIV','CSE8A', 'B.S. in Computer Science', NULL, 10);
-- insert into categories values('GRAD_UNIT', 'CSE8A','B.S. in Computer Science', NULL, 0);

insert into categories values('TOTAL_UNIT', 'CSE105', 'B.S. in Computer Science', NULL, 40);
insert into categories values('MAJ_UNIT_UPDIV', 'CSE105', 'B.S. in Computer Science', NULL, 15);
insert into categories values('ELECTIVE', 'CSE105', 'B.S. in Computer Science', NULL, 15);
-- insert into categories values('GRAD_UNIT', 'CSE105', 'B.S. in Computer Science', NULL, 0);

insert into categories values('TOTAL_UNIT', 'CSE123', 'B.S. in Computer Science', NULL, 40);
insert into categories values('MAJ_UNIT_UPDIV', 'CSE123','B.S. in Computer Science', NULL, 15);
-- insert into categories values('GRAD_UNIT', 'CSE123', 'B.S. in Computer Science', NULL, 0);


insert into categories values('TOTAL_UNIT', 'MAE3', 'B.S. in Mechanical Engineering', NULL, 35);
insert into categories values('MAJ_UNIT_LOWDIV', 'MAE3', 'B.S. in Mechanical Engineering', NULL, 15);
insert into categories values('ELECTIVE', 'MAE3', 'B.S. in Mechanical Engineering', NULL, 0);
-- insert into categories values('GRAD_UNIT', 'MAE3', 'B.S. in Mechanical Engineering', NULL, 0);

insert into categories values('TOTAL_UNIT', 'MAE107', 'B.S. in Mechanical Engineering', NULL, 35);
insert into categories values('MAJ_UNIT_UPDIV', 'MAE107', 'B.S. in Mechanical Engineering', NULL, 20);
insert into categories values('ELECTIVE', 'MAE107', 'B.S. in Mechanical Engineering', NULL, 0);
-- insert into categories values('GRAD_UNIT', 'MAE107', 'B.S. in Mechanical Engineering', NULL, 0);


insert into categories values('TOTAL_UNIT', 'MAE108', 'B.S. in Mechanical Engineering', NULL, 35);
insert into categories values('MAJ_UNIT_UPDIV', 'MAE108', 'B.S. in Mechanical Engineering', NULL, 20);
-- insert into categories values('GRAD_UNIT', 'MAE108', 'B.S. in Mechanical Engineering', NULL, 0);


insert into categories values('TOTAL_UNIT', 'PHIL10', 'B.A. in Philosophy', NULL, 35);
insert into categories values('MAJ_UNIT_LOWDIV', 'PHIL10', 'B.A. in Philosophy', NULL, 15);
-- insert into categories values('GRAD_UNIT', 'PHIL10', 'B.A. in Philosophy', NULL, 0);

insert into categories values('TOTAL_UNIT', 'PHIL12', 'B.A. in Philosophy', NULL, 35);
insert into categories values('MAJ_UNIT_LOWDIV', 'PHIL12', 'B.A. in Philosophy', NULL, 15);
-- insert into categories values('GRAD_UNIT', 'PHIL12', 'B.A. in Philosophy', NULL, 0);

insert into categories values('TOTAL_UNIT', 'PHIL165', 'B.A. in Philosophy', NULL, 35);
insert into categories values('MAJ_UNIT_UPDIV', 'PHIL165', 'B.A. in Philosophy', NULL, 20);
-- insert into categories values('GRAD_UNIT', 'PHIL165', 'B.A. in Philosophy', NULL, 0);

insert into categories values('TOTAL_UNIT', 'PHIL167', 'B.A. in Philosophy', NULL, 50);
insert into categories values('MAJ_UNIT_UPDIV', 'PHIL167', 'B.A. in Philosophy', NULL, 20);
-- insert into categories values('GRAD_UNIT', 'PHIL167', 'B.A. in Philosophy', NULL, 0);

insert into categories values('TOTAL_UNIT', 'CSE250A', 'M.S. in Computer Science', NULL, 45);
-- insert into categories values('MAJ_UNIT_LOWDIV', 'CSE250A', 'M.S. in Computer Science', NULL, 0);
-- insert into categories values('MAJ_UNIT_UPDIV', 'CSE250A', 'M.S. in Computer Science', NULL, 0);
insert into categories values('ELECTIVE', 'CSE250A', 'M.S. in Computer Science', NULL, 0);
insert into categories values('GRAD_UNIT', 'CSE250A', 'M.S. in Computer Science', NULL, 45);

insert into categories values('TOTAL_UNIT', 'CSE250B', 'M.S. in Computer Science', NULL, 45);
-- insert into categories values('MAJ_UNIT_LOWDIV', 'CSE250B', 'M.S. in Computer Science', NULL, 0);
-- insert into categories values('MAJ_UNIT_UPDIV', 'CSE250B', 'M.S. in Computer Science', NULL, 0);
insert into categories values('GRAD_UNIT', 'CSE250B', 'M.S. in Computer Science', NULL, 45);

insert into categories values('TOTAL_UNIT', 'CSE255', 'M.S. in Computer Science', NULL, 45);
-- insert into categories values('MAJ_UNIT_LOWDIV', 'CSE255', 'M.S. in Computer Science', NULL, 0);
-- insert into categories values('MAJ_UNIT_UPDIV', 'CSE255', 'M.S. in Computer Science', NULL, 0);
insert into categories values('GRAD_UNIT', 'CSE255', 'M.S. in Computer Science', NULL, 45);

insert into categories values('TOTAL_UNIT', 'CSE232A', 'M.S. in Computer Science', NULL, 45);
-- insert into categories values('MAJ_UNIT_LOWDIV', 'CSE232A', 'M.S. in Computer Science', NULL, 0);
-- insert into categories values('MAJ_UNIT_UPDIV', 'CSE232A', 'M.S. in Computer Science', NULL, 0);
insert into categories values('GRAD_UNIT', 'CSE232A', 'M.S. in Computer Science', NULL, 45);


insert into categories values('TOTAL_UNIT', 'CSE221', 'M.S. in Computer Science', NULL, 45);
-- insert into categories values('MAJ_UNIT_LOWDIV', 'CSE221', 'M.S. in Computer Science', NULL, 0);
-- insert into categories values('MAJ_UNIT_UPDIV', 'CSE221', 'M.S. in Computer Science', NULL, 0);
insert into categories values('ELECTIVE', 'CSE221', 'M.S. in Computer Science', NULL, 0);
insert into categories values('GRAD_UNIT', 'CSE221', 'M.S. in Computer Science', NULL, 45);

-- concentration
insert into concentration values('Databases', 'M.S. in Computer Science', 'CSE232A', 3, 4);
insert into concentration values('AI', 'M.S. in Computer Science', 'CSE255', 3.1, 8);
insert into concentration values('AI', 'M.S. in Computer Science', 'CSE250A', 3.1, 8);
insert into concentration values('Systems', 'M.S. in Computer Science', 'CSE221', 3.3, 4);

-- elective
insert into elective values('CSE250A');
insert into elective values('CSE221');
insert into elective values('CSE105');
insert into elective values('MAE107');
insert into elective values('MAE3');

-- taken
insert into taken values( 1, 'CSE8A', 'wi2017', 2017, 'letter', 4, 'A-', 'Justin Bieber');
insert into taken values( 3, 'CSE8A', 'wi2017', 2017,'letter', 4, 'B+', 'Justin Bieber');
insert into taken values( 2, 'CSE8A', 'fa2017', 2017,'letter', 4, 'C-', 'Selena Gomez');
insert into taken values( 4, 'CSE8A', 'wi2018', 2018,'letter', 4, 'A-', 'Kelly Clarkson');
insert into taken values( 5, 'CSE8A', 'wi2018', 2018,'letter', 4, 'B', 'Kelly Clarkson');
insert into taken values( 1, 'CSE105', 'sp2017', 2017,'letter', 4, 'A-', 'Taylor Swift');
insert into taken values( 5, 'CSE105', 'sp2017', 2017,'letter', 4, 'B+', 'Taylor Swift');
insert into taken values( 4, 'CSE105', 'sp2017', 2017,'letter', 4, 'C', 'Taylor Swift');
insert into taken values( 16, 'CSE250A', 'wi2017', 2017,'letter', 4, 'C', 'Bjork');
insert into taken values( 22, 'CSE250A', 'wi2018', 2018,'letter', 4, 'B+', 'Bjork');
insert into taken values( 18, 'CSE250A', 'wi2018', 2018,'letter', 4, 'D', 'Bjork');
insert into taken values( 19, 'CSE250A', 'wi2018', 2018,'letter', 4, 'F', 'Bjork');
insert into taken values( 17, 'CSE250B', 'sp2017', 2017,'letter', 4, 'A', 'Justin Bieber');
insert into taken values( 19, 'CSE250B', 'sp2017', 2017,'letter', 4, 'A', 'Justin Bieber');
insert into taken values( 20, 'CSE255', 'wi2018', 2018,'letter', 4, 'B-', 'Justin Bieber');
insert into taken values( 18, 'CSE255', 'wi2018', 2018,'letter', 4, 'B', 'Justin Bieber');
insert into taken values( 21, 'CSE255', 'wi2018', 2018,'letter', 4, 'F', 'Justin Bieber');
insert into taken values( 17, 'CSE232A', 'wi2018', 2018,'letter', 4, 'A-', 'Kelly Clarkson');
insert into taken values( 22, 'CSE221', 'fa2017', 2017,'letter', 4, 'A', 'Kelly Clarkson');
insert into taken values( 20, 'CSE221', 'fa2017', 2017,'letter', 4, 'A', 'Kelly Clarkson');
insert into taken values( 10, 'MAE107', 'fa2017', 2017,'letter', 4, 'B+', 'Bjork');
insert into taken values( 8, 'MAE108', 'wi2017', 2017,'letter', 2, 'B-', 'Selena Gomez');
insert into taken values( 7, 'MAE108', 'wi2017', 2017,'letter', 2, 'A-', 'Selena Gomez');
insert into taken values( 6, 'MAE108', 'sp2017', 2017,'letter', 2, 'B', 'Selena Gomez');
insert into taken values( 10, 'MAE108', 'sp2017', 2017,'letter', 2, 'B+', 'Selena Gomez');
insert into taken values( 11, 'PHIL10', 'wi2018', 2018,'letter', 4, 'A', 'Bjork');
insert into taken values( 12, 'PHIL10', 'wi2018', 2018,'letter', 4, 'A', 'Bjork');
insert into taken values( 13, 'PHIL10', 'wi2018', 2018,'letter', 4, 'C-', 'Bjork');
insert into taken values( 14, 'PHIL10', 'wi2018', 2018,'letter', 4, 'C+', 'Bjork');
insert into taken values( 15, 'PHIL165', 'fa2017', 2017,'letter', 2, 'F', 'Flo Rida');
insert into taken values( 12, 'PHIL165', 'fa2017', 2017,'letter', 2, 'D', 'Flo Rida');
insert into taken values( 11, 'PHIL165', 'wi2018', 2018,'letter', 2, 'A-', 'Adam Levine');


-- grade_conversion
insert into grade_conversion values('A+', 4.0);
insert into grade_conversion values('A', 4.0);
insert into grade_conversion values('A-', 3.7);
insert into grade_conversion values('B+', 3.3);
insert into grade_conversion values('B', 3.0);
insert into grade_conversion values('B-', 2.7);
insert into grade_conversion values('C+', 2.3);
insert into grade_conversion values('C', 2.0);
insert into grade_conversion values('C-', 1.7);
insert into grade_conversion values('D', 1.0);
insert into grade_conversion values('F', 0.0);


-- calendar
insert into calendar values('Mon', 'April', 2);
insert into calendar values('Mon', 'April', 9);
insert into calendar values('Mon', 'April', 16);
insert into calendar values('Mon', 'April', 23);
insert into calendar values('Mon', 'April', 30);
insert into calendar values('Tue', 'April', 3);
insert into calendar values('Tue', 'April', 10);
insert into calendar values('Tue', 'April', 17);
insert into calendar values('Tue', 'April', 24);
insert into calendar values('Wed', 'April', 4);
insert into calendar values('Wed', 'April', 11);
insert into calendar values('Wed', 'April', 18);
insert into calendar values('Wed', 'April', 26);
insert into calendar values('Thu', 'April', 5);
insert into calendar values('Thu', 'April', 12);
insert into calendar values('Thu', 'April', 19);
insert into calendar values('Thu', 'April', 26);
insert into calendar values('Fri', 'April', 6);
insert into calendar values('Fri', 'April', 13);
insert into calendar values('Fri', 'April', 20);
insert into calendar values('Fri', 'April', 27);
insert into calendar values('Mon', 'May', 7);
insert into calendar values('Mon', 'May', 14);
insert into calendar values('Mon', 'May', 21);
insert into calendar values('Mon', 'May', 28);
insert into calendar values('Tue', 'May', 1);
insert into calendar values('Tue', 'May', 8);
insert into calendar values('Tue', 'May', 15);
insert into calendar values('Tue', 'May', 22);
insert into calendar values('Tue', 'May', 29);
insert into calendar values('Wed', 'May', 2);
insert into calendar values('Wed', 'May', 9);
insert into calendar values('Wed', 'May', 16);
insert into calendar values('Wed', 'May', 23);
insert into calendar values('Wed', 'May', 30);
insert into calendar values('Thu', 'May', 3);
insert into calendar values('Thu', 'May', 10);
insert into calendar values('Thu', 'May', 17);
insert into calendar values('Thu', 'May', 24);
insert into calendar values('Thu', 'May', 31);
insert into calendar values('Fri', 'May', 4);
insert into calendar values('Fri', 'May', 11);
insert into calendar values('Fri', 'May', 18);
insert into calendar values('Fri', 'May', 25);
insert into calendar values('Mon', 'June', 4);
insert into calendar values('Mon', 'JUNE', 11);
insert into calendar values('Mon', 'JUNE', 18);
insert into calendar values('Mon', 'JUNE', 25);
insert into calendar values('Tue', 'JUNE', 5);
insert into calendar values('Tue', 'JUNE', 12);
insert into calendar values('Tue', 'JUNE', 19);
insert into calendar values('Tue', 'JUNE', 26);
insert into calendar values('Wed', 'JUNE', 6);
insert into calendar values('Wed', 'JUNE', 13);
insert into calendar values('Wed', 'JUNE', 20);
insert into calendar values('Wed', 'JUNE', 27);
insert into calendar values('Thu', 'JUNE', 7);
insert into calendar values('Thu', 'JUNE', 14);
insert into calendar values('Thu', 'JUNE', 21);
insert into calendar values('Thu', 'JUNE', 28);
insert into calendar values('Fri', 'JUNE', 1);
insert into calendar values('Fri', 'JUNE', 8);
insert into calendar values('Fri', 'JUNE', 15);
insert into calendar values('Fri', 'JUNE', 22);
insert into calendar values('Fri', 'JUNE', 29);



-- reviewtime
insert into reviewtime values('Mon', 0);
insert into reviewtime values('Mon', 1);
insert into reviewtime values('Mon', 2);
insert into reviewtime values('Mon', 3);
insert into reviewtime values('Mon', 4);
insert into reviewtime values('Mon', 5);
insert into reviewtime values('Mon', 6);
insert into reviewtime values('Mon', 7);
insert into reviewtime values('Mon', 8);
insert into reviewtime values('Mon', 9);
insert into reviewtime values('Mon', 10);
insert into reviewtime values('Mon', 11);
insert into reviewtime values('Mon', 12);
insert into reviewtime values('Mon', 13);
insert into reviewtime values('Mon', 14);
insert into reviewtime values('Mon', 15);
insert into reviewtime values('Mon', 16);
insert into reviewtime values('Mon', 17);
insert into reviewtime values('Mon', 18);
insert into reviewtime values('Mon', 19);
insert into reviewtime values('Mon', 20);
insert into reviewtime values('Mon', 21);
insert into reviewtime values('Mon', 22);
insert into reviewtime values('Mon', 23);

insert into reviewtime values('Tue', 0);
insert into reviewtime values('Tue', 1);
insert into reviewtime values('Tue', 2);
insert into reviewtime values('Tue', 3);
insert into reviewtime values('Tue', 4);
insert into reviewtime values('Tue', 5);
insert into reviewtime values('Tue', 6);
insert into reviewtime values('Tue', 7);
insert into reviewtime values('Tue', 8);
insert into reviewtime values('Tue', 9);
insert into reviewtime values('Tue', 10);
insert into reviewtime values('Tue', 11);
insert into reviewtime values('Tue', 12);
insert into reviewtime values('Tue', 13);
insert into reviewtime values('Tue', 14);
insert into reviewtime values('Tue', 15);
insert into reviewtime values('Tue', 16);
insert into reviewtime values('Tue', 17);
insert into reviewtime values('Tue', 18);
insert into reviewtime values('Tue', 19);
insert into reviewtime values('Tue', 20);
insert into reviewtime values('Tue', 21);
insert into reviewtime values('Tue', 22);
insert into reviewtime values('Tue', 23);


insert into reviewtime values('Wed', 0);
insert into reviewtime values('Wed', 1);
insert into reviewtime values('Wed', 2);
insert into reviewtime values('Wed', 3);
insert into reviewtime values('Wed', 4);
insert into reviewtime values('Wed', 5);
insert into reviewtime values('Wed', 6);
insert into reviewtime values('Wed', 7);
insert into reviewtime values('Wed', 8);
insert into reviewtime values('Wed', 9);
insert into reviewtime values('Wed', 10);
insert into reviewtime values('Wed', 11);
insert into reviewtime values('Wed', 12);
insert into reviewtime values('Wed', 13);
insert into reviewtime values('Wed', 14);
insert into reviewtime values('Wed', 15);
insert into reviewtime values('Wed', 16);
insert into reviewtime values('Wed', 17);
insert into reviewtime values('Wed', 18);
insert into reviewtime values('Wed', 19);
insert into reviewtime values('Wed', 20);
insert into reviewtime values('Wed', 21);
insert into reviewtime values('Wed', 22);
insert into reviewtime values('Wed', 23);

insert into reviewtime values('Thu', 0);
insert into reviewtime values('Thu', 1);
insert into reviewtime values('Thu', 2);
insert into reviewtime values('Thu', 3);
insert into reviewtime values('Thu', 4);
insert into reviewtime values('Thu', 5);
insert into reviewtime values('Thu', 6);
insert into reviewtime values('Thu', 7);
insert into reviewtime values('Thu', 8);
insert into reviewtime values('Thu', 9);
insert into reviewtime values('Thu', 10);
insert into reviewtime values('Thu', 11);
insert into reviewtime values('Thu', 12);
insert into reviewtime values('Thu', 13);
insert into reviewtime values('Thu', 14);
insert into reviewtime values('Thu', 15);
insert into reviewtime values('Thu', 16);
insert into reviewtime values('Thu', 17);
insert into reviewtime values('Thu', 18);
insert into reviewtime values('Thu', 19);
insert into reviewtime values('Thu', 20);
insert into reviewtime values('Thu', 21);
insert into reviewtime values('Thu', 22);
insert into reviewtime values('Thu', 23);

insert into reviewtime values('Fri', 0);
insert into reviewtime values('Fri', 1);
insert into reviewtime values('Fri', 2);
insert into reviewtime values('Fri', 3);
insert into reviewtime values('Fri', 4);
insert into reviewtime values('Fri', 5);
insert into reviewtime values('Fri', 6);
insert into reviewtime values('Fri', 7);
insert into reviewtime values('Fri', 8);
insert into reviewtime values('Fri', 9);
insert into reviewtime values('Fri', 10);
insert into reviewtime values('Fri', 11);
insert into reviewtime values('Fri', 12);
insert into reviewtime values('Fri', 13);
insert into reviewtime values('Fri', 14);
insert into reviewtime values('Fri', 15);
insert into reviewtime values('Fri', 16);
insert into reviewtime values('Fri', 17);
insert into reviewtime values('Fri', 18);
insert into reviewtime values('Fri', 19);
insert into reviewtime values('Fri', 20);
insert into reviewtime values('Fri', 21);
insert into reviewtime values('Fri', 22);
insert into reviewtime values('Fri', 23);











































