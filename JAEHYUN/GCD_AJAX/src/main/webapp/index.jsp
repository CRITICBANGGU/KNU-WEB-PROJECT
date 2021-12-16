<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<% class CAL{
	public int gcd(int a, int b){
	while(b != 0) {
		int r = a % b;
		a = b;
		b = r;
	}
	return a;
	}
}%>

<html>
<head>
<meta charset="utf-8">
<title>GCD 프로그램</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8"); %>
<%! int count =0; %>
<% 
	int num1 = Integer.parseInt(request.getParameter("Num1"));
	int num2 = Integer.parseInt(request.getParameter("Num2"));
	int gcd;
	
	CAL cal = new CAL();
	gcd=cal.gcd(num1,num2);
	
	Date current = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("a hh시 mm분"); 
	String time = sf.format(current); 
	++count;
	out.print(gcd+","+time+","+count);

%>

</body>
</html>