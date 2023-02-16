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
                    <span class="breadcrumb-item active">Sản phẩm</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <c:if test="${search.hadLike == 0 && search.hadFollow == 0}">
            <form:form modelAttribute="search" method="GET" cssClass="col-lg-3 col-md-4">
                <!-- Category Filter Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Lọc theo danh mục</span></h5>
                <div class="bg-light p-4 mb-30">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <form:radiobutton path="idCategory" cssClass="custom-control-input" value="0"/>
                        <label class="custom-control-label" for="idCategory1">Tất cả</label>
                    </div>

                    <c:forEach items="${categoryList}" var="item" varStatus="loop">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <form:radiobutton path="idCategory" cssClass="custom-control-input" value="${item.id}"/>
                        <label class="custom-control-label" for="idCategory${loop.index+2}">${item.name}</label>
                        <span class="badge border font-weight-normal"></span>
                    </div>
                    </c:forEach>
                </div>
                <!-- Category Filter End -->

                <!-- Row Filter Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Số lượng hiển thị</span></h5>
                <div class="bg-light p-4 mb-30">
                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <form:radiobutton path="row" cssClass="custom-control-input" value="10"/>
                        <label class="custom-control-label" for="row1">10</label>
                    </div>

                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <form:radiobutton path="row" cssClass="custom-control-input" value="20"/>
                        <label class="custom-control-label" for="row2">20</label>
                    </div>

                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <form:radiobutton path="row" cssClass="custom-control-input" value="30"/>
                        <label class="custom-control-label" for="row3">30</label>
                    </div>

                    <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                        <form:radiobutton path="row" cssClass="custom-control-input" value="40"/>
                        <label class="custom-control-label" for="row4">40</label>
                    </div>
                </div>
                <!-- Row Filter End -->
                <button type="submit" class="btn btn-primary w-100">Áp dụng</button>
            </form:form>
            </c:if>
            <!-- Shop Sidebar End -->

            <!-- Shop Product Start -->
            <c:if test="${search.hadLike == 0 && search.hadFollow == 0}">
            <div class="col-lg-9 col-md-8">
            </c:if>
            <c:if test="${search.hadLike != 0 || search.hadFollow != 0}">
            <div class="col-lg-12">
            </c:if>
                <div class="row pb-3">
                    <c:if test="${productData.getContent().size() > 0}">
                    <c:forEach items="${productData.getContent()}" var="item">
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
                    </c:if>
                    <c:if test="${productData.getContent().size() == 0}">
                    <div class="col-12 text-center p-4">Không có dữ liệu</div>
                    </c:if>

                    <div class="col-12">
                      	<ul class="pagination justify-content-center" onload="generalPage('.pagination');"
                         data-page="${search.getPage()}"
                         data-count="${productData.getTotalElements()}"
                         data-limit="${search.getRow()}"></ul>
                    </div>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>