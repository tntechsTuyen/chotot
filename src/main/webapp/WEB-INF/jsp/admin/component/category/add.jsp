<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/jsp/admin/common/tags.jsp" %>
<!DOCTYPE html>
<html>
<%@ include file="/WEB-INF/jsp/admin/common/head.jsp" %>
<%@ include file="/WEB-INF/jsp/admin/common/css.jsp" %>
<body>
	<%@ include file="/WEB-INF/jsp/admin/common/loader.jsp" %>

    <div id="app" class="app app-header-fixed app-sidebar-fixed">
    	<%@ include file="/WEB-INF/jsp/admin/common/header.jsp" %>
    	<%@ include file="/WEB-INF/jsp/admin/common/sidebar.jsp" %>

    	<!-- Content -->
		<div id="content" class="app-content">
			<ol class="breadcrumb float-xl-end">
				<li class="breadcrumb-item"><a href="javascript:;">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="javascript:;">Danh mục</a></li>
				<li class="breadcrumb-item active">Thêm mới</li>
			</ol>

			<h1 class="page-header">
			  Danh mục <small>tạo mới</small>
			</h1>
			<div class="row">
				<div class="col-6">
					<div class="panel panel-inverse">
						<div class="panel-heading">
					    	<h4 class="panel-title">Form</h4>
						    <div class="panel-heading-btn">
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand" ><i class="fa fa-expand"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload" ><i class="fa fa-redo"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse" ><i class="fa fa-minus"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove" ><i class="fa fa-times"></i></a>
						    </div>
						</div>
						<div class="panel-body">
							<form:form modelAttribute="categoryForm" method="POST" enctype="multipart/form-data">
							<!-- Field Name -->
							<div class="form-floating">
							  	<form:input path="name" cssClass="form-control fs-15px"/>
							  	<label for="name" class="d-flex align-items-center fs-13px">Tên</label>
							</div>
							<!-- * Field Name -->

							<!-- Field Content -->
							<div class="form-floating mt-3">
							  	<form:input path="content" cssClass="form-control fs-15px"/>
							  	<label for="content" class="d-flex align-items-center fs-13px">Nội dung</label>
							</div>
							<!-- * Field Content -->

							<!-- Field Media -->
							<div class="form-floating mt-3">
								<form:hidden path="idMedia"/>
							  	<input type="file" name="fileMedia">
							</div>
							<!-- * Field Media -->

							<button type="submit" class="btn btn-primary mt-3">Tạo mới</button>
							<a class="btn btn-danger mt-3" onclick="history.back()">Quay lại</a>
							</form:form>
						</div>
					</div>
				</div>
			</div>	
		</div>
		<!-- * Content -->
    </div>
    <!-- * App -->
	<%@ include file="/WEB-INF/jsp/admin/common/js.jsp" %>
</body>
</html>
