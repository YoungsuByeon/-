<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2 style="text-align: center">성적 등록</h2>
	<form action="scoreRegister.jsp" method="get">
		<table border="1" align="center">
			<tr><th>학생번호</th><th>컴파일러</th><th>한국어의미의이해</th><th>마케팅원론</th></tr>
			<tr><td><input type="text" name="code"></td><td><input type="text" name="컴파일러"></td><td><input type="text" name="한국어의미의이해"></td><td><input type="text" name="마케팅원론"></td></tr>
			<tr><td colspan="4" align="center"><input type="submit" value="등록"></td></tr>
		</table>
	</form>
</body>
</html>