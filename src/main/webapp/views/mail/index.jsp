<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send mail</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
</head>
<body class="mt-3">
	<div class="container w-75">
		<form class="gy-2 gx-3 align-items-center"
			enctype="multipart/form-data" action="/send" method="POST">
			<div class="row">
				<h1 class="text-center text-uppercase">Send email</h1>
				<div class="col-12 mt-2">
					<label for="formControlInput">To</label>
					<div class="input-group">
						<div class="input-group-text">@</div>
						<input type="email" class="form-control" id="formControlInput"
							name="txtTo" placeholder="Nhập email người nhận...">
					</div>
				</div>
				<div class="col-6 mt-2">
					<label for="formControlInput2">CC</label>
					<div class="input-group">
						<div class="input-group-text">@</div>
						<input type="text" class="form-control" id="formControlInput2"
							name="txtCC"
							placeholder="Nhập email(cc) ngăn cách nhau bởi dấu ','">
					</div>
				</div>
				<div class="col-6 mt-2">
					<label for="formControlInput3">BCC</label>
					<div class="input-group">
						<div class="input-group-text">@</div>
						<input type="text" class="form-control" id="formControlInput3"
							name="txtBCC"
							placeholder="Nhập email(bcc) ngăn cách nhau bởi dấu ','">
					</div>
				</div>
				<div class="form-group mt-2">
					<label for="formControlInput4">Tiêu đề</label> <input type="text"
						class="form-control" id="formControlInput4" name="txtSubject"
						placeholder="Nhập tiêu đề...">
				</div>
				<div class="form-group mt-2">
					<label for="formControlTextarea">Nội dung</label>
					<textarea class="form-control" id="formControlTextarea"
						name="txtContent" rows="4" placeholder="Nhập nội dung..."></textarea>
				</div>
				<div class="form-group mt-2">
					<label for="formControlInput4">File đính kèm</label> 
					<input type="file" multiple class="form-control" id="formControlInput4" name="file">
				</div>
			</div>
			<button class="btn btn-danger mt-3 float-end text-uppercase">
				<b>Send</b>
			</button>
		</form>
	</div>
</body>
</html>