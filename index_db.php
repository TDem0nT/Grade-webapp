<?php 
session_start();
include "database.php";

if(isset($_POST['studentid']) && isset($_POST['personid'])) {
        function validate($data) {
            $data = trim($data);
            $data = stripcslashes($data);
            $data = htmlspecialchars($data);
            return $data;
    }

    $dentid = validate($_POST['studentid']);
    $sonid = validate($_POST['personid']);

    if(empty($dentid)) {
        header("Location: index.php?error=StudentID is required");
        exit();
    }elseif(empty($sonid)) {
        header("Location: index.php?error=PersonID is required");
        exit();
    }else {
        $sql = "SELECT * FROM student WHERE student_id = $dentid AND citizen_id = $sonid";
        $result = mysqli_query($conn, $sql);

        if(mysqli_num_rows($result) === 1) {
            $row = mysqli_fetch_assoc($result);
            if($row['student_id'] === $dentid && $row['citizen_id'] === $sonid){
                $_SESSION['dentid'] = $dentid;
                $_SESSION['sonid'] = $sonid;
                header("Location: transcript.php");
                exit();
            }else {
                header("Location: error.php");
                exit();
            }
        }else {
            header("Location: error.php");
            exit();
        }
    }
}


?>