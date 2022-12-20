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

		<div id="content" class="app-content">
			<ol class="breadcrumb float-xl-end">
				<li class="breadcrumb-item"><a href="javascript:;">Trang chủ</a></li>
				<li class="breadcrumb-item"><a href="javascript:;">Tài khoản</a></li>
				<li class="breadcrumb-item active">Danh sách</li>
			</ol>

			<h1 class="page-header d-flex align-items-center">
			  Quản lý tài khoản <small class="ms-2"></small>
			</h1>

			<!-- Panel search -->
			<div class="panel panel-inverse">
				<div class="panel-heading">
			    	<h4 class="panel-title">Search</h4>
				    <div class="panel-heading-btn">
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-default" data-toggle="panel-expand" ><i class="fa fa-expand"></i></a>
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-warning" data-toggle="panel-collapse" ><i class="fa fa-minus"></i></a>
				    	<a href="javascript:;" class="btn btn-xs btn-icon btn-danger" data-toggle="panel-remove" ><i class="fa fa-times"></i></a>
				    </div>
				</div>
				<div class="panel-body">
					<form:form modelAttribute="search" method="GET">
						<div class="row">
							<div class="col-2">
								<div class="input-group mb-3">
									<span class="input-group-text">Tài khoản</span>
									<form:input path="username" cssClass="form-control"/>
								</div>
							</div>
							<div class="col-2">
								<div class="input-group mb-3">
									<span class="input-group-text">Số điện thoại</span>
									<form:input path="phone" cssClass="form-control"/>
								</div>
							</div>
							<div class="col-2">
								<div class="input-group mb-3">
									<span class="input-group-text">Mail</span>
									<form:input path="email" cssClass="form-control"/>
								</div>
							</div>
							<div class="col-5">
								<button type="submit" class="btn btn-primary"><i class="fa fa-search me-2"></i>Tìm kiếm</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
			<!-- * Panel search -->

			<!-- Panel list -->
			<div class="panel panel-inverse">
				<div class="panel-heading">
			    	<h4 class="panel-title">List</h4>
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
								<th>#</th>
								<th>Tài khoản</th>
								<th>Tên</th>
								<th>SĐT</th>
								<th>Địa chỉ</th>
								<th>Mail</th>
								<th>Giới tính</th>
								<th>Quyền hạn</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${data.getContent().size() > 0}">
								<c:forEach items="${data.getContent()}" var="item">
									<tr>
										<td>${item.id}</td>
										<td>${item.username}</td>
										<td>${item.fullName}</td>
										<td>${item.phone}</td>
										<td>${item.address}</td>
										<td>${item.email}</td>
										<td>${item.gender}</td>
										<td>${item.idRole}</td>
										<td><a href="${_ctx}/admin/user/update/${item.id}"><i class="fa fa-cog"></i> Edit</a></td>
									</tr>
								</c:forEach>
							</c:if>

							<c:if test="${data.getContent().size() == 0}">
								<tr>
									<td class="text-center" colspan="9"><i class="fa fa-inbox"></i> Không có dữ liệu</td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<div class="text-end">
						<div class="btn-group paging" onload="generalPage('.paging');"
						 data-page="${search.getPage()}"
						 data-count="${data.getTotalElements()}"
						 data-limit="${search.getRow()}"></div>
					</div>
				</div>
			</div>
			<!-- * Panel list -->
		</div>
    </div>

	<%@ include file="/WEB-INF/jsp/admin/common/js.jsp" %>
</body>
</html>
