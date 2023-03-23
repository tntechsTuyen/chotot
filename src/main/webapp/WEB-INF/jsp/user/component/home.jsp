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

    <!-- Carousel Start -->
    <div class="container-fluid mb-3">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <div id="header-carousel" class="carousel slide carousel-fade mb-30 mb-lg-0" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#header-carousel" data-slide-to="0" class="active"></li>
                        <li data-target="#header-carousel" data-slide-to="1"></li>
                        <li data-target="#header-carousel" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="carousel-item position-relative active" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="static/dist/carousel-1.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Mua bán đồ cũ</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Mua bán đồ cũ góp cây tạo sinh kế</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="static/dist/carousel-2.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Bán mọi thứ</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Bán mọi thứ thu tiền tươi</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                        <div class="carousel-item position-relative" style="height: 430px;">
                            <img class="position-absolute w-100 h-100" src="static/dist/carousel-3.jpg" style="object-fit: cover;">
                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                                <div class="p-3" style="max-width: 700px;">
                                    <h1 class="display-4 text-white mb-3 animate__animated animate__fadeInDown">Món hời sẵn</h1>
                                    <p class="mx-md-5 px-5 animate__animated animate__bounceIn">Món hời sẵn chả cần sale</p>
                                    <a class="btn btn-outline-light py-2 px-4 mt-3 animate__animated animate__fadeInUp" href="#">Xem thêm</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="product-offer mb-30" style="height: 200px;">
                    <img class="img-fluid" src="static/dist/offer-1.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Đánh giá vài giây</h6>
                        <h3 class="text-white mb-3">Xây dựng cộng đồng lành mạnh</h3>
                        <a href="" class="btn btn-primary">Xem thêm</a>
                    </div>
                </div>
                <div class="product-offer mb-30" style="height: 200px;">
                    <img class="img-fluid" src="static/dist/offer-2.jpg" alt="">
                    <div class="offer-text">
                        <h6 class="text-white text-uppercase">Nhận món hời trước</h6>
                        <h3 class="text-white mb-3">Trả tiền sau</h3>
                        <a href="" class="btn btn-primary">Xem thêm</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Carousel End -->

    <!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Chất lượng sản phẩm</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Mặt hàng đa dạng</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Công khai minh bạch</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center bg-light mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Hỗ trợ 24/7</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->

    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Danh mục</span></h2>
        <div class="row px-xl-5 pb-3">
            <c:forEach items="${categoryList}" var="item">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <a class="text-decoration-none" href="${_ctx}/product/list?idCategory=${item.id}">
                    <div class="cat-item d-flex align-items-center mb-4">
                        <div class="overflow-hidden" style="width: 100px; height: 100px;">
                            <img class="img-fluid" src="${_ctx}/static/${item.thumb}" alt="">
                        </div>
                        <div class="flex-fill pl-3">
                            <h6>${item.name}</h6>
                            <small class="text-body">100 Products</small>
                        </div>
                    </div>
                </a>
            </div>
            </c:forEach>
        </div>
    </div>
    <!-- Categories End -->

    <!-- Products Start -->
    <div class="container-fluid pt-5 pb-3">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Sản phẩm nổi bật</span></h2>
        <div class="row px-xl-5">
            <c:forEach items="${productFeature}" var="item">
            <div class="col-lg-3 col-md-4 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="${_ctx}/static/${item.thumb}" style="height: 300px">
                        <c:if test="${_userInfo != null}">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href="${_ctx}/post/${item.idPost}/follow">
                                <c:if test="${item.hadFollow == 1}">
                                    <i class="fas fa-bookmark"></i>
                                </c:if>
                                <c:if test="${item.hadFollow == null || item.hadFollow == 0}">
                                    <i class="far fa-bookmark"></i>
                                </c:if>
                            </a>
                            <a class="btn btn-outline-dark btn-square" href="${_ctx}/post/${item.idPost}/like">
                                <c:if test="${item.hadLike == 1}">
                                    <i class="fas fa-heart"></i>
                                </c:if>
                                <c:if test="${item.hadLike == null || item.hadLike == 0}">
                                    <i class="far fa-heart"></i>
                                </c:if>
                            </a>
                            <a class="btn btn-outline-dark btn-square" href="${_ctx}/product/${item.id}/checkout"><i class="fa fa-shopping-cart"></i></a>
                        </div>
                        </c:if>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="${_ctx}/product/${item.id}">${item.name}</a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5><fmt:formatNumber value="${item.priceVerify}"/> đ</h5><h6 class="text-muted ml-2"></h6>
                        </div>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <small class="fa fa-eye text-primary mr-1"></small>
                            <small>(${item.totalView})</small>
                            <small class="fa fa-bookmark text-primary mr-1 ml-3"></small>
                            <small>(${item.totalFollow})</small>
                            <small class="fa fa-heart text-primary mr-1 ml-3"></small>
                            <small>(${item.totalLike})</small>
                            <small class="fa fa-comment-alt text-primary mr-1 ml-3"></small>
                            <small>(${item.totalComment})</small>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
    <!-- Products End -->

    <c:if test="${_userInfo != null}">
        <!-- Products View Start -->
        <div class="container-fluid pt-5 pb-3">
            <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Đã xem gần đây</span></h2>
            <div class="row px-xl-5">
                <c:forEach items="${productViewed}" var="item">
                <div class="col-lg-2 col-md-3 col-sm-6 pb-1">
                    <div class="product-item bg-light mb-4">
                        <div class="product-img position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="${_ctx}/static/${item.thumb}" style="min-height: 200px; max-height: 200px">
                            <c:if test="${_userInfo != null}">
                            <div class="product-action">
                                <a class="btn btn-outline-dark btn-square" href="${_ctx}/post/${item.idPost}/follow">
                                    <c:if test="${item.hadFollow == 1}">
                                        <i class="fas fa-bookmark"></i>
                                    </c:if>
                                    <c:if test="${item.hadFollow == null || item.hadFollow == 0}">
                                        <i class="far fa-bookmark"></i>
                                    </c:if>
                                </a>
                                <a class="btn btn-outline-dark btn-square" href="${_ctx}/post/${item.idPost}/like">
                                    <c:if test="${item.hadLike == 1}">
                                        <i class="fas fa-heart"></i>
                                    </c:if>
                                    <c:if test="${item.hadLike == null || item.hadLike == 0}">
                                        <i class="far fa-heart"></i>
                                    </c:if>
                                </a>
                                <a class="btn btn-outline-dark btn-square" href="${_ctx}/product/${item.id}/checkout"><i class="fa fa-shopping-cart"></i></a>
                            </div>
                            </c:if>
                        </div>
                        <div class="text-center py-4">
                            <a class="h6 text-decoration-none text-truncate" href="">${item.name}</a>
                            <div class="d-flex align-items-center justify-content-center mt-2">
                                <h5><fmt:formatNumber value="${item.priceVerify}"/> đ</h5><h6 class="text-muted ml-2"></h6>
                            </div>
                            <div class="d-flex align-items-center justify-content-center mb-1">
                                <small class="fa fa-eye text-primary mr-1"></small>
                                <small>(${item.totalView})</small>
                                <small class="fa fa-bookmark text-primary mr-1 ml-3"></small>
                                <small>(${item.totalFollow})</small>
                                <small class="fa fa-heart text-primary mr-1 ml-3"></small>
                                <small>(${item.totalLike})</small>
                                <small class="fa fa-comment-alt text-primary mr-1 ml-3"></small>
                                <small>(${item.totalComment})</small>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
        <!-- Products View End -->
    </c:if>
    

    <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="bg-light p-4">
                        <img src="static/dist/vendor-1.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="static/dist/vendor-2.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="static/dist/vendor-3.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="static/dist/vendor-4.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="static/dist/vendor-5.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="static/dist/vendor-6.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="static/dist/vendor-7.jpg" alt="">
                    </div>
                    <div class="bg-light p-4">
                        <img src="static/dist/vendor-8.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->

	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>