<?php 
$servername = "localhost";
$username = "root";
$password = "";

$db_name = "student_grade";

$conn = mysqli_connect($servername, $username, $password, $db_name);

if(!$conn) {
    die("Connection Failed: ". mysqli_connect_error());
}
$conn -> set_charset("utf8");
?>