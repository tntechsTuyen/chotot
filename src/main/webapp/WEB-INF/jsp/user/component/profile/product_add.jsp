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
                    <a class="breadcrumb-item text-dark" href="${_ctx}/profile">Hồ sơ</a>
                    <a class="breadcrumb-item text-dark" href="${_ctx}/profile/product">Sản phẩm</a>
                    <span class="breadcrumb-item active">Thêm mới</span>
                </nav>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Checkout Start -->
    <div class="container-fluid">
        <form:form modelAttribute="productForm" method="POST" enctype="multipart/form-data">
        <div class="row px-xl-5">
            <div class="col-lg-8">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thông tin sản phẩm</span></h5>
                <div class="mb-5">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="bg-light p-30">
                                <div class="row">
                                    <div class="col-md-12 form-group">
                                        <label>Loại sản phẩm</label>
                                        <form:select path="idCategory" cssClass="custom-select" onchange="changeCategory(this)">
                                            <form:option value="0">----------------</form:option>
                                            <c:forEach items="${categoryData}" var="item">
                                                <form:option value="${item.id}">${item.name}</form:option>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Tên SP</label>
                                        <form:input path="name" cssClass="form-control" />
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Giá</label>
                                        <form:input path="price" type="number" cssClass="form-control" min="0" />
                                    </div>
                                    <div class="col-md-12 form-group">
                                        <label>Mô tả</label>
                                        <form:input path="content" cssClass="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="bg-light p-30">
                                <div class="row">
                                    <c:forEach items="${categoryMetaData}" var="item">
                                    <div class="col-md-12 form-group">
                                        <label>${item.value}</label>
                                        <form:hidden path="metaKey" value="${item.key}"/>
                                        <form:hidden path="metaName" value="${item.value}"/>
                                        <form:input path="metaValue" cssClass="form-control" placeholder="${item.description}" />
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Hình ảnh</span></h5>
                <div class="bg-light p-30 mb-5">
                    <table class="table table-bordered text-center">
                        <tr>
                            <td rowspan="2">
                                <img src="${_ctx}/static/dist/no-image.jpg" class="img-fluid product-image" style="max-height: 300px;">
                                <form:input path="media" type="file" cssClass="d-none" accept="image/*" />
                            </td>
                            <td>
                                <img src="${_ctx}/static/dist/no-image.jpg" class="img-fluid product-image" style="max-height: 150px;">
                                <form:input path="media" type="file" cssClass="d-none" accept="image/*" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="${_ctx}/static/dist/no-image.jpg" class="img-fluid product-image" style="max-height: 150px;">
                                <form:input path="media" type="file" cssClass="d-none" accept="image/*" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="mb-2">
                    <div class="bg-light">
                        <button type="submit" class="btn btn-block btn-primary font-weight-bold py-3">Cập nhật</button>
                    </div>
                </div>
            </div>
        </div>
        </form:form>
    </div>
    <!-- Checkout End -->

    <%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>

    <script>
        var map;
        function changeCategory(obj){
            location.href = changeSearchParam({idCategory: obj.value})
        }
        
        $(".product-image").click(function(){
            $(this).parent().find("[name='media']").click()
        })

        $("[name='media']").change(function(){
            var file = $(this).prop("files")[0];
            var index = $(this).index("[name='media']")
            image.render(`.product-image:eq(`+index+`)`, file);
        })

    </script>
</body>
</html>