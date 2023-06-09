<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>

<table class="table mt-3 table-hover">
	<tr class="bg-info mt-3">
		<th>Id</th>
		<th>Name</th>
		<th></th>
	</tr>
	<c:forEach var="item" items="${items}">
		<tr>
			<td>${item.id}</td>
			<td>${item.name}</td>
			<td><a href="/category/edit/${item.id}">Edit</a></td>
		</tr>
	</c:forEach>
</table>