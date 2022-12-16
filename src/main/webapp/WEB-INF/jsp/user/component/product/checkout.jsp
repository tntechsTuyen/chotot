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
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thông tin đơn hàng</span></h5>
                <div class="bg-light p-30 mb-3">
                    <div class="border-bottom">
                        <h6 class="mb-3">Sản phẩm</h6>
                        <div class="d-flex justify-content-between">
                            <p>${productInfo.name}</p>
                            <p>${productInfo.priceVerify} đ</p>
                        </div>
                    </div>
                    <div class="border-bottom pt-3 pb-2">
                        <div class="d-flex justify-content-between mb-3">
                            <h6>Tạm tính</h6>
                            <h6>${productInfo.priceVerify} đ</h6>
                        </div>
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Phí giao hàng</h6>
                            <h6 class="font-weight-medium">0 đ</h6>
                        </div>
                    </div>
                    <div class="pt-2">
                        <div class="d-flex justify-content-between mt-2">
                            <h5>Tổng tiền</h5>
                            <h5>${productInfo.priceVerify} đ</h5>
                        </div>
                    </div>
                </div>

                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Sản phẩm trao đổi</span></h5>
                <div class="bg-light p-30 mb-3">
                    <div class="border-bottom">
                        <h6 class="mb-3">Sản phẩm</h6>
                        <div class="d-flex justify-content-between">
                            <p>${productInfo.name}</p>
                            <p>${productInfo.priceVerify} đ</p>
                        </div>
                    </div>
                </div>

                <div class="mb-5">
                    <form method="POST">
                        <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thanh toán</span></h5>
                        <div class="bg-light p-30">
                            <input type="hidden" name="idProductSwap">
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" name="idType" value="1" id="banktransfer" checked>
                                    <label class="custom-control-label" for="banktransfer">Tiền mặt</label>
                                </div>
                            </div>
                            <div class="form-group mb-4">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" name="idType" value="2" id="bankProduct" data-toggle="modal" data-target="#modal-product">
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
    <!-- Modal -->
    <div class="modal fade" id="modal-product" tabindex="-1" role="dialog" aria-labelledby="modal-product-title" aria-hidden="true">
        <div class="modal-dialog modal-xl" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modal-product-title">Sản phẩm của bạn</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body" style="background-color: #F5F5F5">
                    <div class="row">
                        <c:if test="${myProductData.size() == 0}">Không có dữ liệu</c:if>
                        <c:forEach items="${myProductData}" var="item">
                        <div class="col-lg-3 col-md-3 col-sm-6 pb-1">
                            <div class="product-item bg-light mb-4">
                                <div class="product-img position-relative overflow-hidden">
                                    <img class="img-fluid w-100" src="${_ctx}/static/${item.thumb}" style="min-height: 200px; max-height: 200px">
                                </div>
                                <div class="text-center py-4">
                                    <a class="h6 text-decoration-none text-truncate" href="">${item.name}</a>
                                    <div class="d-flex align-items-center justify-content-center mt-2">
                                        <h5>${item.priceVerify}</h5><h6 class="text-muted ml-2"><del>${item.price}</del></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>