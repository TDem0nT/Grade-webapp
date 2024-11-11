﻿CREATE DATABASE `student_grade`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `student_grade`;

CREATE TABLE `grade` (
  `student_id` VARCHAR(8) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'เลขประจำตัวนักเรียน',
  `course_id` VARCHAR(11) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'รหัสวิชา',
  `course_name` VARCHAR(64) COLLATE utf8_thai_520_w2 DEFAULT '' COMMENT 'ชือวิชา',
  `credit` FLOAT(9,3) DEFAULT 1.000 COMMENT 'หน่วยกิต',
  `teacher` VARCHAR(128) COLLATE utf8_thai_520_w2 DEFAULT '' COMMENT 'ชื่อ - สกุล ครูผู้สอน',
  `grade` FLOAT(9,3) DEFAULT 1.000 COMMENT 'ผลการเรียน',
  PRIMARY KEY USING BTREE (`student_id`, `course_id`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';


CREATE TABLE `student` (
  `student_id` VARCHAR(8) COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'เลขประจำตัวนักเรียน',
  `student_no` INTEGER(11) DEFAULT NULL COMMENT 'ลำดับที่/เลขที่ในห้องเรียน',
  `citizen_id` VARCHAR(16) COLLATE utf8_general_ci DEFAULT '' COMMENT 'เลขประจำตัวประชาชน',
  `title_id` INTEGER(11) DEFAULT NULL COMMENT 'รหัสคำนำหน้า\r\n1=ด.ช.\r\n2=ด.ญ.\r\n3=นาย\r\n4=น.ส.',
  `name` VARCHAR(64) COLLATE utf8_thai_520_w2 DEFAULT '' COMMENT 'ชื่อนักเรียน',
  `surname` VARCHAR(64) COLLATE utf8_thai_520_w2 DEFAULT '' COMMENT 'นามสกุลนักเรียน',
  `level` INTEGER(11) DEFAULT NULL COMMENT 'ระดับชั้น ม.',
  `room` INTEGER(11) DEFAULT NULL COMMENT 'ห้องเรียน',
  PRIMARY KEY USING BTREE (`student_id`),
  UNIQUE KEY `student_idx1` USING BTREE (`citizen_id`)
) ENGINE=InnoDB
ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8' COLLATE 'utf8_general_ci';


INSERT INTO `grade` (`student_id`, `course_id`, `course_name`, `credit`, `teacher`, `grade`) VALUES
  ('43215','ค22010','คณิตศาสตร์ 3',1.500,'นายศุภวิชญ์ บาลลา',4.000),
  ('43215','ท22101','ภาษาไทย 3',1.500,'นายวีรยุทธ์ คุ้มโภคา',2.000),
  ('43215','ว22101','วิทยาศาสตร์ 3',1.500,'น.ส.กนกวรรณ สุวรรณกูฎ',3.500),
  ('43215','ว22103','เทคโนโลยี 2',1.000,'น.ส.อินทีวร ชัยกูล',4.000),
  ('43215','ส22101','สังคมศึกษา 3',1.000,'นายพินิจ สังสีมา',1.000),
  ('43456','ง30102','การงานอาชีพ 2',1.000,'น.ส.อินทีวร ชัยกูล',4.000),
  ('43456','พ31101','สุขศึกษาและพลศึกษา 1',0.500,'นายวีรยุทธ์ คุ้มโภคา',4.000),
  ('43456','ศ31101','ทัศนศิลป์ 1',0.500,'น.ส.กนกวรรณ สุวรรณกูฎ',4.000),
  ('43456','ส31101','ประวัติศาสตร์ 1',0.500,'นายศุภวิชญ์ บาลลา',3.500),
  ('43456','อ30201','ภาษาอังกฤษ 1',1.000,'นายพินิจ สังสีมา',2.500),
  ('44556','ง30102','การงานอาชีพ 2',1.000,'น.ส.อินทีวร ชัยกูล',2.500),
  ('44556','พ31101','สุขศึกษาและพลศึกษา 1',0.500,'นายวีรยุทธ์ คุ้มโภคา',3.500),
  ('44556','ศ31101','ทัศนศิลป์ 1',0.500,'น.ส.กนกวรรณ สุวรรณกูฎ',4.000),
  ('44556','ส31101','ประวัติศาสตร์ 1',0.500,'นายศุภวิชญ์ บาลลา',4.000),
  ('44556','อ30201','ภาษาอังกฤษ 1',1.000,'นายพินิจ สังสีมา',1.000),
  ('48123','ง30102','การงานอาชีพ 2',1.000,'น.ส.อินทีวร ชัยกูล',2.000),
  ('48123','พ31101','สุขศึกษาและพลศึกษา 1',0.500,'นายวีรยุทธ์ คุ้มโภคา',1.000),
  ('48123','ศ31101','ทัศนศิลป์ 1',0.500,'น.ส.กนกวรรณ สุวรรณกูฎ',1.500),
  ('48123','ส31101','ประวัติศาสตร์ 1',0.500,'นายศุภวิชญ์ บาลลา',0.000),
  ('48123','อ30201','ภาษาอังกฤษ 1',1.000,'นายพินิจ สังสีมา',0.000),
  ('48920','ค22010','คณิตศาสตร์ 3',1.500,'นายศุภวิชญ์ บาลลา',1.500),
  ('48920','ท22101','ภาษาไทย 3',1.500,'นายวีรยุทธ์ คุ้มโภคา',0.000),
  ('48920','ว22101','วิทยาศาสตร์ 3',1.500,'น.ส.กนกวรรณ สุวรรณกูฎ',2.500),
  ('48920','ว22103','เทคโนโลยี 2',1.000,'น.ส.อินทีวร ชัยกูล',4.000),
  ('48920','ส22101','สังคมศึกษา 3',1.000,'นายพินิจ สังสีมา',2.000),
  ('49880','ง30102','การงานอาชีพ 2',1.000,'น.ส.อินทีวร ชัยกูล',3.500),
  ('49880','พ31101','สุขศึกษาและพลศึกษา 1',0.500,'นายวีรยุทธ์ คุ้มโภคา',4.000),
  ('49880','ศ31101','ทัศนศิลป์ 1',0.500,'น.ส.กนกวรรณ สุวรรณกูฎ',4.000),
  ('49880','ส31101','ประวัติศาสตร์ 1',0.500,'นายศุภวิชญ์ บาลลา',4.000),
  ('49880','อ30201','ภาษาอังกฤษ 1',1.000,'นายพินิจ สังสีมา',3.500),
  ('51321','ค22010','คณิตศาสตร์ 3',1.500,'นายศุภวิชญ์ บาลลา',1.000),
  ('51321','ท22101','ภาษาไทย 3',1.500,'นายวีรยุทธ์ คุ้มโภคา',0.000),
  ('51321','ว22101','วิทยาศาสตร์ 3',1.500,'น.ส.กนกวรรณ สุวรรณกูฎ',1.500),
  ('51321','ว22103','เทคโนโลยี 2',1.000,'น.ส.อินทีวร ชัยกูล',0.000),
  ('51321','ส22101','สังคมศึกษา 3',1.000,'นายพินิจ สังสีมา',1.500),
  ('54321','ค22010','คณิตศาสตร์ 3',1.500,'นายศุภวิชญ์ บาลลา',4.000),
  ('54321','ท22101','ภาษาไทย 3',1.500,'นายวีรยุทธ์ คุ้มโภคา',4.000),
  ('54321','ว22101','วิทยาศาสตร์ 3',1.500,'น.ส.กนกวรรณ สุวรรณกูฎ',3.500),
  ('54321','ว22103','เทคโนโลยี 2',1.000,'น.ส.อินทีวร ชัยกูล',4.000),
  ('54321','ส22101','สังคมศึกษา 3',1.000,'นายพินิจ สังสีมา',3.500),
  ('55670','ง30102','การงานอาชีพ 2',1.000,'น.ส.อินทีวร ชัยกูล',4.000),
  ('55670','พ31101','สุขศึกษาและพลศึกษา 1',0.500,'นายวีรยุทธ์ คุ้มโภคา',1.500),
  ('55670','ศ31101','ทัศนศิลป์ 1',0.500,'น.ส.กนกวรรณ สุวรรณกูฎ',4.000),
  ('55670','ส31101','ประวัติศาสตร์ 1',0.500,'นายศุภวิชญ์ บาลลา',0.000),
  ('55670','อ30201','ภาษาอังกฤษ 1',1.000,'นายพินิจ สังสีมา',3.500),
  ('56789','ค22010','คณิตศาสตร์ 3',1.500,'นายศุภวิชญ์ บาลลา',2.000),
  ('56789','ท22101','ภาษาไทย 3',1.500,'นายวีรยุทธ์ คุ้มโภคา',1.500),
  ('56789','ว22101','วิทยาศาสตร์ 3',1.500,'น.ส.กนกวรรณ สุวรรณกูฎ',4.000),
  ('56789','ว22103','เทคโนโลยี 2',1.000,'น.ส.อินทีวร ชัยกูล',3.500),
  ('56789','ส22101','สังคมศึกษา 3',1.000,'นายพินิจ สังสีมา',4.000);
COMMIT;



INSERT INTO `student` (`student_id`, `student_no`, `citizen_id`, `title_id`, `name`, `surname`, `level`, `room`) VALUES
  ('43215',2,'2345678901234',2,'สมหญิง','หยิ่งเสมิ',2,1),
  ('43456',3,'8901234567897',3,'สมชาย','แซ่ตั้ง',4,5),
  ('44556',5,'1012345678907',4,'สมฤดี','สวยเสมอ',4,5),
  ('48123',2,'7890123456789',4,'สมทรง','ซื้อตรงตลอด',4,5),
  ('48920',3,'3456789012347',2,'สมสวย','รวยเสมอ',2,1),
  ('49880',1,'6789012345670',3,'สมบัตื','ภัทรสถาน',4,5),
  ('51321',1,'1234567890121',1,'สมชาย','สายเสมอ',2,1),
  ('54321',4,'4567890123459',2,'สายสมร','สวยเสมอ',2,1),
  ('55670',4,'9012345678902',1,'สมควร','รวยเหลือล้น',4,5),
  ('56789',5,'5678901234560',1,'สมหมาย','แสนสบาย',2,1);
COMMIT;

