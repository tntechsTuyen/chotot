<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:if test="${not empty mess}">
<script>
    alert("${mess}")
</script>
</c:if>

<!-- Topbar Start -->
<div class="container-fluid">
    <div class="row bg-secondary py-1 px-xl-5">
        <div class="offset-lg-6 col-lg-6 text-center text-lg-right">
            <div class="d-inline-flex align-items-center">
                <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-light dropdown-toggle" data-toggle="dropdown">
                        <c:if test="${_userInfo == null}">Menu</c:if>
                        <c:if test="${_userInfo != null}">${_userInfo.fullName}</c:if>
                    </button>
                    <div class="dropdown-menu dropdown-menu-right">
                        <c:if test="${_userInfo != null}">
                            <a href="${_ctx}/profile" class="dropdown-item">Hồ sơ</a>
                            <c:if test="${_userInfo.idRole == 1}">
                                <a href="${_ctx}/admin" class="dropdown-item">Quản Trị Viên</a>
                            </c:if>
                            <a href="${_ctx}/message" class="dropdown-item">Nhắn tin</a>
                            <a href="${_ctx}/logout" class="dropdown-item">Đăng xuất</a>
                        </c:if>

                        <c:if test="${_userInfo == null}">
                            <a href="${_ctx}/login" class="dropdown-item">Đăng nhập</a>
                            <a href="${_ctx}/register" class="dropdown-item">Đăng ký</a>
                        </c:if>
                    </div>
                </div>
            </div>
            <c:if test="${_userInfo != null}">
            <div class="d-inline-flex align-items-center d-block">
                <a href="${_ctx}/product?hadFollow=1&hadLike=0" class="btn px-0 ml-2">
                    <i class="fas fa-bookmark text-dark"></i>
                    <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">
                        <c:if test="${userPostInfo.like == null}">0</c:if>
                        <c:if test="${userPostInfo.like > 99}">99+</c:if>
                        <c:if test="${userPostInfo.like < 99}">${userPostInfo.follow}</c:if>
                    </span>
                </a>
                <a href="${_ctx}/product?hadFollow=0&hadLike=1" class="btn px-0 ml-2">
                    <i class="fas fa-heart text-dark"></i>
                    <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">
                        <c:if test="${userPostInfo.follow == null}">0</c:if>
                        <c:if test="${userPostInfo.follow > 99}">99+</c:if>
                        <c:if test="${userPostInfo.follow < 99}">${userPostInfo.like}</c:if>
                    </span>
                </a>
                <a href="${_ctx}/message" class="btn px-0 ml-2">
                    <i class="fas fa-comment-alt text-dark"></i>
                    <span class="badge text-dark border border-dark rounded-circle" style="padding-bottom: 2px;">
                        <c:if test="${messageCount == null}">0</c:if>
                        <c:if test="${messageCount > 99}">99+</c:if>
                        <c:if test="${messageCount < 99}">${messageCount}</c:if>
                    </span>
                </a>
            </div>
            </c:if>
        </div>
    </div>
    <div class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
        <div class="col-lg-4">
            <a href="${_ctx}/" class="text-decoration-none">
                <span class="h1 text-uppercase text-primary bg-dark px-2">Trao đổi</span>
                <span class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">sản phẩm</span>
            </a>
        </div>
        <div class="col-lg-4 col-6 text-left">
            <form class="d-none" id="search-product" action="${_ctx}/product">
                <div class="input-group">
                    <input type="text" class="form-control" name="name" placeholder="Tìm kiếm theo tên sản phẩm">
                    <div class="input-group-append" onclick="$('#search-product').submit()">
                        <span class="input-group-text bg-transparent text-primary">
                            <i class="fa fa-search"></i>
                        </span>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-4 col-6 text-right">
            <p class="m-0">Điện thoại hỗ trợ</p>
            <h5 class="m-0">+012 345 6789</h5>
        </div>
    </div>
</div>
<!-- Topbar End -->

<!-- Navbar Start -->
<div class="container-fluid bg-dark mb-30">
    <div class="row px-xl-5">
        <div class="col-lg-3 d-none d-lg-block">
            <a class="btn d-flex align-items-center justify-content-between bg-primary w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; padding: 0 30px;">
                <h6 class="text-dark m-0"><i class="fa fa-bars mr-2"></i>Danh mục</h6>
                <i class="fa fa-angle-down text-dark"></i>
            </a>
            <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 999;">
                <div class="navbar-nav w-100">
                    <c:forEach items="${categoryList}" var="item">
                    <a href="" class="nav-item nav-link">${item.name}</a>
                    </c:forEach>
                </div>
            </nav>
        </div>
        <div class="col-lg-9">
            <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
                <a href="" class="text-decoration-none d-block d-lg-none">
                    <span class="h1 text-uppercase text-dark bg-light px-2">Trao đổi</span>
                    <span class="h1 text-uppercase text-light bg-primary px-2 ml-n1">sản phẩm</span>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                    <div class="navbar-nav mr-auto py-0">
                        <a href="/" class="nav-item nav-link">Trang chủ</a>
                        <a href="/product/list" class="nav-item nav-link">Sản phẩm</a>
                        <a href="/contact" class="nav-item nav-link">Liên hệ</a>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>
<!-- Navbar End -->