<?php
if (isset($_GET["t"]) && isset($_GET["tr"]) && isset($_GET["p"])) {
    // Sanitize inputs
    $t = filter_var($_GET["t"], FILTER_SANITIZE_NUMBER_INT);
    $tr = filter_var($_GET["tr"], FILTER_SANITIZE_NUMBER_INT);
    $p = filter_var($_GET["p"], FILTER_SANITIZE_NUMBER_INT);

    // Validate inputs
    if (!is_numeric($t) || !is_numeric($tr) || !is_numeric($p)) {
        die("Invalid input");
    }

    // Convert inputs to integers
    $t = intval($t);
    $tr = intval($tr);
    $p = intval($p);

    // Establish database connection
    $db = new mysqli("localhost", "root", "", "ums");

    // Check for connection errors
    if ($db->connect_errno) {
        die("Failed to connect to MySQL: " . $db->connect_error);
    }

    // Prepare and execute the SQL statement using prepared statements
    $sql = "INSERT INTO `sensor` (`temp`, `turbidity`, `ph`) VALUES (?, ?, ?)";
    if ($stmt = $db->prepare($sql)) {
        $stmt->bind_param("iii", $t, $tr, $p); // Assuming all inputs are integers
        if (!$stmt->execute()) {
            die("Execute failed: (" . $stmt->errno . ") " . $stmt->error);
        }
        $stmt->close();
    } else {
        die("Prepare failed: (" . $db->errno . ") " . $db->error);
    }

    // Close the database connection
    $db->close();
}
?>
