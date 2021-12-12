<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="score.*" %>
<%@ page import="student.*" %>
<%
	request.setCharacterEncoding("utf-8");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="datas" class="score.ScoreManagerDAO" scope="page" />
		<%
			ArrayList<scoreInfo> dao = (ArrayList<scoreInfo>)datas.getDBList();
		%>
		<div align="center">
			<h2>전체 성적정보</h2>
			<form action="#" method="get">
				<table border="1" align="center">
					<tr><td>학생번호</td><td>소속학과</td><td>학생이름</td><td>학년</td><td>성별</td><td>나이</td><td>전화번호</td><td>주소</td><td>컴파일러</td><td>한국어의미의이해</td><td>마케팅원론</td><td>총점</td><td>평균</td><td>석차</td></tr>
					<%
						for(scoreInfo ab: (ArrayList<scoreInfo>) dao){
					%>
						<tr>
							<td><%= ab.getCode() %></td>
							<td><%= ab.getDept() %></td>
							<td><%= ab.getName() %></td>
							<td><%= ab.getGrade() %></td>
							<td><%= ab.getGender() %></td>
							<td><%= ab.getAge() %></td>
							<td><%= ab.getPhone() %></td>
							<td><%= ab.getAddress() %></td>
							<td><%= ab.get컴파일러() %></td>
							<td><%= ab.get한국어의미의이해() %></td>
							<td><%= ab.get마케팅원론() %></td>
							<td><%= ab.get총점() %></td>
							<td><%= ab.get평균() %></td>
							<td><%= ab.get석차() %></td>
						</tr>
					<%
						}
					%>
				</table>
			</form>
		</div>
</body>
</html>