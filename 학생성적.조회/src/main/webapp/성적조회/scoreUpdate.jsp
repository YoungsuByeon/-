<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="score.*" %>
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
	<jsp:useBean id="score" class="score.scoreInfo" scope="page" />
	<jsp:setProperty property="*" name="score"/>
	<jsp:useBean id="data" class="score.ScoreManagerDAO" scope="page" />
	
	<% 
		String code = (String)session.getAttribute("CODE");
		if(code != null){
			if(data.updateScore(score) != 0){
				out.print("점수를 수정하였습니다.<br>");
				out.print("<a href='scoreinfo.jsp'>성적정보 확인하기</a>");
			}else{
				out.print("점수 수정에 실패했습니다.<br>");
				out.print("<a href='../학생조회/info.jsp'>학생정보로 돌아가기</a>");
			}
		}
	%>
</body>
</html>