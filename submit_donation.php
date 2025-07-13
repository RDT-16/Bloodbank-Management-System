<?php
// Database connection
$servername = "localhost";
$username = "rdt16";
$password = "chelsea26";
$dbname = "bloodbank management database";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
// Form data
$name = $_POST['name'];
$bloodGroup = $_POST['bloodGroup'];
$contactNumber = $_POST['contactNumber'];
$email = $_POST['email'];
// Insert data into Donor table
$sql = "INSERT INTO Donor (name, blood_group, contact_number, email) VALUES ('$name',
'$bloodGroup', '$contactNumber', '$email')";
if ($conn->query($sql) === TRUE) {
// Redirect to admin dashboard after successful submission
header("Location: admin-dashboard.html");
exit();
} else {
echo "Error: " . $sql . "<br>" . $conn->error;
}
$conn->close();
?>
