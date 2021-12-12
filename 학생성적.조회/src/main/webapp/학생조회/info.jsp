<%@page import="score.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="student.*" %>    
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
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="data" class="student.DataManagerDAO" scope="page" />
	<div id="studentInfo">
		<%
			String code = (String)session.getAttribute("CODE");
			if(code != null){
				StudentInfo student = data.getStudent(code);
				
				out.print("<form action='update.jsp' method='psot'>");
				out.print("<table border='1' align='center'>");
				out.print("<tr><th colspan='2'>학생정보</th></tr>");
				out.print("<tr><td>학생번호</td><td><input readeonly type='text' name='code' value='"+student.getCode()+"'></td><tr>");
				out.print("<tr><td>소속학과</td><td><input type='text' name='dept' value='"+student.getDept()+"'></td><tr>");
				out.print("<tr><td>학생이름</td><td><input type='text' name='name' value='"+student.getName()+"'></td><tr>");
				out.print("<tr><td>학년</td><td><input type='text' name='grade' value='"+student.getGrade()+"'></td><tr>");
				out.print("<tr><td>성별</td><td><input type='text' name='gender' value='"+student.getGender()+"'></td><tr>");
				out.print("<tr><td>나이</td><td><input type='text' name='age' value='"+student.getAge()+"'></td><tr>");
				out.print("<tr><td>전화번호</td><td><input type='text' name='phone' value='"+student.getPhone()+"'></td><tr>");
				out.print("<tr><td>주소</td><td><input type='text' name='address' value='"+student.getAddress()+"'></td><tr>");
				out.print("<tr><td colspan='2' align='center'><input id='btn' type='submit' value='수정'></td></tr>");
				out.print("</table>");
				out.print("</form>");
				
			}else{
				response.sendRedirect("index.html");
			}
		%>
	</div>
	<br>
	<a href="../성적조회/scoreinfo.jsp?code="<%= code %>>성적확인하기</a>

	<hr>
	<a href="studentList.jsp">전체 학생조회</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="../성적조회/scoreList.jsp">학생성적 전체조회</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="delete.jsp?code="<%= code %>>학생 삭제</a>&nbsp;&nbsp;&nbsp;&nbsp;
</body>
</html>