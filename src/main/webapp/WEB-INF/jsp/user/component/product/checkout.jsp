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
                    <a class="breadcrumb-item text-dark" href="#">Home</a>
                    <a class="breadcrumb-item text-dark" href="#">Shop</a>
                    <span class="breadcrumb-item active">Checkout</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Start -->
    <div class="container-fluid">
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
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Order Total</span></h5>
                <div class="bg-light p-30 mb-5">
                    <div class="border-bottom">
                        <h6 class="mb-3">Sản phẩm</h6>
                        <div class="d-flex justify-content-between">
                            <p>${productInfo.name}</p>
                            <p>${productInfo.priceVerify} đ</p>
                        </div>
                    </div>
                    <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Subtotal</h6>
                            <h6>${productInfo.priceVerify} đ</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Shipping</h6>
                            <h6 class="font-weight-medium">0 đ</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Total</h5>
                            <h5>${productInfo.priceVerify} đ</h5>
                        </div>
                    </div>
                </div>
                <div class="mb-5">
                    <form method="POST">
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thanh toán</span></h5>
                        <div class="bg-light p-30">
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" name="idType" value="1" id="banktransfer" checked>
                                    <label class="custom-control-label" for="banktransfer">Tiền mặt</label>
                                </div>
                            </div>
                            <div class="form-group mb-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" name="idType" value="2" id="bankProduct">
                                    <label class="custom-control-label" for="bankProduct">Sản phẩm</label>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-block btn-primary font-weight-bold py-3">Place Order</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Checkout End -->

	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>