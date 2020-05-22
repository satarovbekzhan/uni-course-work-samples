<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bags";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

function get_price($id) {
    global $conn;
    $sql = "SELECT * FROM record WHERE bag = $id AND feature = 'Цена'";
    $result = $conn->query($sql);
    if ($result != null) {
        $bag = $result->fetch_assoc();
        return $bag['value'] != null ? $bag['value'] : 'неизвестно';
    }
    return 'неизвестно';
}

function get_sql_code($q) {
    $sql = "";
    if ($q == null) {
        $sql = "SELECT * FROM bag LIMIT 24";
    } else {
        $sql = "SELECT * FROM bag WHERE id = $q";
    }
    return $sql;
}
?>
