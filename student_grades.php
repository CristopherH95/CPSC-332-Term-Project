<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="shortcut icon" href="favicon.ico"
        type="image/x-icon">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <title>Classes Info</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">University Database</a>
        
            <ul class="nav navbar-nav">
            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="class_search.html">Search Classes</a></li>
                    <li class="nav-item active"><a class="nav-link" href="grade_search.html">Search Grades</a></li>
                    <li class="nav-item"><a class="nav-link" href="professor_search.html">Check Faculty Classes</a></li>
                    <li class="nav-item"><a class="nav-link" href="count_grades.html">Check Course Grades</a></li>
            </ul>
        </nav>
        <div class="container">
            <?php  
                $search_var = $_POST["search_CWID"];
                echo "<h3>Results for search '{$search_var}'</h3>";
                $db_con = mysqli_connect("mariadb", "cs332t9", "waufeehi", "cs332t9");
                if (mysqli_connect_errno()) {
                    echo "Error code: " . mysqli_connect_errno();
                    echo "Failed to connect to MySQL: " . mysqli_connect_error();
                }
                $result = mysqli_query($db_con, "SELECT c.C_Title, g.Grade FROM Student s
                    INNER JOIN   Student_Course_Grade g ON g.CWID = s.CWID
                    INNER JOIN   Course c ON c.CNUM = g.CNum
                    WHERE s.CWID = '{$search_var}'");
                if ($result) {
                    echo "<table class='table'>";
                    echo "<thead>";
                    echo "<tr>";
                    echo "<th scope='col'>Course</th>";
                    echo "<th scope='col'>Grade</th>";
                    echo "</tr>";
                    echo "</thead>";
                    echo "<tbody>";
                    while ($row = mysqli_fetch_row($result)) {
                        echo "<tr>";
                        for ($i = 0; $i < count($row); $i++) {
                            echo "<td>{$row[$i]}</td>";
                        }
                        echo "</tr>";
                    }
                    mysqli_free_result($result);    
                }
                else {
                    echo "<strong>No data found...</strong>";
                }
                mysqli_close($db_con);
                ?>
        </div>
    </body>
</html>