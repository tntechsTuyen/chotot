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

		<div class="login-container">
			<div class="login-header mb-30px">
				<div class="brand">
					<div class="d-flex align-items-center"><span class="logo"></span><b>Color</b> Admin</div>
					<small>Bootstrap 5 Responsive Admin Template</small>
				</div>
				<div class="icon"><i class="fa fa-sign-in-alt"></i></div>
			</div>


			<div class="login-content">
				<form:form modelAttribute="loginForm" method="POST" cssClass="fs-13px">
					<div class="form-floating mb-15px">
						<form:input path="username" cssClass="form-control h-45px fs-13px" placeholder="Username" />
						<label for="username" class="d-flex align-items-center fs-13px text-gray-300">Username</label>
					</div>
					<div class="form-floating mb-15px">
						<form:password path="password" cssClass="form-control h-45px fs-13px" placeholder="Password" />
						<label for="password" class="d-flex align-items-center fs-13px text-gray-300">Password</label>
					</div>
					<div class="mb-15px">
						<button type="submit" class="btn btn-primary d-block h-45px w-100 btn-lg fs-14px">Sign me in</button>
					</div>
					<div class="mb-40px pb-40px text-white">Not a member yet? Click <a href="${_ctx}/register" class="text-primary">here</a> to register.</div>
					<hr class="bg-gray-600 opacity-2" />
					<div class="text-gray-300 text-center text-white bg-opacity-50 mb-0">&copy; Color Admin All Right Reserved 2022</div>
				</form:form>
			</div>
		</div>
	</div>
	<script src="${_ctx}/static/js/admin/vendor.min.js" ></script>
	<script src="${_ctx}/static/js/admin/app.min.js" ></script>
</body>
</html>