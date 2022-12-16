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
                    <a class="breadcrumb-item text-dark" href="${_ctx}/">Home</a>
                    <span class="breadcrumb-item active">Product</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Shop Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-4">
                <!-- Price Start -->
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Lọc theo danh mục</span></h5>
                <div class="bg-light p-4 mb-30">
                    <form:form modelAttribute="search" method="GET">
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
                        <button type="submit" class="btn btn-primary">Áp dụng</button>
                    </form:form>
                </div>
                <!-- Price End -->
            </div>
            <!-- Shop Sidebar End -->

            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-8">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <div>
                                <button class="btn btn-sm btn-light"><i class="fa fa-th-large"></i></button>
                                <button class="btn btn-sm btn-light ml-2"><i class="fa fa-bars"></i></button>
                            </div>
                            <div class="ml-2">
                                <div class="btn-group ml-2">
                                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">Showing</button>
                                    <div class="dropdown-menu dropdown-menu-right">
                                        <a class="dropdown-item" href="#">10</a>
                                        <a class="dropdown-item" href="#">20</a>
                                        <a class="dropdown-item" href="#">30</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${productData}" var="item">
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
                                    <h5>${item.priceVerify}</h5><h6 class="text-muted ml-2"><del>${item.price}</del></h6>
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

                    <div class="col-12">
                        <nav>
	                      	<ul class="pagination justify-content-center">
		                        <li class="page-item disabled"><a class="page-link" href="#">Previous</span></a></li>
		                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
		                        <li class="page-item"><a class="page-link" href="#">2</a></li>
		                        <li class="page-item"><a class="page-link" href="#">3</a></li>
		                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
	                      	</ul>
                        </nav>
                    </div>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>