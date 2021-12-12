<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="student.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function check(ab_code) {
		code = prompt("수정 / 삭제하시려면 학생코드를 입력해 주세요");
		document.location.href="login.jsp?code="+code;
	}

</script>
</head>
<body>
	<jsp:useBean id="datas" class="student.DataManagerDAO" scope="page" />
	<%
		ArrayList<StudentInfo> dao = (ArrayList<StudentInfo>)datas.getDBList();
	%>
	<div align="center">
		<h2>전체 학생 목록</h2>
		<hr>
		<table border="1" align="center">
			<tr><td>학생번호</td><td>소속학과</td><td>학생이름</td><td>학년</td><td>성별</td><td>나이</td><td>전화번호</td><td>주소</td></tr>
			<%
				for(StudentInfo ab:(ArrayList<StudentInfo>) dao){
			%>
				<tr>
					<td><a href="javascript:check('<%= ab.getCode() %>')"><%= ab.getCode() %></a></td>
					<td><%= ab.getDept() %></td>
					<td><%= ab.getName() %></td>
					<td><%= ab.getGrade() %></td>
					<td><%= ab.getGender() %></td>
					<td><%= ab.getAge() %></td>
					<td><%= ab.getPhone() %></td>
					<td><%= ab.getAddress() %></td>
				</tr>
			<%
				}
			%>
		</table>
	</div>
</body>
</html>