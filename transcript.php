<?php 
session_start();
include "database.php";
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ข้อมูลผลการเรียน</title>

    <link rel="stylesheet" href="transcript.css">
</head>
<body>
    <?php 
    $dentid = $_SESSION['dentid'];
    $sonid = $_SESSION['sonid'];

    // ดึงข้อมูลนักเรียนที่ล็อกอินอยู่
    $sql_1 = "SELECT * FROM student
    INNER JOIN grade ON student.student_id = grade.student_id
    WHERE student.student_id = $dentid";
    $result_1 = mysqli_query($conn, $sql_1);

    $row = mysqli_fetch_assoc($result_1); // ดึงข้อมูลนักเรียนคนเดียว
    $student_level = $row['level']; // ระดับชั้นของนักเรียน ม.2 หรือ ม.4

    // ดึงข้อมูลนักเรียนทุกคนในระดับชั้นเดียวกัน
    $sql_2 = "SELECT * FROM student WHERE level = $student_level";
    $result_2 = mysqli_query($conn, $sql_2);

    // คำนวณ GPA ของนักเรียนที่ล็อกอิน
    $total_grade = 0;
    $total_unit = 0;
    mysqli_data_seek($result_1, 0); // รีเซ็ต pointer เพื่อวน loop อีกครั้ง
    while ($row_course = mysqli_fetch_assoc($result_1)) {
        $total_grade += $row_course['grade'] * $row_course['credit'];
        $total_unit += $row_course['credit'];
    }
    $total_all = ($total_unit > 0) ? $total_grade / $total_unit : 0; // คำนวณ GPA ของนักเรียนที่ล็อกอิน
    $formatted_gpa = number_format($total_all, 2);

    // คำนวณ GPA ของนักเรียนทั้งหมดในระดับชั้นเดียวกัน
    $cal = [];
    $x = 0;
    while ($row_student = mysqli_fetch_assoc($result_2)) {
        $studentid_2 = $row_student['student_id'];

        $sql_3 = "SELECT grade.course_id, grade.course_name, grade.credit, grade.teacher, grade.grade 
        FROM student 
        INNER JOIN grade ON student.student_id = grade.student_id
        WHERE student.student_id = $studentid_2";
        $result_3 = mysqli_query($conn, $sql_3);

        $total_grade = 0;
        $total_unit = 0;
        while ($row_grade = mysqli_fetch_assoc($result_3)) {
            $total_grade += $row_grade['grade'] * $row_grade['credit'];
            $total_unit += $row_grade['credit'];
        }
        
        if ($total_unit > 0) {
            $gpa = $total_grade / $total_unit;
            $cal[$x] = floatval(number_format($gpa, 2));
            $x++;
        }
    }

    // จัดเรียง GPA และหาลำดับ
    rsort($cal);
    $rank = array_search(floatval($formatted_gpa), $cal) + 1;
    ?>


    <div class="td-main">
        <?php 
        
            $title = ''; 
            if (isset($row['title_id'])) { 
                switch ($row['title_id']) {
                    case 1:
                        $title = 'ด.ช.';
                        break;
                    case 2:
                        $title = 'ด.ญ.';
                        break;
                    case 3:
                        $title = 'นาย';
                        break;
                    case 4:
                        $title = 'น.ส.';
                        break;
                    default:
                        $title = '-';
                        break;
                }
            }
        ?>
        <div class="main-name-logo">
        <img src="/webapp/photo/logo.png" class="photo">
        <h1>แบบรายงานประจำตัวนักเรียน</h1>
        <h2 class = "h2-school-name">โรงเรียนรักบ้านเกิด สำนักงานเขตพื้นที่การศึกษามัธยมศึกษากรุงเทพมหานคร 2</h2>
        <h2 class = "h2-school-name"><?= 'ชั้นมัธยมศึกษาปีที่ '.$row['level']. ' ปีการศึกษา 2566' ?></h2>
        <h2 class = "h2-school-name"><?= 'ชื่อ '.$title.' '.$row['name'].' '.$row['surname'].' เลขประจำตัวนักรียน '. $row['student_id'].' ห้อง '.$row['room'].' เลขที่ '.$row['student_no']  ?></h2>
        </div>
        <div class="td-header">

            <div>
                <span class="th-photo"><img src=<?="/webapp/photo/$dentid.png"?>></span>
                <span class="th-ps-info">
                    <?= 'เลขประจำตัวนักเรียน: '. $row['student_id'].'<br>'.'เลขบัตรประชาชน: '.$row['citizen_id'].'<br>'. 'ชื่อ-สกุล: '.$title. ' '.$row['name'].' '.$row['surname']. ' ระดับชั้น ม.'.$row['level'].'/'.$row['room']. ' เลขที่ '.$row['student_no'] ?>
                </span>
            </div>
        </div>

        <h1 class="result">ผลการเรียน</h1>
        <div class="table-score">
            <table border="2" class="table-nameclass-teacher"> 
                <tr>
                    <th>รหัสวิชา</th>
                    <th>ชื่อวิชา</th>
                    <th>ชื่อ-สกุล ครูผู้สอน</th>
                    <th>หน่วยกิต</th>
                    <th>ผลการเรียน</th>
                    <th class="th-note">หมายเหตุ</th>
                </tr>
                <!-- แสดงผลการเรียนในแต่ละวิชา -->
                <?php
                mysqli_data_seek($result_1, 0); // รีเซ็ต pointer เพื่อวน loop อีกครั้ง
                while ($row_course = mysqli_fetch_assoc($result_1)) {
                    ?>
                    <tr>
                        <td class="td-course-id"><?= $row_course['course_id'] ?></td>
                        <td class="td-course-name"><?= $row_course['course_name'] ?></td>
                        <td class="td-teacher"><?= $row_course['teacher'] ?></td>
                        <td class="td-credit"><?= number_format($row_course['credit'], 1) ?></td>
                        <td class="td-grade" style="<?= $row_course['grade'] == 0 ? 'color: red;' : '' ?>">
                        <?= number_format($row_course['grade'], 1) ?></td>
                        <td class="td-note"></td>
                    </tr>
                <?php } ?>

                <!-- สรุปผลการเรียนเฉลี่ย และอันดับ -->
                <tr>
                    <td colspan="4" class="td-gpa">ผลการเรียนเฉลี่ย</td>
                    <td><?= $formatted_gpa ?></td>
                    <td class="td-note"></td>
                </tr>
                <tr>
                    <td colspan="4" class="td-credit">รวมหน่วยกิต</td>
                    <td><?= $total_unit ?></td>
                    <td class="td-note"></td>
                </tr>
                <tr>
                    <td colspan="4" class="td-order">ได้รับผลการเรียนในลำดับที่ (ของระดับชั้น ม.<?= $student_level ?>)</td>
                    <td><?= $rank ?></td>
                    <td class="td-note"></td>
                </tr>
            </table>
        </div>
        <div class="btn">
            <a href="logout.php">ออกจากระบบ</a>
            <button onclick="window.print()">พิมพ์รายงานผลการเรียน</button>
        </div>
    </div>
</body>
</html> 
