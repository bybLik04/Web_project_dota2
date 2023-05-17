<!DOCTYPE html>
<html>
<head>
    <title>Actual News</title>
</head>
<body>
    <h1>Actual News Page</h1>
    <form action="/comment" method="POST">
        <label for="nickname">Nickname:</label>
        <input type="text" id="nickname" name="nickname" required><br><br>
        <label for="comment">Comment:</label>
        <textarea id="comment" name="comment" required></textarea><br><br>
        <input type="submit" value="Submit">
    </form>
    
    <h2>Comments:</h2>
    <div id="comment-section">
        <!-- Comments will be dynamically added here -->
    </div>
    
    <script>
        // JavaScript code for dynamically updating comments using AJAX
        // You can write your JavaScript code here
    </script>
</body>
</html>

