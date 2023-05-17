<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ title }} - Dota 2</title>
    <link rel="stylesheet" type="text/css" href="/static/content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/site.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/style.css" />
    <link rel="stylesheet" type="text/css" href="/static/content/style2.css" />
    <script src="/static/scripts/modernizr-2.6.2.js"></script>
</head>

<body class="backgroundc">
    <div class="navbar navbar-inverse navbar-fixed-top limited-size">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a href="/" class="navbar-brand">
                    <img src="static\images\citelogo.png" class="img-resp2">
                </a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/home"><div class="center-vertical"> Главная </div></a></li>
                    <li><a href="/about"><div class="center-vertical">О игре</div></a></li>
                    <li><a href="/contact"><div class="center-vertical">Контакты</div></a></li>
                    <li><a href="/actualnews"><div class="center-vertical">Актуальные новости</div></a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="container body-content">
        {{!base}}
        <hr />
        <footer>
        <div class="footer-resp">
            <div>
                &copy; {{ year }} - Dota 2 Build Master
            </div>
            <div>
                <a href="https://www.valvesoftware.com/ru/"><img src="static\images\valve.png" alt="img"></a>
            </div>
        </div>
        </footer>
    </div>

    <script src="/static/scripts/jquery-1.10.2.js"></script>
    <script src="/static/scripts/bootstrap.js"></script>
    <script src="/static/scripts/respond.js"></script>

</body>
</html>
