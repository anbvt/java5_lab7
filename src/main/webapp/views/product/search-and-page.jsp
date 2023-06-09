<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SEARCH & PAGE</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="container mt-3">
	<h4>SEARCH & PAGE</h4>
	<form class="input-group" action="/product/search-and-page" method="post">
		<input class="form-control" name="keywords" value="${keywords}">
		<button class="btn btn-danger">Search</button>
	</form>
	<p class="float-end mt-3">
		<b>${page.number + 1} of ${page.totalPages }</b>
	</p>
	<p class="float-start mt-3">
		<a class="btn btn-info" href="/product/search-and-page?p=0">First</a>
		
		<c:if test="${page.number > 0}">
			<a class="btn btn-warning" href="/product/search-and-page?p=${page.number-1}">Previous</a>
		</c:if>
		
		<c:if test="${page.number < (page.totalPages-1)}">
			<a class="btn btn-danger" href="/product/search-and-page?p=${page.number+1}">Next</a>
		</c:if>
		
		<a class="btn btn-primary" href="/product/search-and-page?p=${page.totalPages-1}">Last</a>
	</p>
	<table class="table mt-3 table-hover table-bordered">
		<tr class="bg-info mt-3">
			<th>Id</th>
			<th>Name</th>
			<th class="w-50">Image</th>
			<th>Price</th>
			<th>Date</th>
		</tr>
		<c:forEach var="item" items="${page.content}">
			<tr>
				<td>${item.id}</td>
				<td>${item.name}</td>
				<td><img alt="?" class="w-25" src="/views/img/${item.image}"></td>
				<td><fmt:formatNumber value="${item.price}" type="currency" /></td>
				<td><fmt:formatDate value="${item.createDate}" type="date" /></td>
			</tr>
		</c:forEach>
	</table>

	<ul class="list-group w-100">
		<li class="list-group-item">Số sản phẩm hiện tại: ${page.numberOfElements }</li>
		<li class="list-group-item">Trang số: ${page.number + 1}</li>
		<li class="list-group-item">Kích thước trang: ${page.size }</li>
		<li class="list-group-item">Tổng số sản phẩm: ${page.totalElements }</li>
		<li class="list-group-item">Tổng số trang: ${page.totalPages }</li>
	</ul>
</body>
</html>