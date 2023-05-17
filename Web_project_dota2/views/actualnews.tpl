% rebase('layout.tpl', title="Actual News", year=year)
<html>
<head>
    <title>Актуальные Новости</title>
    <style>
        body {
            color: white;
        }
    </style>
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
    
    <!-- Ваш блок с основной информацией -->
    <div id="main-info">
        <h1>ОБНОВЛЕНИЕ 7.33 "Новые горизонты"</h1>
        <p class="lead">Порой в Доте выходят маленькие обновления. Порой — довольно большие.

            Но это обновление... огромно.

            В нём есть всё, чего вы ждали: правки баланса, новые предметы, изменения героев и улучшения интерфейса. Но кроме этого мы ввели несколько новинок, которые вы вряд ли ждали: например, новый тип героев и — готовы? — увеличение карты на 40%.

            Разумеется, всё это не будет иметь никакого смысла, если вам подберётся плохая игра, так что мы приготовили ещё и такие нужные улучшения системы подбора.

            </p>
        <video width="640" height="480" controls>
            <source src="static\items\portal_wide.webm" type="video/webm">
            Your browser does not support the video tag.
        </video>
        
        <p>Вы рады? Растеряны? Как бы то ни было, посетите страничку обновления «Новые горизонты», чтобы узнать о нём во всех подробностях.</p>
        <p><a href="https://www.dota2.com/newfrontiers?v=2" class="btn2 btn-primary2">Узнать больше! &raquo;</a></p>

    </div>
    
    <h2>Comments:</h2>
    <div id="comment-section">
        <!-- Comments will be dynamically added here -->
    </div>
    
    <form action="/comment" method="POST">
        <label for="nickname">Nickname:</label>
        <input type="text" id="nickname" name="nickname" required><br><br>
        <label for="comment">Comment:</label>
        <textarea id="comment" name="comment" required></textarea><br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
