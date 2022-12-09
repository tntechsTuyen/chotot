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
                    <span class="breadcrumb-item active">Đơn hàng</span>
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
                    <li class="list-group-item active"><a class="text-white" href="${_ctx}/profile/order">Đơn hàng</a></li>
                </ul>
            </div>
            <!-- Profile End -->

            <!-- Order list -->
            <div class="col-10 table-responsive">
                <table class="table table-light table-borderless table-hover text-center mb-0">
                    <thead class="thead-dark">
                        <tr>
                            <th>Products</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                        <tr>
                            <td class="align-middle"><img src="${_ctx}/static/dist/product-1.jpg" alt="" style="width: 50px;"> Product Name</td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle">
                                <div class="input-group quantity mx-auto" style="width: 100px;">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-minus" >
                                        <i class="fa fa-minus"></i>
                                        </button>
                                    </div>
                                    <input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="1">
                                    <div class="input-group-btn">
                                        <button class="btn btn-sm btn-primary btn-plus">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </td>
                            <td class="align-middle">$150</td>
                            <td class="align-middle"><a href="${_ctx}/profile/order/1" class="btn btn-sm btn-info"><i class="fa fa-info-circle"></i></a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- * Order list -->

            <!-- Paging -->
            <div class="col-12 mt-2">
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
            <!-- * Paging -->
        </div>
    </div>
	<%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>