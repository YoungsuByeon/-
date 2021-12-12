<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page session="true" %>
<%@ page import="score.*" %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	body {text-align: center;}
	#colr {background: skyblue;}

</style>
</head>
<body>
	<%
	
		Connection conn = null;
		Connection conn1 = null;
		Statement stmt = null;
		Statement stmt1 = null;
		ResultSet rs = null;
		ResultSet rs1 = null;
		
		String url = "jdbc:mysql://localhost:3306/myschool";
		String user = "root";
		String pw = "mysql";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url,user,pw);
		conn1 = DriverManager.getConnection(url,user,pw);
		
		String code = (String)session.getAttribute("CODE");
	%>
	<jsp:useBean id="data" class="score.ScoreManagerDAO" scope="page" />
	
	<%
		
		if(code != null){
		scoreInfo score = data.getScore(code);
		
		out.print("<table border='1' align='center'>");
		out.print("<tr><th colspan='5'>성적정보</th></tr>");
		out.print("<tr><th id='colr'>학생번호</th><th colspan='2' id='colr'>학생이름</th><th id='colr'>학년</th><th id='colr'>석차</th></tr>");
		out.print("<tr><th>"+score.getCode()+"</th><th colspan='2'>"+score.getName()+"</th><th>"+score.getGrade()+"</th><th>"+score.get석차()+"</th></tr>");
		out.print("<tr><th id='colr'>강의번호</th><th colspan='2' id='colr'>교수이름</th><th id='colr'>과목</th><th id='colr'>점수</th></tr>");
		out.print("<tr><th>"+score.get강의번호()+"</th><th colspan='2'>"+score.get교수이름()+"</th><th>컴파일러</th><th>"+score.get컴파일러()+"</th></tr>");
	%>
		
	<%
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from 한국어의미의이해 ;");
			
			while(rs.next()){
				out.print("<tr><th>"+rs.getString("강의번호")+"</th><th colspan='2'>"+rs.getString("교수이름")+"</th><th>한국어의미의이해</th><th>"+score.get한국어의미의이해()+"</th></tr>");
			}
		}catch(Exception e){
			out.print("오류가 발생했습니다");
		}finally{
			conn.close();
		}
	}
	%>
	
	<%
		if(code != null){
		scoreInfo score = data.getScore(code);
		
		try{
			stmt1 = conn1.createStatement();
			rs1 = stmt1.executeQuery("select * from 마케팅원론 ;");
			
			while(rs1.next()){
				out.print("<tr><th>"+rs1.getString("강의번호")+"</th><th colspan='2'>"+rs1.getString("교수이름")+"</th><th>마케팅원론</th><th>"+score.get마케팅원론()+"</th></tr>");
			}
		}catch(Exception e){
			out.print("오류가 발생했습니다");
		}finally{
			conn.close();
		}
	}
	%>
	
	<%
		if(code != null){
		scoreInfo score = data.getScore(code);	
	
		out.print("<tr><th colspan='3'>총점</th><th colspan='2'>"+score.get총점()+"</th></tr>");
		out.print("<tr><th colspan='3'>평균</th><th colspan='2'>"+score.get평균()+"</th></tr>");
		out.print("</table>");
		
	%>
	
	<%
		out.print("<br>");
		out.print("<form action='scoreUpdate.jsp' method='post'>");
		out.print("<table border='1' align='center'>");
		out.print("<tr><th colspan='4'>성적 수정</th></tr>");
		out.print("<tr><th id='colr'>학생번호</th><th id='colr'>컴파일러</th><th id='colr'>한국어의미의이해</th><th id='colr'>마케팅원론</th></tr>");
		out.print("<tr><td><input type='text' name='code' value='"+score.getCode()+"'></td>");
			out.print("<td><input type='text' name='컴파일러' value='"+score.get컴파일러()+"'></td>");
			out.print("<td><input type='text' name='한국어의미의이해' value='"+score.get한국어의미의이해()+"'></td>");
			out.print("<td><input type='text' name='마케팅원론' value='"+score.get마케팅원론()+"'></td></tr>");
		out.print("<tr><td colspan='4' align='center'><input id='btn' type='submit' value='수정'</td></tr>");
		out.print("</table>");
		out.print("</form>");
	%>
	<% } %>
	
	<br>
	<a href="../index.html">학생 조회로 돌아가기</a>&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="scoreRegister_Form.jsp">신규성적 등록하기</a>
</body>
</html>