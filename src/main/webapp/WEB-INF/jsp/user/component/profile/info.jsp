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

    <!-- Shop Start -->
    <div class="container-fluid">
        <div class="row px-xl-5">
            <!-- Profile Start -->
            <div class="col-4">
                <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Thông tin cá nhân</span></h5>
                <ul class="list-group">
                    <li class="list-group-item">Họ tên: <b>${userInfo.fullName}</b></li>
                    <li class="list-group-item">Địa chỉ: <b>${userInfo.address}</b></li>
                    <li class="list-group-item">Email: <b>${userInfo.email}</b></li>
                    <li class="list-group-item">Số ĐT: <b>${userInfo.phone}</b></li>
                </ul>
            </div>
            <!-- Profile End -->

            <!-- Shop Product Start -->
            <div class="col-8">
                <div class="container-fluid">
                    <h5 class="section-title position-relative text-uppercase mb-3"><span class="bg-secondary pr-3">Danh sách đánh giá</span></h5>
                    <table class="table table-light table-borderless table-hover text-center mb-0">
                        <tbody class="align-middle">
                        <c:forEach items="${orderData}" var="item">
                        <tr>
                            <td><img src="${_ctx}/static/${item.thumb}" style="width: 50px;" class="me-2"> ${item.name}</td>
                            <td><fmt:formatNumber value="${item.price}"/> đ</td>
                            <td class="align-middle">${item.updatedDate}</td>
                            <td>
                                <c:forEach begin="1" end="${item.rate}">
                                    <i class="fas fa-star"></i>
                                </c:forEach>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <%@ include file="/WEB-INF/jsp/user/common/footer.jsp" %>
</body>
</html>