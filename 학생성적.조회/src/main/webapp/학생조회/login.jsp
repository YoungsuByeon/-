<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.*" %>
<%@ page import="score.*" %>
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
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="data" class="student.DataManagerDAO" scope="request" />
	<%
		String code = request.getParameter("code");
		
		if(data.isStudent(code)){
			session.setAttribute("CODE", code);
			
			RequestDispatcher rd = request.getRequestDispatcher("info.jsp");
			rd.forward(request, response);
		}
	%>
	<h3>등록된 학생이 아닙니다.</h3>
	<br>
	<a href="register_form.jsp">학생등록하기</a>
</body>
</html>