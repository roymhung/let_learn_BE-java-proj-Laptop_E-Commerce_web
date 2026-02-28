<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title>Order Detail</title>

                <link href="/css/styles.css" rel="stylesheet" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">

                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">

                                <h1 class="mt-4">Order Detail</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item">
                                        <a href="/admin">Dashboard</a>
                                    </li>
                                    <li class="breadcrumb-item">
                                        <a href="/admin/order">Order</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        Detail
                                    </li>
                                </ol>

                                <!-- ORDER INFO -->
                                <div class="card mb-4 shadow-sm">
                                    <div class="card-header bg-primary text-white">
                                        <i class="fas fa-receipt me-2"></i>
                                        Thông tin đơn hàng (ID = ${order.id})
                                    </div>
                                    <div class="card-body">
                                        <p><strong>Tên tài khoản:</strong> ${order.user.fullName}</p>
                                        <p><strong>Tên người nhận:</strong> ${order.receiverName}</p>
                                        <p><strong>Địa chỉ nhận hàng:</strong> ${order.receiverAddress}</p>
                                        <p><strong>Số điện thoại:</strong> ${order.receiverPhone}</p>
                                        <p><strong>Tổng tiền:</strong>
                                            <fmt:formatNumber value="${order.totalPrice}" pattern="#,##0" /> VNĐ
                                        </p>
                                    </div>
                                </div>

                                <!-- ORDER ITEMS -->
                                <div class="card shadow-sm">
                                    <div class="card-header bg-dark text-white">
                                        <i class="fas fa-box me-2"></i>
                                        Danh sách sản phẩm
                                    </div>

                                    <div class="card-body p-0">
                                        <table class="table table-bordered mb-0">
                                            <thead class="table-light">
                                                <tr>
                                                    <th width="50">#</th>
                                                    <th scope="col">Sản phẩm</th>
                                                    <th scope="col">Tên</th>
                                                    <th scope="col">Giá cả</th>
                                                    <th width="100">Số lượng</th>
                                                    <th>Status</th>
                                                    <th scope="col">Thành tiền</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:forEach var="detail" items="${orderDetails}" varStatus="loop">
                                                    <tr>
                                                        <td>${loop.index + 1}</td>
                                                        <!-- IMAGE -->
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <c:if test="${not empty detail.product.image}">
                                                                    <img src="${pageContext.request.contextPath}/images/product/${detail.product.image}"
                                                                        class="img-fluid me-3 rounded-circle"
                                                                        style="width: 80px; height: 80px; object-fit: cover;"
                                                                        alt="">
                                                                </c:if>
                                                            </div>
                                                        </td>


                                                        <!-- NAME -->
                                                        <td>
                                                            <a href="${pageContext.request.contextPath}/product/${detail.product.id}"
                                                                target="_blank">
                                                                ${detail.product.name}
                                                            </a>
                                                        </td>

                                                        <td>
                                                            <fmt:formatNumber value="${detail.price}" pattern="#,##0" />
                                                            VNĐ
                                                        </td>
                                                        <td>${detail.quantity}</td>
                                                        <td>${order.status}</td>
                                                        <td>
                                                            <fmt:formatNumber value="${detail.price * detail.quantity}"
                                                                pattern="#,##0" /> VNĐ
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                <c:if test="${empty orderDetails}">
                                                    <tr>
                                                        <td colspan="5" class="text-center text-danger">
                                                            Không có sản phẩm nào trong đơn hàng
                                                        </td>
                                                    </tr>
                                                </c:if>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <a href="/admin/order" class="btn btn-success">
                                        <i class="fas fa-arrow-left"></i> Back
                                    </a>
                                </div>

                            </div>
                        </main>

                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
            </body>

            </html>