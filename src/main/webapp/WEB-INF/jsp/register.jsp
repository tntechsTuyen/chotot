<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="_ctx" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }" scope="application"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Login System</title>
	<link href="${_ctx}/static/css/admin/vendor.min.css" rel="stylesheet" />
	<link href="${_ctx}/static/css/admin/transparent.min.css" rel="stylesheet" />
</head>
<body class='pace-top'>
	
	<!-- Loader -->
	<div id="loader" class="app-loader">
		<span class="spinner"></span>
	</div>
	<!-- * Loader -->

	<div id="app" class="app">
		<div class="login login-with-news-feed">
			<div class="news-feed">
				<div class="news-image" style="background-image: url(${_ctx}/static/dist/admin/login-bg-11.jpg)"></div>
				<div class="news-caption">
				<h4 class="caption-title"><b>Color</b> Admin App</h4>
				<p>Download the Color Admin app for iPhone®, iPad®, and Android™. Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
			</div>
		</div>


	<div class="register-container">

		<div class="register-header mb-25px h1">
			<div class="mb-1">Sign Up</div>
			<small class="d-block fs-15px lh-16">Create your Color Admin Account. It’s free and always will be.</small>
		</div>
		<div class="register-content">
			<form action="index.html" method="GET" class="fs-13px">
				<div class="mb-3">
					<label class="mb-2">Name <span class="text-danger">*</span></label>
					<div class="row gx-3">
						<div class="col-md-6 mb-2 mb-md-0"><input type="text" class="form-control fs-13px" placeholder="First name"></div>
						<div class="col-md-6"><input type="text" class="form-control fs-13px" placeholder="Last name"></div>
					</div>
				</div>
				<div class="mb-3">
					<label class="mb-2">Email <span class="text-danger">*</span></label>
					<input type="text" class="form-control fs-13px" placeholder="Email address">
				</div>
				<div class="mb-3">
					<label class="mb-2">Re-enter Email <span class="text-danger">*</span></label>
					<input type="text" class="form-control fs-13px" placeholder="Re-enter email address">
				</div>
				<div class="mb-4">
					<label class="mb-2">Password <span class="text-danger">*</span></label>
					<input type="password" class="form-control fs-13px" placeholder="Password">
				</div>
				<div class="form-check mb-4">
					<input class="form-check-input" type="checkbox" value="" id="agreementCheckbox">
					<label class="form-check-label" for="agreementCheckbox">By clicking Sign Up, you agree to our <a href="javascript:;">Terms</a> and that you have read our <a href="javascript:;">Data Policy</a>, including our <a href="javascript:;">Cookie Use</a>.</label>
				</div>
				<div class="mb-4">
					<button type="submit" class="btn btn-primary d-block w-100 btn-lg h-45px fs-13px">Sign Up</button>
				</div>
				<div class="mb-4 pb-5">Already a member? Click <a href="${_ctx}/login">here</a> to login.</div>
				<hr class="bg-gray-600 opacity-2">
				<p class="text-center text-gray-600">© Color Admin All Right Reserved 2022</p>
			</form>
		</div>
	</div>
	<script src="${_ctx}/static/js/admin/vendor.min.js" ></script>
	<script src="${_ctx}/static/js/admin/app.min.js" ></script>
</body>
</html>