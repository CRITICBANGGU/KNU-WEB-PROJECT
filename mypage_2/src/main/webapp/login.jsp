<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./style/style.css">
    <link rel="stylesheet" href="./style/login.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/cdf972f2e2.js" crossorigin="anonymous"></script>
    <script src="./script/script.js" defer></script>
    <script src=""></script>
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
        <div class="login_div">
            <h2>로그인</h2>
            <form action="./loginAction.jsp" method="post">
                <input type="text" name="userID" id="inputId" class="id" placeholder="아이디"><br>
                <label id="id">아이디</label><br>
                <input type="password" name="userPassword" id="inputPw" class="pw" placeholder="비밀번호"><br>
                <label id="pw">비밀번호</label><br>
                <button type="submit">LOGIN</button>
            </form>
            <ul class="loginSetting">
                <li class="stayLogin"><input type="checkbox" name="" id="" class="stayCh">
                    로그인 상태 유지
                </li>
                <li class="searchPW"><a href="">비밀번호찾기></a></li>
            </ul>
        </div>

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