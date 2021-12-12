<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
	<jsp:useBean id="student" class="student.StudentInfo" scope="page" />
	<jsp:setProperty property="*" name="student"/>
	<jsp:useBean id="data" class="student.DataManagerDAO" scope="page" />
	
	<%
		String code = (String)session.getAttribute("CODE");
		if(code != null){
			if(data.updateStudent(student) != 0){
				out.print("학생정보 수정에 성공하셨습니다.<br>");
				out.print("<a href='info.jsp'>학생정보 보기로 돌아가기</a>");
			}else{
				out.print("학생정보 수정에 실패하였습니다.<br>");
				out.print("<a href='login.jsp'>학생찾기로 돌아가기</a>");
			}
		}
	%>
</body>
</html>