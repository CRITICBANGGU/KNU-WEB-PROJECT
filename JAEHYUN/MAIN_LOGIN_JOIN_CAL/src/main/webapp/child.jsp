<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script>
function closeButton() {
	  var returnValue = {
	    key1: 'value1',
	    key2: 'value2',
	    key3: 'value3'
	  };
	  window.opener.getReturnValue(JSON.stringify(returnValue));
	  window.close();
	};
</script>
</head>
<body>
	<input type="button" id="returnButton" onclick="closeButton()">button
</body>
</html>