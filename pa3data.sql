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
insert into categories values('TOTAL_UNIT', 'B.S. in Computer Science', NULL, 40);
insert into categories values('MAJ_UNIT_LOWDIV', 'B.S. in Computer Science', NULL, 10);
insert into categories values('MAJ_UNIT_UPDIV', 'B.S. in Computer Science', NULL, 15);
insert into categories values('ELECTIVE', 'B.S. in Computer Science', NULL, 15);
insert into categories values('GRAD_UNIT', 'B.S. in Computer Science', NULL, 0);

insert into categories values('TOTAL_UNIT', 'B.A. in Philosophy', NULL, 35);
insert into categories values('MAJ_UNIT_LOWDIV', 'B.A. in Philosophy', NULL, 15);
insert into categories values('MAJ_UNIT_UPDIV', 'B.A. in Philosophy', NULL, 20);
insert into categories values('ELECTIVE', 'B.A. in Philosophy', NULL, 0);
insert into categories values('GRAD_UNIT', 'B.A. in Philosophy', NULL, 0);

insert into categories values('TOTAL_UNIT', 'B.S. in Mechanical Engineering', NULL, 50);
insert into categories values('MAJ_UNIT_LOWDIV', 'B.S. in Mechanical Engineering', NULL, 20);
insert into categories values('MAJ_UNIT_UPDIV', 'B.S. in Mechanical Engineering', NULL, 20);
insert into categories values('ELECTIVE', 'B.S. in Mechanical Engineering', NULL, 10);
insert into categories values('GRAD_UNIT', 'B.S. in Mechanical Engineering', NULL, 0);

insert into categories values('TOTAL_UNIT', 'M.S. in Computer Science', NULL, 45);
insert into categories values('MAJ_UNIT_LOWDIV', 'M.S. in Computer Science', NULL, 0);
insert into categories values('MAJ_UNIT_UPDIV', 'M.S. in Computer Science', NULL, 0);
insert into categories values('ELECTIVE', 'M.S. in Computer Science', NULL, 0);
insert into categories values('GRAD_UNIT', 'M.S. in Computer Science', NULL, 45);

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
insert into taken values( 1, 'CSE8A', 'wi2017', 'letter', 4, 'A-', 'Justin Bieber');
insert into taken values( 3, 'CSE8A', 'wi2017', 'letter', 4, 'B+', 'Justin Bieber');
insert into taken values( 2, 'CSE8A', 'fa2017', 'letter', 4, 'C-', 'Selena Gomez');
insert into taken values( 4, 'CSE8A', 'wi2018', 'letter', 4, 'A-', 'Kelly Clarkson');
insert into taken values( 5, 'CSE8A', 'wi2018', 'letter', 4, 'B', 'Kelly Clarkson');
insert into taken values( 1, 'CSE105', 'sp2017', 'letter', 4, 'A-', 'Taylor Swift');
insert into taken values( 5, 'CSE105', 'sp2017', 'letter', 4, 'B+', 'Taylor Swift');
insert into taken values( 4, 'CSE105', 'sp2017', 'letter', 4, 'C', 'Taylor Swift');
insert into taken values( 16, 'CSE250A', 'wi2017', 'letter', 4, 'C', 'Bjork');
insert into taken values( 22, 'CSE250A', 'wi2018', 'letter', 4, 'B+', 'Bjork');
insert into taken values( 18, 'CSE250A', 'wi2018', 'letter', 4, 'D', 'Bjork');
insert into taken values( 19, 'CSE250A', 'wi2018', 'letter', 4, 'F', 'Bjork');
insert into taken values( 17, 'CSE250B', 'sp2017', 'letter', 4, 'A', 'Justin Bieber');
insert into taken values( 19, 'CSE250B', 'sp2017', 'letter', 4, 'A', 'Justin Bieber');
insert into taken values( 20, 'CSE255', 'wi2018', 'letter', 4, 'B-', 'Justin Bieber');
insert into taken values( 18, 'CSE255', 'wi2018', 'letter', 4, 'B', 'Justin Bieber');
insert into taken values( 21, 'CSE255', 'wi2018', 'letter', 4, 'F', 'Justin Bieber');
insert into taken values( 17, 'CSE232A', 'wi2018', 'letter', 4, 'A-', 'Kelly Clarkson');
insert into taken values( 22, 'CSE221', 'fa2017', 'letter', 4, 'A', 'Kelly Clarkson');
insert into taken values( 20, 'CSE221', 'fa2017', 'letter', 4, 'A', 'Kelly Clarkson');
insert into taken values( 10, 'MAE107', 'fa2017', 'letter', 4, 'B+', 'Bjork');
insert into taken values( 8, 'MAE108', 'wi2017', 'letter', 2, 'B-', 'Selena Gomez');
insert into taken values( 7, 'MAE108', 'wi2017', 'letter', 2, 'A-', 'Selena Gomez');
insert into taken values( 6, 'MAE108', 'sp2017', 'letter', 2, 'B', 'Selena Gomez');
insert into taken values( 10, 'MAE108', 'sp2017', 'letter', 2, 'B+', 'Selena Gomez');
insert into taken values( 11, 'PHIL10', 'wi2018', 'letter', 4, 'A', 'Bjork');
insert into taken values( 12, 'PHIL10', 'wi2018', 'letter', 4, 'A', 'Bjork');
insert into taken values( 13, 'PHIL10', 'wi2018', 'letter', 4, 'C-', 'Bjork');
insert into taken values( 14, 'PHIL10', 'wi2018', 'letter', 4, 'C+', 'Bjork');
insert into taken values( 15, 'PHIL165', 'fa2017', 'letter', 2, 'F', 'Flo Rida');
insert into taken values( 12, 'PHIL165', 'fa2017', 'letter', 2, 'D', 'Flo Rida');
insert into taken values( 11, 'PHIL165', 'wi2018', 'letter', 2, 'A-', 'Adam Levine');


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