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
                    <a class="breadcrumb-item text-dark" href="${_ctx}/product">Sản phẩm</a>
                    <span class="breadcrumb-item active">Chi tiết</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Detail Start -->
    <div class="container-fluid pb-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 mb-30">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner bg-light">
                        <c:forEach items="${mediaData}" var="item" varStatus="loop">
                        <div class='carousel-item <c:if test="${loop.index == 0}">active</c:if>'>
                            <img class="w-100 h-100" style="min-height: 450px; max-height: 450px" src="${_ctx}/static/${item.url}" alt="Image">
                        </div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 h-auto mb-30">
                <div class="h-100 bg-light p-30">
                    <h3>${productData.name}</h3>
                    <div class="d-flex mb-3">
                        <div class="text-primary mr-1">
                            <small class="fas fa-eye"></small>
                        </div>
                        <small class="pt-1">(${postData.totalView})</small>
                        <div class="text-primary mr-1 ml-3">
                            <small class="fas fa-heart"></small>
                        </div>
                        <small class="pt-1">(${postData.totalLike})</small>
                        <div class="text-primary mr-1 ml-3">
                            <small class="fas fa-bookmark"></small>
                        </div>
                        <small class="pt-1">(${postData.totalFollow})</small>
                        <div class="text-primary mr-1 ml-3">
                            <small class="fas fa-comment-alt"></small>
                        </div>
                        <small class="pt-1">(${postData.totalComment})</small>
                    </div>
                    <h3 class="font-weight-semi-bold mb-4">${productData.priceVerify}</h3>
                    <p class="mb-4">${postData.content}</p>
                    <div class="d-flex align-items-center mb-4 pt-2">
                        <a href="${_ctx}/product/${productData.id}/checkout" class="btn btn-primary px-3"><i class="fa fa-shopping-cart mr-1"></i> Mua hàng</a>
                    </div>
                    <div class="d-flex pt-2">
                        <strong class="text-dark mr-2">Chia sẻ:</strong>
                        <div class="d-inline-flex">
                            <a class="text-dark px-2" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="text-dark px-2" href=""><i class="fab fa-twitter"></i></a>
                            <a class="text-dark px-2" href=""><i class="fab fa-linkedin-in"></i></a>
                            <a class="text-dark px-2" href=""><i class="fab fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="bg-light p-30">
                    <div class="nav nav-tabs mb-4">
                        <a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Mô tả sản phẩm</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Thông tin sản phẩm</a>
                        <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">Bình luận (${commentData.size()})</a>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade show active" id="tab-pane-1">
                            <h4 class="mb-3">Mô tả sản phẩm</h4>
                            <p>${postData.content}</p>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-2">
                            <h4 class="mb-3">Thông tin sản phẩm</h4>
                            <div class="row">
                                <div class="col-md-6">
                                    <ul class="list-group list-group-flush">
                                        <c:forEach items="${metaData}" var="item">
                                        <li class="list-group-item px-0">
                                            ${item.name}: ${item.value}
                                        </li>
                                        </c:forEach>
                                    </ul> 
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab-pane-3">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4 class="mb-4">${commentData.size()} review for "${productData.name}"</h4>
                                    <c:forEach items="${commentData}" var="item" varStatus="loop">
                                    <div class="media mb-4">
                                        <img src="${_ctx}/static/dist/user.jpg" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px;">
                                        <div class="media-body">
                                            <h6>${item.name}<small> - <i>${item.createdDate}</i></small></h6>
                                            <p>${item.content}</p>
                                        </div>
                                    </div>
                                    </c:forEach>
                                </div>
                                <div class="col-md-6">
                                    <h4 class="mb-4">Để lại câu hỏi</h4>
                                    <form:form modelAttribute="commentForm" method="POST" action="${_ctx}/post/${postData.id}/comment">
                                        <div class="form-group">
                                            <label for="content">Nội dung</label>
                                            <form:textarea path="content" cols="30" rows="5" cssClass="form-control" />
                                        </div>
                                        <div class="form-group mb-0">
                                            <button type="submit" class="btn btn-primary px-3">Gửi</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->


    <!-- Products Start -->
    <div class="container-fluid py-2">
        <h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4"><span class="bg-secondary pr-3">Bạn cũng có thể thích</span></h2>
        <div class="row px-xl-5">
            <c:forEach items="${productSameData}" var="item">
            <div class="col-lg-2 col-md-3 col-sm-6 pb-1">
                <div class="product-item bg-light mb-4">
                    <div class="product-img position-relative overflow-hidden">
                        <img class="img-fluid w-100" src="${_ctx}/static/${item.thumb}" style="min-height: 200px; max-height: 200px">
                        <div class="product-action">
                            <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-bookmark"></i></a>
                            <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a>
                            <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a>
                        </div>
                    </div>
                    <div class="text-center py-4">
                        <a class="h6 text-decoration-none text-truncate" href="">${item.name}</a>
                        <div class="d-flex align-items-center justify-content-center mt-2">
                            <h5>${item.priceVerify}</h5><h6 class="text-muted ml-2"><del>${item.price}</del></h6>
                        </div>
                        <div class="d-flex align-items-center justify-content-center mb-1">
                            <small class="fa fa-star text-primary mr-1"></small>
                            <small>(99)</small>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
    <!-- Products End -->

	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>