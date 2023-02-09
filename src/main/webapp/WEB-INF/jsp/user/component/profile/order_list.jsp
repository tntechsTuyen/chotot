<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                    <a class="breadcrumb-item text-dark" href="${_ctx}/profile">Hồ sơ</a>
                    <span class="breadcrumb-item active">Đơn hàng</span>
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

            <!-- Order list -->
            <div class="col-10 table-responsive">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Danh sách đơn hàng</span></h5>
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Hình thức</th>
                            <th>Trạng thái</th>
                            <th>Cập nhật lúc</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <c:forEach items="${orderData}" var="item">
                        <tr>
                            <td class="align-middle"><img src="${_ctx}/static/${item.thumb}" alt="" style="width: 50px;">${item.name}</td>
                            <td class="align-middle"><fmt:formatNumber value="${item.price}"/> đ</td>
                            <td class="align-middle">${item.type}</td>
                            <td class="align-middle">${item.status}</td>
                            <td class="align-middle">${item.updatedDate}</td>
                            <td class="align-middle"><a href="${_ctx}/profile/order/${typeOrder}/${item.id}" class="btn btn-sm btn-info"><i class="fa fa-info-circle"></i></a></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- * Order list -->
        </div>
    </div>
	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>