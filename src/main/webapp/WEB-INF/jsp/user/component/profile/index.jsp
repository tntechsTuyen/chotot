<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/jsp/user/common/head.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/user/common/header.jsp" %>
	
    <!-- Breadcrumb Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <div class="col-12">
                <nav class="breadcrumb bg-light mb-30">
                    <a class="breadcrumb-item text-dark" href="${_ctx}/">Trang chủ</a>
                    <span class="breadcrumb-item active">Hồ sơ</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Profile Start -->
            <div class="col-2">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Menu</span></h5>
                <ul class="list-group">
                    <li class="list-group-item"><a class="text-dark" href="${_ctx}/profile">Hồ sơ</a></li>
                    <li class="list-group-item"><a class="text-dark" href="${_ctx}/profile/product">Sản phẩm</a></li>
                    <li class="list-group-item"><a class="text-dark" href="${_ctx}/profile/order/buy">Đơn hàng mua</a></li>
                    <li class="list-group-item"><a class="text-dark" href="${_ctx}/profile/order/sell">Đơn hàng bán</a></li>
                </ul>
            </div>
            <!-- Profile End -->

            <!-- Shop Product Start -->
            <div class="col-10">
                <!-- Profile User -->
                <div class="container-fluid">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thông tin tài khoản</span></h5>
                    <div class="bg-light p-30 mb-5">
                        <form:form modelAttribute="profileForm" method="POST">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <label>Tên đăng nhập</label>
                                <div class="form-control">${profileForm.username}</div>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Mật khẩu</label>
                                <form:input path="password" cssClass="form-control" type="password"/>
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Họ tên</label>
                                <form:input path="fullName" cssClass="form-control" />
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Địa chỉ</label>
                                <form:input path="address" cssClass="form-control" />
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Email</label>
                                <form:input path="email" cssClass="form-control" />
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Số điện thoại</label>
                                <form:input path="phone" cssClass="form-control" />
                            </div>
                            <div class="col-md-6 form-group">
                                <label>Giới tính</label>
                                <form:select path="gender" cssClass="custom-select">
                                    <form:option value="1">Nam</form:option>
                                    <form:option value="0">Nữ</form:option>
                                </form:select>
                            </div>
                            <div class="col-md-12 mt-2">
                                <button type="button" class="btn btn btn-primary">Cập nhật</button>
                            </div>
                        </div>
                        </form:form>
                    </div>
                </div>
                <!-- * Profile User -->
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>