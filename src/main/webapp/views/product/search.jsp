<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH BY PRICE</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container mt-3">
	<h4>SEARCH BY PRICE</h4>
	<form class="input-group" action="/product/search" method="post">
		<input class="form-control" name="min" value="${param.min}" placeholder="Min Price?">
		<input class="form-control" name="max" value="${param.max}" placeholder="Max Price?">
		<button class="btn btn-warning">Search</button>
	</form>
	<table class="table mt-3 table-hover table-bordered">
		<tr class="bg-info mt-3">
			<th>Id</th>
			<th>Name</th>
			<th class="w-50">Image</th>
			<th>Price</th>
			<th>Date</th>
		</tr>
		<c:forEach var="item" items="${items}">
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td><img alt="?" class="w-25" src="/views/img/${item.image}"></td>
				<td><fmt:formatNumber value="${item.price}" type="currency" /></td>
				<td><fmt:formatDate value="${item.createDate}" type="date" /></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>