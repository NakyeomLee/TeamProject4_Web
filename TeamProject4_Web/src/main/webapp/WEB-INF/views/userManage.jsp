<!-- 작성자 : 이나겸 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<html>
<head>
<meta charset="UTF-8">
<title>가입 회원 관리 페이지</title>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
	height: 100vh;
	display: flex;
	flex-direction: column;
}

header {
	background-color: #333;
	color: #fff;
	padding: 10px 0;
	width: 100%;
	height: 125px;
	position: fixed; /* header를 고정 */
	top: 0;
	left: 0;
	z-index: 1000; /* 다른 내용 위에 고정되도록 z-index 추가 */
}

nav .logo {
	text-align: center;
}

main {
	display: flex;
	flex-direction: column;
	align-items: center; /* 수평 중앙 정렬 */
	width: 100%;
	padding-top: 170px; /* header 높이와 여유 공간을 줌 */
	overflow-y: auto; /* 내용이 많아지면 스크롤이 생기도록 설정 */
}

.panel {
	background-color: #fff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 90%;
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
	border: 1px solid #ddd; /* 표의 테두리 색상 */
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

button {
	border: 1px solid #ddd; /* 표와 동일한 테두리 색상 */
	border-radius: 5px; /* 테두리를 둥글게 설정 */
	padding: 5px 10px;
	background-color: #f2f2f2;
	color: #000;
	cursor: pointer;
}

/* 버튼에 마우스 호버 시 효과 */
button:hover {
	background-color: #f2f2f2;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
			<div id="userCount">
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
						<th>배송지(일단은 대표배송지x,여러배송지 중 랜덤 한개)</th>
						<th>회원등급</th>
						<th>등급변경</th>
						<th>회원차단</th>
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
							<td>
								<div
									style="float: left; width: calc(100% - 80px); overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
									${user.deliveryaddress}</div>
								<div style="float: right; width: 80px;">
									<button onclick="showDetails('${user.user_id}')">상세보기</button>
								</div>
							</td>
							<td>${user.user_grade}</td>
							<td>
								<!-- 등급 선택할 드롭박스 --> 
								<select class="gradeSelect">
									<option value="준회원" ${user.user_grade == '준회원' ? 'selected' : ''}>준회원</option>
									<option value="일반" ${user.user_grade == '일반' ? 'selected' : ''}>일반</option>
									<option value="VIP" ${user.user_grade == 'VIP' ? 'selected' : ''}>VIP</option>
								</select> 
								<!-- 변경 버튼을 누를 때 changeGrade() 호출 -->
								<button class="btnChangeGrade" data-user-id="${user.user_id}">변경</button>
							</td>
							<td>
								<button class="btnUserBlock"
									data-user-id="${user.user_id}">차단</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</main>
	<!-- 다이얼로그 -->
	<div id="deliveryDialog" style="display: none;" title="배송지 목록"></div>
</body>
<!-- productManage.js 파일과 연결함 -->
<script src="/management/userManage.js"></script>
</html>