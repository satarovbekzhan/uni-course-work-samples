<?php
if (isset($_GET['id']) && isset($_GET['link'])) {
    include("../db.php");
    $id = $_GET['id'];
    $sql = "DELETE FROM `bag` WHERE `bag`.`id` = $id";
    $conn->query($sql);
    $sql = "SELECT * FROM bag WHERE id = $id";
    $result = $conn->query($sql);
    if ($result->num_rows == 0) {
        $msg = "Операция прошла успешно!";
        $link = $_GET['link'] . "?msg=$msg";
        header("Location: $link");
    }
}
?>
