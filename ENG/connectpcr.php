<?php
////////// PCR ///////////////
$servername = "localhost";
$username = "root";
$password = "root123456";
$dbname = "pcrdb";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 


/////////// DBMC /////////////
$servername_data = "10.73.148.20";
$username_data = "SDM148020";
$password_data = "root123456";
$dbname_data = "DBMC";

$condbmc = new mysqli($servername_data, $username_data, $password_data, $dbname_data);

if ($condbmc->connect_error) {
    die("Connection failed: " . $condbmc->connect_error);
}
?>
