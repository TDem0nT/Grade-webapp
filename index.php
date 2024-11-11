<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>เข้าสู่ระบบ</title>

    <link rel="stylesheet" href="style.css">
</head>
<body>
    <form action="index_db.php" method="POST">
        <div class="logo">
            <img src="/webapp/photo/logo.png">
        </div>
        <h1 class="header-login">เข้าสู่ระบบ</h1>
        <?php if(isset($_GET['error'])) { ?>
            <p class="error"><?= $_GET['error'] ?></p>
        <?php } ?>
        <div class="menu-login">
            <label><b>เลขประจำตัวนักเรียน</b></label><br>
            <input type="text" name="studentid" placeholder="เลขประจำตัวนักเรียน" maxlength="5"><br>
            <label><b>เลขประจำตัวประชาชน</b></label><br>
            <input type="password" name="personid" placeholder="เลขประจำตัวประชาชน" maxlength="13"><br>
        </div>
        <button type="submit" class="submit-login">เข้าสู่ระบบ</button>
    </form>
</body>
</html>
