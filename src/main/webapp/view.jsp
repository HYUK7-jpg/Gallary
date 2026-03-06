<%@page import="pojo.Frame"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="pojo.DBcon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.container{
		diaplay:grid;
	}
	img{
		width:200px;
	}
</style>
<body>
<h1>Gallary</h1>

<%
	Connection con = DBcon.getCon();
	Statement st = con.createStatement();
	String sql ="SELECT * FROM gallary";
	ResultSet rs = st.executeQuery(sql);
	ArrayList<Frame> gallary = new ArrayList<>();
	while (rs.next()){
		Frame frame = new Frame();
		frame.setTitle(rs.getString("title"));
		frame.setArtist(rs.getString("artist"));
		frame.setComment(rs.getString("commentary"));
		frame.setArt(rs.getString("art"));
		gallary.add(frame);
	}
	pageContext.setAttribute("gallary", gallary);
%>


<div class="container">
	
	<ul>
		<li>사진</li>
		<li>제목</li>
		<li>작가</li>
		<li>텍스트</li>
		<li>qjxms</li>
	</ul>
	<c:forEach var="art" items="${gallary }" >
		<ul>
			<li><img src="arts/${art.art }" alt="${art.art }"></li>
			<li>${art.title }</li>
			<li>${art.artist }</li>
			<li>${art.comment }</li>
			<li>qjxms</li>
		</ul>
	</c:forEach>
	
	
</div>

	
</body>
</html>