<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="./style/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/cdf972f2e2.js" crossorigin="anonymous"></script>
    <script src="./script/script.js" defer></script>
    <title>Insert title here</title>
</head>

<body>
<%
	String userID =null;
	if(session.getAttribute("userID")!=null){
		userID=(String) session.getAttribute("userID");
	}
%>
    <header class="head">
        <section class="logoAndName">
            <i class="far fa-laugh"></i>
            <a href="#">넌 뭐하고 사니?</a>
        </section>
        <%
        	if(userID==null){
        %>
        <ul class="head_navbar">
            <li class="home"><a href="./main.jsp">HOME</a></li>
            <li class="login"><a href="./login.jsp" id="loginCH">LOGIN</a></li>
            <li class="join"><a href="./join.jsp">JOIN</a></li>
        </ul>
        <%
        	}else{
        %>
        <ul class="head_navbar">
            <li class="home"><a href="./main.jsp">HOME</a></li>
            <li class="login"><a href="./logoutAction.jsp" id="loginCH">LOGOUT</a></li>
            <li class="join"><a href="./mypage.jsp">MYPAGE</a></li>
        </ul>
        <%
        	}
        %>

        <a href="#" class="navbar_toogleBtn">
            <i class="fas fa-bars"></i>
        </a>
    </header>

    <section class="main_content">
        <div class="intro">
            <h3 class="intro-text">서로의 일정을 공유하여
                <br>
                쉽게 일정을 잡아보세요! 해피해피^^
            </h3>
            <br>
            <h4 class="intro-text subtext">
                #누구나 &nbsp;&nbsp; #쉽게 &nbsp;&nbsp; #어디서든 &nbsp;&nbsp; #일정 &nbsp;&nbsp; #계획적인삶을만들자
            </h4>
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