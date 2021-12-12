<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.*" %>
<% request.setCharacterEncoding("utf-8"); %>    
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
	<jsp:useBean id="data" class="student.DataManagerDAO" scope="page" />
	<%
		String code = (String)session.getAttribute("CODE");
		if(code != null){
			if(data.removeStudent(code) != 0){
				out.print("학생정보를 삭제하였습니다.<br>");
				session.invalidate();
				out.print("<a href='../index.html'>학생조회</a>");
			}else{
				out.print("학생정보를 삭제하지 못했습니다.<br>");
				out.print("<a href='info.jsp'>학생정보 보기화면으로 돌아가기</a>");
			}
		}else{
			out.print("학생을 조회해 주세요.<br>");
			response.sendRedirect("../index.html");
		}
	%>
</body>
</html>