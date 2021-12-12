<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="student.*" %>
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

</style>
</head>
<body>
	<jsp:useBean id="score" class="score.scoreInfo" scope="request" />
	<jsp:setProperty property="*" name="score"/>
	<jsp:useBean id="data" class="score.ScoreManagerDAO" scope="request" />
	
	<%
		String code = score.getCode();
		
		if(! data.isScore(code)){
			if(data.insertScore(score) != 0){
				out.print("성적이 등록되었습니다.<br>");
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