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
                    <a class="breadcrumb-item text-dark" href="${_ctx}/profile/order/${typeOrder}">Đơn hàng</a>
                    <span class="breadcrumb-item active">Chi tiết</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Start -->
    <div class="container-fluid">
        <c:if test="${orderInfo.idStatus == 4}">
        <div class="row px-xl-5">
            <div class="col-lg-12">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Đánh giá</span></h5>

            </div>
        </div>
        </c:if>
        <div class="row px-xl-5">
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thông tin người bán</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label>Họ tên</label>
                            <div class="form-control">${sellerInfo.fullName}</div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Số ĐT</label>
                            <div class="form-control">${sellerInfo.phone}</div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Địa chỉ</label>
                            <div class="form-control">${sellerInfo.address}</div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Email</label>
                            <div class="form-control">${sellerInfo.email}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thông tin người mua</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label>Họ tên</label>
                            <div class="form-control">${buyerInfo.fullName}</div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Số ĐT</label>
                            <div class="form-control">${buyerInfo.phone}</div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Địa chỉ</label>
                            <div class="form-control">${buyerInfo.address}</div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Email</label>
                            <div class="form-control">${buyerInfo.email}</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thông tin đơn hàng</span></h5>
                <div class="bg-light p-30 mb-4">
                    <div class="border-bottom">
                        <h6 class="mb-3">Sản phẩm</h6>
                        <div class="d-flex justify-content-between">
                            <p><a href="${_ctx}/product/${productInfo.id}">${productInfo.name}</a></p>
                            <p><fmt:formatNumber value="${productInfo.priceVerify}"/> đ</p>
                        </div>
                    </div>
                    <c:if test="${not empty orderSwapInfo}">
                        <div class="border-bottom pt-3">
                            <h6 class="mb-3">Sản phẩm trao đổi</h6>
                            <div class="d-flex justify-content-between">
                                <p><a href="${_ctx}/product/${productSwapInfo.id}">${productSwapInfo.name}</a></p>
                                <p><fmt:formatNumber value="${productSwapInfo.priceVerify}"/> đ</p>
                            </div>
                        </div>
                    </c:if>

                    <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Tạm tính</h6>
                            <h6><fmt:formatNumber value="${orderInfo.price}"/> đ</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí giao hàng</h6>
                            <h6 class="font-weight-medium">0 đ</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Tổng tiền cần thanh toán</h5>
                            <h5><fmt:formatNumber value="${orderInfo.price}"/> đ</h5>
                        </div>
                    </div>
                </div>

                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Trạng thái đơn hàng</span></h5>
                <div class="bg-light p-30 mb-5">
                    <c:forEach items="${orderHistoryInfo}" var="item">
                    <div class="border-bottom mt-3">
                        <div class="d-flex justify-content-between">
                            <p>${item.status}</p>
                            <p>${item.createdDate}</p>
                        </div>
                    </div>
                    </c:forEach>
                </div>
                <div class="mb-5">
                <c:if test="${_userInfo != null && orderInfo.idStatus != 4 && orderInfo.idStatus != 10 && (_userInfo.id == sellerInfo.id || _userInfo.id == buyerInfo.id)}">
                    <c:if test="${_userInfo.id == buyerInfo.id && orderInfo.idStatus == 2}">
                        <a href="${_ctx}/profile/order/${orderInfo.id}/approve" class="btn btn-block btn-primary font-weight-bold">Xác nhận</a>
                    </c:if>
                    <c:if test="${_userInfo.id == sellerInfo.id && orderInfo.idStatus != 2}">
                        <a href="${_ctx}/profile/order/${orderInfo.id}/approve" class="btn btn-block btn-primary font-weight-bold">Xác nhận</a>
                        <c:if test="${_userInfo.id == sellerInfo.id && orderInfo.idStatus == 1}">
                            <a href="${_ctx}/profile/order/${orderInfo.id}/cancel" class="btn btn-block btn-danger font-weight-bold">Hủy đơn</a>
                        </c:if>
                    </c:if>
                </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->

	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>