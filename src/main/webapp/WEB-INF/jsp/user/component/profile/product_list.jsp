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
                    <span class="breadcrumb-item active">Sản phẩm</span>
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

            <!-- My Product Start -->
            <div class="col-lg-10 col-md-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Danh sách sản phẩm</span></h5>
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div class="ml-2">
                                <a href="${_ctx}/profile/product/add" class="btn btn-info btn-sm">Thêm mới</a>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${productData}" var="item">
                    <div class="col-lg-2 col-md-3 col-sm-3 pb-1">
                        <div class="product-item bg-light mb-4">
                            <div class="product-img position-relative overflow-hidden">
                                <img class="img-fluid" style="max-height: 170px; min-height: 170px" src="${_ctx}/static/${item.thumb}" alt="">
                                <div class="product-action">
                                    <c:if test="${item.idStatus == 5}">
                                        <a class="btn btn-outline-dark btn-square" href="${_ctx}/profile/product/${item.id}"><i class="far fa-edit"></i></a>
                                    </c:if>
                                    <c:if test="${item.idStatus != 8}">
                                        <a class="btn btn-danger btn-square" href="${_ctx}/profile/product/${item.id}/delete"><i class="far fa-trash-alt"></i></a>
                                    </c:if>
                                </div>
                            </div>
                            <div class="text-center pt-4" style="min-height: 84px;">
                                <c:if test="${item.idStatus == 5}">
                                    <div class="h6 text-decoration-none text-truncate">${item.name}</div>
                                </c:if>
                                <c:if test="${item.idStatus != 5}">
                                    <div class="h6 text-decoration-none text-truncate"><a href="${_ctx}/product/${item.id}">${item.name}</a></div>
                                </c:if>
                                <div class="d-flex align-items-center justify-content-center mt-2">
                                    <c:if test="${item.priceVerify != null}"><h5><fmt:formatNumber value="${item.priceVerify}"/> đ</h5></c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
            <!-- My Product End -->

        </div>
    </div>
	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>