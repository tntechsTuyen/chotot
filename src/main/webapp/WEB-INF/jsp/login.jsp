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
			</div>

			<div class="login-container">
				<div class="login-header mb-30px">
					<div class="brand">
						<div class="d-flex align-items-center"><span class="logo"></span><b>Đăng nhập</b></div>
					</div>
					<div class="icon"><i class="fa fa-sign-in-alt"></i></div>
				</div>


				<div class="login-content">
					<form:form modelAttribute="loginForm" method="POST" cssClass="fs-13px">
						<div class="form-floating mb-15px">
							<form:input path="username" cssClass="form-control h-45px fs-13px" placeholder="Tên đăng nhập" />
							<label for="username" class="d-flex align-items-center fs-13px text-gray-300">Tên đăng nhập</label>
						</div>
						<div class="form-floating mb-15px">
							<form:password path="password" cssClass="form-control h-45px fs-13px" placeholder="Mật khẩu" />
							<label for="password" class="d-flex align-items-center fs-13px text-gray-300">Mật khẩu</label>
						</div>
						<div class="mb-15px">
							<button type="submit" class="btn btn-primary d-block h-45px w-100 btn-lg fs-14px">Đăng nhập</button>
						</div>
						<div class="mb-40px pb-40px text-white">Bạn chưa có tài khoản? Ấn vào <a href="${_ctx}/register" class="text-primary">đây</a> để đăng ký.</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<script src="${_ctx}/static/js/admin/vendor.min.js" ></script>
	<script src="${_ctx}/static/js/admin/app.min.js" ></script>
</body>
</html>