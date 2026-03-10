<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8">
                    <title>LaptopShop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <!-- Google Web Fonts -->
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link
                        href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                        rel="stylesheet">

                    <!-- Icon Font Stylesheet -->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <!-- Libraries Stylesheet -->
                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                    <!-- Customized Bootstrap Stylesheet -->
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                    <!-- Template Stylesheet -->
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body>

                    <!-- Spinner Start -->
                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>
                    <!-- Spinner End -->

                    <!-- Navbar start -->
                    <jsp:include page="../layout/header.jsp" />
                    <!-- Navbar End -->

                    <!-- Order History Start -->
                    <div class="container-fluid py-5 mt-5">
                        <div class="container py-5">

                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item">
                                        <a href="/">Home</a>
                                    </li>
                                    <li class="breadcrumb-item active">
                                        Lịch sử mua hàng
                                    </li>
                                </ol>
                            </nav>

                            <div class="row g-4 mb-5">
                                <div class="col-lg-12">

                                    <div class="table-responsive">

                                        <table class="table">

                                            <thead>
                                                <tr>
                                                    <th>Sản phẩm</th>
                                                    <th>Tên</th>
                                                    <th>Giá cả</th>
                                                    <th>Số lượng</th>
                                                    <th>Thành tiền</th>
                                                    <th>Trạng thái</th>
                                                </tr>
                                            </thead>

                                            <tbody>

                                                <%-- kiểm tra orders rỗng --%>
                                                    <c:choose>

                                                        <c:when test="${empty orders}">
                                                            <tr>
                                                                <td colspan="6" class="text-center">
                                                                    Bạn chưa có đơn hàng nào
                                                                </td>
                                                            </tr>
                                                        </c:when>

                                                        <c:otherwise>

                                                            <c:forEach var="order" items="${orders}">

                                                                <tr style="background:#f8f8f8">
                                                                    <td colspan="2">
                                                                        Order Id = ${order.id}
                                                                    </td>

                                                                    <td>
                                                                        <fmt:formatNumber value="${order.totalPrice}"
                                                                            type="number" /> đ
                                                                    </td>

                                                                    <td colspan="2"></td>

                                                                    <td>
                                                                        ${order.status}
                                                                    </td>
                                                                </tr>

                                                                <c:forEach var="orderDetail"
                                                                    items="${order.orderDetails}">
                                                                    <tr>

                                                                        <td>
                                                                            <img src="/images/product/${orderDetail.product.image}"
                                                                                width="70" class="rounded-circle">
                                                                        </td>

                                                                        <td>
                                                                            ${orderDetail.product.name}
                                                                        </td>

                                                                        <td>
                                                                            <fmt:formatNumber
                                                                                value="${orderDetail.price}"
                                                                                type="number" /> đ
                                                                        </td>

                                                                        <td>
                                                                            ${orderDetail.quantity}
                                                                        </td>

                                                                        <td>
                                                                            <fmt:formatNumber
                                                                                value="${orderDetail.price * orderDetail.quantity}"
                                                                                type="number" /> đ
                                                                        </td>

                                                                    </tr>
                                                                </c:forEach>

                                                            </c:forEach>

                                                        </c:otherwise>

                                                    </c:choose>

                                            </tbody>

                                        </table>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- Order History End -->

                    <!-- Footer Start -->
                    <jsp:include page="../layout/footer.jsp" />
                    <!-- Footer End -->

                    <!-- Back to Top -->
                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>


                    <!-- JavaScript Libraries -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>

                    <!-- Template Javascript -->
                    <script src="/client/js/main.js"></script>
                </body>

                </html>