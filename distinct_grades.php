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
                <li class="nav-item"><a class="nav-link" href="class_search.html">Search Classes</a></li>
                <li class="nav-item"><a class="nav-link" href="grade_search.html">Search Grades</a></li>
                <li class="nav-item"><a class="nav-link" href="professor_search.html">Check Faculty Classes</a></li>
                <li class="nav-item active"><a class="nav-link" href="count_grades.html">Check Course Grades</a></li>
            </ul>
        </nav>
        <div class="container">
            <?php  
                $search_var = $_POST["search_CNum"];
                $search_var2 = $_POST["search_SecNum"];
                echo "<h3>Results for search '{$search_var}' - '{$search_var2}'</h3>";
                $db_con = mysqli_connect("host", "username", "password", "db");
                if (mysqli_connect_errno()) {
                    echo "Error code: " . mysqli_connect_errno();
                    echo "Failed to connect to MySQL: " . mysqli_connect_error();
                }
                $result = mysqli_query($db_con, "SELECT Grade, COUNT(*) 
                FROM Course c, Course_Section CS, Student_Course_Grade CSG 
                WHERE c.CNum = '{$search_var}' 
                    AND CS.CNum = c.CNum 
                    AND CS.SecNum = '{$search_var2}' 
                    AND CSG.CNum = '{$search_var}' 
                    AND CSG.SecNum = '{$search_var2}' 
                GROUP BY Grade");
                if ($result) {
                    echo "<table class='table'>";
                    echo "<thead>";
                    echo "<tr>";
                    echo "<th scope='col'>Grade</th>";
                    echo "<th scope='col'>Count</th>";
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
