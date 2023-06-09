<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<form:form action="/category/index" modelAttribute="item">
	<form:input path="id" placeholder="Category Id?"/>
	<form:input path="name" placeholder="Category Name?"/>
	<hr>
	<button class="btn btn-primary" formaction="/category/create">Create</button>
	<button class="btn btn-danger" formaction="/category/update">Update</button>
	<a class="btn btn-warning" href="/category/delete/${item.id}">Delete</a>
	<a class="btn btn-info" href="/category/index">Reset</a>
</form:form>
