<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="" />
                    <meta name="author" content="" />
                    <title>Dashboard - SB Admin</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />

                    <div id="layoutSidenav">
                        <!-- side bar -->
                        <jsp:include page="../layout/sidebar.jsp" />
                        <!-- side nav content -->
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Order</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">
                                                Dashboard
                                            </a></li>
                                        <li class="breadcrumb-item active">Order</li>
                                    </ol>
                                    <div>
                                        <table class="table table-bordered table-hover">
                                            <thead class="table-dark">
                                                <tr>
                                                    <th width="150px">Mã đơn hàng ID</th>
                                                    <th width="200px">Tên tài khoản</th>
                                                    <th width="200px">Tên người nhận</th>
                                                    <th width="200px">Tên sản phẩm</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Tổng tiền</th>
                                                    <th>Trạng thái</th>
                                                    <th width="400px">Thao tác</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="order" items="${orders}">
                                                    <tr>
                                                        <td>${order.id}</td>
                                                        <td>${order.user.fullName}</td>
                                                        <td>${order.receiverName}</td>
                                                        <td>
                                                            <c:forEach var="detail" items="${order.orderDetails}">
                                                                ${detail.product.name}<br />
                                                            </c:forEach>
                                                        </td>
                                                        <td>${order.receiverPhone}</td>
                                                        <td>
                                                            <fmt:formatNumber value="${order.totalPrice}" type="number"
                                                                groupingUsed="true" /> vnd
                                                        </td>
                                                        <td>${order.status}</td>

                                                        <td>
                                                            <a href="/admin/order/${order.id}"
                                                                class="btn btn-success btn-sm">Detail</a>

                                                            <a href="/admin/order/update/${order.id}"
                                                                class="btn btn-warning btn-sm">Update</a>

                                                            <a href="/admin/order/delete/${order.id}"
                                                                class="btn btn-danger btn-sm">Delete</a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                <c:if test="${empty orders}">
                                                    <tr>
                                                        <td colspan="6" class="text-center text-danger">
                                                            Không tìm thấy đơn hàng
                                                        </td>
                                                    </tr>
                                                </c:if>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </main>
                            <!-- footer -->
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="js/scripts.js"></script>
                </body>

                </html>