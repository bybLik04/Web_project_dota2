<!DOCTYPE html>
<html>
<head>
    <title>Actual News</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // JavaScript code for dynamically updating comments using AJAX
        function refreshComments() {
            $.ajax({
                url: "/get_comments",
                method: "GET",
                success: function(data) {
                    $("#comment-section").html(data);
                }
            });
        }

        $(document).ready(function() {
            refreshComments();  // Refresh comments when the page loads

            // Submit comment form using AJAX
            $("form").submit(function(event) {
                event.preventDefault();  // Prevent form submission
                var form = $(this);
                var formData = form.serialize();  // Serialize form data
                $.ajax({
                    url: form.attr("action"),
                    method: form.attr("method"),
                    data: formData,
                    success: function() {
                        form.trigger("reset");  // Clear form inputs
                        refreshComments();  // Refresh comments after submitting
                    }
                });
            });
        });
    </script>
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
</body>
</html>
