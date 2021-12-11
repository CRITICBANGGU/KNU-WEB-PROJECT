<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./style/style.css">
    <link rel="stylesheet" href="./style/style.css">
    <link rel="stylesheet" href="./style/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../fullcalendar-5.5.1/lib/main.css">
    <script src="https://kit.fontawesome.com/cdf972f2e2.js" crossorigin="anonymous"></script>
    <script src="./script/jquery.min.js"></script>
    <script src="./script/script.js" defer></script>
    <script src="../fullcalendar-5.5.1/lib/main.min.js"></script>
    <script src="../fullcalendar-5.5.1/lib/locales/ko.js"></script>
    <script src="./script/real_cal.js"></script>
    <!-- <script src="./script/cal.js"></script> -->
    <title>넌 뭐하고 사니? - 친구와의 일정을 편리하게</title>
</head>

<body>
    <header class="head">
        <section class="logoAndName">
            <i class="far fa-laugh"></i>
            <a href="./main.jsp">넌 뭐하고 사니?</a>
        </section>
        <ul class="head_navbar">
            <li class="home"><a href="./main.jsp">HOME</a></li>
            <li class="login"><a href="./login.jsp">LOGIN</a></li>
            <li class="join"><a href="./join.jsp">JOIN</a></li>
        </ul>

        <a href="#" class="navbar_toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </header>

    <section class="main_content">
        <div id='external-events'>
            <h4>Draggable Events</h4>

            <div id='external-events-list'>
                <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                    <div class='fc-event-main' id="1">My Event 1</div>
                </div>
                <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                    <div class='fc-event-main' id="2">My Event 2</div>
                </div>
                <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                    <div class='fc-event-main' id="3">My Event 3</div>
                </div>
                <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                    <div class='fc-event-main' id="4">My Event 4</div>
                </div>
                <div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
                    <div class='fc-event-main' id="5">My Event 5</div>
                </div>
            </div>

            <p>
                <input type='checkbox' id='drop-remove' />
                <label for='drop-remove'>remove after drop</label>
            </p>
        </div>
        <div id="calendar" style="width: 800px;"></div>

    </section>

    <footer>
        <ul class="copyright">
            <li class="right">Copyright
                <i class="far fa-copyright"></i>
                조이름.Co All Rights Reserved.
            </li>
            <li class="bar"> | </li>
            <li class="terms">이용약관</li>
            <li class="bar"> | </li>
            <li class="privacy">개인정보처리방침</li>
        </ul>
    </footer>
</body>

</html>