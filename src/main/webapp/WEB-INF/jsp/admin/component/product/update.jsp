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
				<li class="breadcrumb-item"><a href="javascript:;">Sản phẩm</a></li>
				<li class="breadcrumb-item active">Cập nhật</li>
			</ol>

			<h1 class="page-header">
			  Sản phẩm <small>cập nhật</small>
			</h1>
			<div class="row">
				<div class="col-8">
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
							<form:form modelAttribute="productForm" method="POST">
							<div class="form-floating">
							  	<form:input path="idCategory" cssClass="form-control fs-15px" readonly="true" />
							  	<label for="idCategory" class="d-flex align-items-center fs-13px">Danh mục</label>
							</div>

							<div class="form-floating mt-2">
							  	<form:input path="name" cssClass="form-control fs-15px" readonly="true"/>
							  	<label for="name" class="d-flex align-items-center fs-13px">Tên</label>
							</div>

							<div class="form-floating mt-2">
							  	<form:input path="price" cssClass="form-control fs-15px" readonly="true"/>
							  	<label for="price" class="d-flex align-items-center fs-13px">Giá</label>
							</div>

							<div class="form-floating mt-2">
							  	<form:input path="priceVerify" cssClass="form-control fs-15px"/>
							  	<label for="priceVerify" class="d-flex align-items-center fs-13px">Xác minh giá</label>
							</div>

							<div class="form-floating mt-2">
								<form:select path="idStatus" cssClass="form-control fs-15px">
									<form:option value="5">Chờ xác nhận</form:option>
									<form:option value="6">Thông qua</form:option>
									<form:option value="7">Trả về</form:option>
								</form:select>
							  	<label for="idStatus" class="d-flex align-items-center fs-13px">Trạng thái</label>
							</div>
							
							<button type="submit" class="btn btn-primary mt-3">Cập nhật</button>
							<a class="btn btn-danger mt-3" onclick="history.back()">Quay lại</a>
							</form:form>
						</div>
					</div>

				</div>
				<div class="col-4">
					<div class="panel panel-inverse">
						<div class="panel-heading">
					    	<h4 class="panel-title">Media</h4>
						    <div class="panel-heading-btn">
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand" ><i class="fa fa-expand"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload" ><i class="fa fa-redo"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse" ><i class="fa fa-minus"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove" ><i class="fa fa-times"></i></a>
						    </div>
						</div>
						<div class="panel-body">
							<c:forEach items="${mediaData}" var="item">
								<div class="widget-img widget-img-xl rounded float-start me-5px border"><img class="w-100 h-100" src="${_ctx}/static/${item.url}"></div>
							</c:forEach>
						</div>
					</div>

					<div class="panel panel-inverse mt-2">
						<div class="panel-heading">
					    	<h4 class="panel-title">Meta data</h4>
						    <div class="panel-heading-btn">
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand" ><i class="fa fa-expand"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-success" data-toggle="panel-reload" ><i class="fa fa-redo"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse" ><i class="fa fa-minus"></i></a>
						    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove" ><i class="fa fa-times"></i></a>
						    </div>
						</div>
						<div class="panel-body">
							<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Key</th>
										<th>Name</th>
										<th>Value</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${metaData.size() > 0}">
										<c:forEach items="${metaData}" var="item">
										<tr>
											<td>${item.key}</td>
											<td>${item.name}</td>
											<td>${item.value}</td>
										</tr>
										</c:forEach>
									</c:if>
									<c:if test="${metaData.size() == 0}">
										<tr>
											<td class="text-center" colspan="4"><i class="fa fa-inbox"></i> Không có dữ liệu</td>
										</tr>
									</c:if>
								</tbody>
							</table>
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
