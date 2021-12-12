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
	<jsp:useBean id="student" class="student.StudentInfo" scope="request" />
	<jsp:setProperty property="*" name="student"/>
	<jsp:useBean id="data" class="student.DataManagerDAO" scope="request" />
	
	<%
		String code = student.getCode();
		
		if(! data.isStudent(code)){
			if(data.insertStudent(student) != 0){
				out.print("학생이 등록되었습니다.<br>");
				out.print("<a href='../index.html'>학생찾기로 돌아가기</a>");
			}
			else{
				out.print("학생등록에 실패하였습니다.<br>");
				out.print("<a href='../index.html'>학생찾기로 돌아가기</a>");
			}
		}else{
			out.print("이미 등록된 학생입니다.<br>");
			out.print("<a href='../index.html'>학생찾기로 돌아가기</a>");
		}
	%>
</body>
</html>