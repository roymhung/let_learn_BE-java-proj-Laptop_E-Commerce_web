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
                    <!-- Bootstrap 5 CSS -->
                    <!-- Latest compiled and minified CSS -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <!-- Bootstrap 5 JavaScript -->
                    <!-- Latest compiled JavaScript -->
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
                    </script>

                    <!-- jQuery (tùy chọn, nếu bạn cần dùng) -->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


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
                                    <h1 class="mt-4">Manage Product</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">
                                                Dashboard
                                            </a></li>
                                        <li class="breadcrumb-item active">Product</li>
                                    </ol>

                                    <!-- PRODUCT DETAIL -->
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <h3>Product Detail (ID = ${product.id})</h3>
                                                    <a href="/admin/product/create" class="btn btn-primary">Create a
                                                        Product</a>
                                                </div>
                                                <hr />

                                                <div class="card" style="width: 30rem;">
                                                    <div class="card-header">
                                                        Product Information
                                                    </div>
                                                    <ul class="list-group list-group-flush">
                                                        <li class="list-group-item">
                                                            <strong>Name:</strong> ${product.name}
                                                        </li>

                                                        <li class="list-group-item">
                                                            <strong>Price:</strong>
                                                            <fmt:formatNumber value="${product.price}"
                                                                pattern="#,##0" />
                                                            VNĐ
                                                        </li>

                                                        <li class="list-group-item">
                                                            <strong>Quantity:</strong> ${product.quantity}
                                                        </li>

                                                        <li class="list-group-item">
                                                            <strong>Sold:</strong> ${product.sold}
                                                        </li>

                                                        <li class="list-group-item">
                                                            <strong>Factory:</strong> ${product.factory}
                                                        </li>

                                                        <li class="list-group-item">
                                                            <strong>Target:</strong> ${product.target}
                                                        </li>

                                                        <li class="list-group-item">
                                                            <strong>Short Description:</strong> ${product.shortDesc}

                                                        </li>

                                                        <li class="list-group-item">
                                                            <strong>Detail Description:</strong> ${product.detailDesc}

                                                        </li>

                                                        <li class="list-group-item"> <strong>Image:</strong>
                                                            <c:if test="${not empty product.image}">
                                                                <img src="${pageContext.request.contextPath}/images/product/${product.image}"
                                                                    width="150" height="150" />
                                                            </c:if>
                                                        </li>

                                                    </ul>
                                                </div>
                                                <a href="/admin/product" class="btn btn-success mt-3">Back</a>

                                            </div>
                                        </div>
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