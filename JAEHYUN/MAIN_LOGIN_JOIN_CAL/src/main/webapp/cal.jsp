<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="doit.DoitDAO" %>
<%@ page import="doit.Doit"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.*" %>
<%@ page import= "org.json.simple.JSONObject"  %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="doit" class="doit.Doit" scope="page"/>
<%-- <jsp:setProperty name="doit" property="userID" >--%>
<!DOCTYPE html>
<html lang='ko'>
  <head>
    <meta charset='utf-8' />
    <link href='fullcalendar/main.css' rel='stylesheet' />
    <script src='fullcalendar/main.js' charset="utf-8"></script>
    <script>
    <%
    DoitDAO doitDAO = new DoitDAO();
    String userID=(String)session.getAttribute("userID");
    
    ArrayList<HashMap <String, List<Object>>> list = new ArrayList<HashMap <String, List<Object>>>(); 
    list = doitDAO.getLIST(userID);
    Object json = new Object();
    int sizeJson=0;
    sizeJson=list.get(0).get("jsondata").size();
    %>
    
    document.addEventListener('DOMContentLoaded', function () {
    	var startT;
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth() + 1;
        var date = now.getDate();

        var YMD = String(year) + '-' + String(month) + '-' + String(date);

        var calendarEl = document.getElementById('calendar');
        function closeWindow() {  
            setTimeout(function() {  
        		window.close();  
            }, 
            3000);  
        }
        function findFriends(){
            window.open("findFriends.jsp", "childForm", "width=300, height=220, left=600, top=100"); 
            window.onload=closeWindow();
        }
        
        function add_do(){
        	window.open("add_do.jsp","일정추가하기","width=570, height=350, resizable = no, scrollbars = no");
        	startT =request.getParameter("startT");
        }
   
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView: 'dayGridMonth',
            //   buttonText: {
            //     today : "오늘",
            //     month : "월별",
            //     week : "주별"
            //    },
            headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek addEventButton'
            },

            customButtons: {
            	 addEventButton: {
                     text: 'ADD',
                     click: function () {
                    	 location.href='add_do.jsp';
                         /* var title = prompt('Event Title:');
                         var allDayCh = prompt('하루종일 여부확인(y/n)');
                         if (allDayCh == 'y') {
                             allDayCh = Boolean(1);
                             calendar.addEvent({
                                 title: title,
                                 start: YMD,
                                 allDay: allDayCh
                             })
                         } else if (allDayCh == 'n') {
                             var startT = prompt('몇시 몇분부터 시작하나요?(24h단위(00:00))');
                             var endT = prompt('몇시 몇분에 끝나나요?(24h단위(00:00))');
                             var startTdone = YMD + 'T' + startT;
                             var endTdone = YMD + 'T' + endT;
                             calendar.addEvent({
                                 title: title,
                                 start: startTdone,
                                 end: endTdone
                             })
                             calendar.addEvent()
                         } */
                     }
                 }
            },
            locale: 'ko',
            slotMinTime: '00:00',
            slotMaxTime: '24:00',
            navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
            editable: true, // 수정 가능?
            selectable: true, // 달력 일자 드래그 설정가능
            nowIndicator: true, // 현재 시간 마크
            dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
            locale: 'ko', // 한국어 설정
            eventAdd: function (obj) { // 이벤트가 추가되면 발생하는 이벤트//db저장 기능 여기에다 넣으면 됨
                alert("추가되었습니다.");
                console.log(obj);
            },
            eventChange: function (obj) { // 이벤트가 수정되면 발생하는 이벤트//db 수정기능 여기에다 넣으면 됨
            	alert("변경되었습니다.");
            	console.log(obj.oldEvent.start);
            	console.log(obj.oldEvent.title);
                console.log(obj);
            },
            eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트//db삭제기능 여가에다 넣으면 됨
                console.log(obj);
            	
            },
            select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
                var title = prompt('Event Title:');
                if (title) {
                    calendar.addEvent({
                        title: title,
                        start: arg.start,
                        end: arg.end,
                        allDay: arg.allDay
                    })
                }
                calendar.unselect()
            },
            
            // 이벤트
            events: [{
                    
                }
                <%
                	for(int i =0;i<((int)sizeJson);i++){
                		json = list.get(0).get("jsondata").get(i);
                %>
                ,<%=json%>
                <%
                	}
                %>
	    		
	    			
                
            ]
        });
        calendar.render();
    });
    
    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>