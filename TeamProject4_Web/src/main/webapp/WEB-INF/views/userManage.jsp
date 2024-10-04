<!-- 작성자 : 이나겸 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding-top: 60px; /* header 높이만큼 여백 추가 */
    background-color: #f4f4f4;
    height: 100vh;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}

header {
    background-color: #333;
    color: #fff;
    padding: 10px 0;
    width: 100%;
    box-sizing: border-box;
    position: fixed;
    top: 0;
    left: 0;
    z-index: 1000;
    text-align: center;
    height: 60px;
    line-height: 60px;
}

nav {
    background-color: #333; /* nav에도 동일한 배경색 적용 */
    width: 100%; /* nav가 header와 같은 너비를 가지도록 설정 */
    height: 100%; /* header와 nav의 높이를 동일하게 */
}

nav .logo {
	text-align: center;
}

main {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-grow: 1;
    width: 100%;
    flex-direction: column;
    padding-top: 60px; /* header와 겹치지 않도록 여백 추가 */
    overflow-y: auto; /* 내용이 많아지면 스크롤이 생기도록 설정 */
}

.panel {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 80%;
	margin-bottom: 20px; /* 패널 사이 간격 */
}

.panel h3 {
	text-align: left;
	font-size: 20px;
	margin-bottom: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 10px;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 8px;
	text-align: center;
}

th {
	background-color: #f2f2f2;
}

/* panel에 마우스 호버 시 그림자 확대 */
.panel:hover {
	box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}
</style>
</head>
<body>
	<header>
		<nav>
			<div class="logo">
				<h1>Web Project 홈페이지</h1>
				<h2>회원 관리</h2>
			</div>
		</nav>
	</header>
	<main>
		<div class="panel">
			<h3>가입 회원 목록</h3>
			<div>
				총 회원수 :
				<%=request.getAttribute("joinUserCount")%>명
			</div>
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>회원등급</th>
					</tr>
				</thead>
				<tbody>
					<!-- forEach로 userList 순회해서 표에 가입 회원을 다 나타낼수 있도록 함 -->
					<c:forEach var="user" items="${userList}">
						<tr>
							<td>${user.user_id}</td>
							<td>${user.user_name}</td>
							<td>${user.user_gender}</td>
							<td>${user.user_birth}</td>
							<td>${user.user_phone}</td>
							<td>${user.user_address}</td>
							<td>${user.user_grade}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="panel">
			<h3>차단 회원 목록</h3>
			<div>
				차단 회원 :
				<%=request.getAttribute("blockUserCount")%>명
			</div>
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>성별</th>
						<th>생년월일</th>
						<th>전화번호</th>
						<th>주소</th>
						<th>회원등급</th>
					</tr>
				</thead>
				<tbody>
					<!-- forEach로 blackList 순회해서 표에 차단된 회원을 다 나타낼수 있도록 함 -->
					<c:forEach var="user" items="${blackList}">
						<tr>
							<td>${user.user_id}</td>
							<td>${user.user_name}</td>
							<td>${user.user_gender}</td>
							<td>${user.user_birth}</td>
							<td>${user.user_phone}</td>
							<td>${user.user_address}</td>
							<td>${user.user_grade}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="panel">
			<h3>탈퇴 회원 목록</h3>
			<div>
				탈퇴 회원 :
				<%=request.getAttribute("leaveUserCount")%>명
			</div>
			<table>
				<thead>
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody>
					<!-- forEach로 leaveList 순회해서 표에 탈퇴 회원을 다 나타낼수 있도록 함 -->
					<c:forEach var="user" items="${leaveList}">
						<tr>
							<td>${user.user_id}</td>
							<td>${user.user_name}</td>
							<td>${user.user_phone}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
</body>
</html>