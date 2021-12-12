<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	body {text-align: center;}

</style>
</head>
<body>
	<h2>신규 학생등록</h2>
	<form action="register.jsp" method="get">
		<table border="1" align="center">
			<tr><td>학생번호</td><td><input type="text" name="code"></td></tr>
			<tr><td>소속학과</td><td><input type="text" name="dept"></td></tr>
			<tr><td>학생이름</td><td><input type="text" name="name"></td></tr>
			<tr><td>학년</td><td><input type="text" name="grade"></td></tr>
			<tr><td>성별</td><td><input type="text" name="gender"></td></tr>
			<tr><td>나이</td><td><input type="text" name="age"></td></tr>
			<tr><td>전화번호</td><td><input type="text" name="phone"></td></tr>
			<tr><td>주소</td><td><input type="text" name="address"></td></tr>
			<tr><td colspan="2"><input type="submit" value="등록"></td></tr>
		</table>
	</form>
</body>
</html>