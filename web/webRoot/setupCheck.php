<?php
  ini_set("display_errors", "On");

  var_dump("mysql test : ");
  $conn = mysqli_connect("127.0.0.1", "$MYSQLUSER", "$MYSQLPASS");
  if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
  }
  echo "Connected successfully\n";
  
  phpinfo();
?>