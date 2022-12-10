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
				<li class="breadcrumb-item active">Cập nhật</li>
			</ol>

			<h1 class="page-header">
			  Danh mục <small>cập nhật</small>
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
							<form:form modelAttribute="categoryForm" method="POST">
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

							<!-- Field Icon -->
							<div class="form-floating input-group mt-3" href="#modal-choose-icon" data-bs-toggle="modal">
							  	<form:input path="icon" cssClass="form-control fs-15px" readonly="true" />
							  	<label for="icon" class="d-flex align-items-center fs-13px">Icon</label>
							  	<div class="input-group-text"><i for="icon"></i></div>
							</div>
							<!-- * Field Icon -->

							<button type="submit" class="btn btn-primary mt-3">Cập nhật</button>
							<a class="btn btn-danger mt-3" onclick="history.back()">Quay lại</a>
							</form:form>
						</div>
					</div>
				</div>

				<div class="col-4">
					<div class="panel panel-inverse">
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
							<table id="tbl-pro-style" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Key</th>
										<th>Value</th>
										<th>Description</th>
										<th width="80px" class="text-center"><a class="btn-link cursor-pointer" onclick="addMeta()"><i class="fa fa-plus-circle"></i></a></th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${metaData.size() > 0}">
										<c:forEach items="${metaData}" var="item">
											<tr>
												<td>${item.key}</td>
												<td>${item.value}</td>
												<td>${item.description}</td>
												<td>
													<a class="btn btn-primary btn-sm" onclick="editMeta(this)" 
													data-id="${item.id}" data-key="${item.key}" data-value="${item.value}" data-description="${item.description}">
														<i class="fa fa-cog"></i>
														Edit
													</button>
												</td>
											</tr>
										</c:forEach>
									</c:if>

									<c:if test="${metaData.size() == 0}">
										<tr>
											<td class="text-center" colspan="4"><i class="fa fa-inbox"></i> No data</td>
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

		<!-- Modal Choose Icon -->
		<div class="modal fade" id="modal-choose-icon">
		  	<div class="modal-dialog modal-dialog-scrollable modal-xl">
		    	<div class="modal-content">
			      	<div class="modal-header">
			        	<h4 class="modal-title">Please choose ICON</h4>
			        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
			      	</div>
			      	<div class="modal-body">
			        	<div class="row" id="list-icon">
			        		
			        	</div>
			      	</div>
			      	<div class="modal-footer">
			        	<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">Close</a>
			        	<a href="javascript:;" class="btn btn-success">Save</a>
			      	</div>
		    	</div>
		  	</div>
		</div>
		<!-- * Modal Choose Icon -->

		<!-- Modal Meta -->

  		<form:form modelAttribute="metaForm" method="POST" action="${_ctx}/admin/category/${categoryForm.id}/meta/update">
		<div class="modal fade" id="modal-meta">
		  	<div class="modal-dialog modal-dialog-scrollable">
		    	<div class="modal-content">
			      	<div class="modal-header">
			        	<h4 class="modal-title">Chỉnh sửa</h4>
			        	<button type="button" class="btn-close" data-bs-dismiss="modal" aria-hidden="true"></button>
			      	</div>
			      	<div class="modal-body">
			      		<table class="table table-bordered m-0">
			      			<tr>
			      				<th>Key</th>
			      				<td>
			      					<form:hidden path="id"/>
			      					<form:input path="key" cssClass="form-control"/>
			      				</td>
			      			</tr>
			      			<tr>
			      				<th>Value</th>
			      				<td><form:input path="value" cssClass="form-control"/></td>
			      			</tr>
			      			<tr>
			      				<th>Description</th>
			      				<td><form:input path="description" cssClass="form-control"/></td>
			      			</tr>
			      		</table>
			      	</div>
			      	<div class="modal-footer">
			        	<a href="javascript:;" class="btn btn-white" data-bs-dismiss="modal">Hủy</a>
			        	<button class="btn btn-success" type="submit">Cập nhật</button>
			      	</div>
		    	</div>
		  	</div>
		</div>
		</form:form>
		<!-- * Modal Meta -->
    </div>
    <!-- * App -->
	<%@ include file="/WEB-INF/jsp/admin/common/js.jsp" %>
	<script>
		var icons = ["fa fa-people-arrows-left-right","fa fa-people-carry-box","fa fa-pepper-hot","fa fa-percent","fa fa-person","fa fa-person-biking","fa fa-person-booth","fa fa-person-dots-from-line","fa fa-person-dress","fa fa-person-hiking","fa fa-person-praying","fa fa-person-running","fa fa-person-skating","fa fa-person-skiing","fa fa-person-skiing-nordic","fa fa-person-snowboarding","fa fa-person-swimming","fa fa-person-walking","fa fa-person-walking-with-cane"];

		initIcon();
		function initIcon(){
			for(var i = 0; i < icons.length; i++){
				const html = `<div class="col-1">
			        			<div class="item text-center" data-icon="`+icons[i]+`">
			        				<i class="`+icons[i]+` h1"></i>
			        				<p>`+icons[i].replace("fa ", "")+`</p>
			        			</div>
			        		</div>`;
				$("#list-icon").append(html);
			}

			$("#list-icon .item").click(function(){
				$("#icon").val($(this).data("icon"));
				$(`i[for="icon"]`).attr("class", $(this).data("icon")+" h2");
				$("#modal-choose-icon").modal("hide")
			})
		}

		function addMeta(){
			$(`#metaForm input`).val("")
			$("#modal-meta").modal("show")
		}

		function editMeta(obj){
			$(`#metaForm [name="id"]`).val(obj.dataset.id)
			$(`#metaForm [name="key"]`).val(obj.dataset.key)
			$(`#metaForm [name="value"]`).val(obj.dataset.value)
			$(`#metaForm [name="description"]`).val(obj.dataset.description)
			$("#modal-meta").modal("show")
		}
    </script>
</body>
</html>
