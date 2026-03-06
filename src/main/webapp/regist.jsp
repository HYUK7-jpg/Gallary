<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Gallary</h1>


<div>
	<form action="register" method="POST" enctype="multipart/form-data" id="frm">
		<input type="text" name="title" placeholder="작품 제목" required> <br>
		<input type="text" name="artist" placeholder="작가" required> <br><br>
		<textarea rows="10" cols="50" name="comment" placeholder="내용을 입력하세요"></textarea><br>
		<input type="file" name="art">
		<hr>
		<input type="submit" value="regist">
	</form>
</div>

<script>
	const frm = document.querySelector("#frm");

</script>

</body>
</html>