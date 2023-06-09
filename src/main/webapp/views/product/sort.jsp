<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Sorting</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container mt-3">
	<h3>SORTING BY ${field}</h3>
	<table class="table mt-3 table-hover table-bordered">
		<tr class="bg-light mt-3">
			<th><a href="/product/sort?field=id">Id</a></th>
			<th><a href="/product/sort?field=name">Name</a></th>
			<th><a href="/product/sort?field=price">Price</a></th>
			<th><a href="/product/sort?field=createDate">Date</a></th>
		</tr>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td>${item.price}</td>
				<td>${item.createDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>