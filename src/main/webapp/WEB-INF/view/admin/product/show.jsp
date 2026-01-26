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
                    <title>Manage Products</title>

                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">

                    <!-- HEADER -->
                    <jsp:include page="../layout/header.jsp" />

                    <div id="layoutSidenav">

                        <!-- SIDEBAR -->
                        <jsp:include page="../layout/sidebar.jsp" />

                        <!-- CONTENT -->
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Products</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item">
                                            <a href="/admin">Dashboard</a>
                                        </li>
                                        <li class="breadcrumb-item active">Product</li>
                                    </ol>

                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-12 mx-auto">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <h3>Product Table</h3>
                                                    <a href="/admin/product/create" class="btn btn-primary">
                                                        Create Product
                                                    </a>
                                                </div>
                                                <hr />

                                                <table class="table table-bordered table-hover align-middle">
                                                    <thead class="table-dark">
                                                        <tr>
                                                            <th>ID</th>
                                                            <th>Name</th>
                                                            <th>Image</th>
                                                            <th>Price</th>
                                                            <th>Quantity</th>
                                                            <th>Factory</th>
                                                            <th>Target</th>
                                                            <th width="300">Action</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody>
                                                        <c:forEach var="product" items="${products}">
                                                            <tr>
                                                                <td>${product.id}</td>
                                                                <td>${product.name}</td>
                                                                <td>
                                                                    <c:if test="${not empty product.image}">
                                                                        <img src="${pageContext.request.contextPath}/images/product/${product.image}"
                                                                            width="70" style="object-fit: cover;" />
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatNumber value="${product.price}"
                                                                        type="number" groupingUsed="true" /> vnd
                                                                </td>
                                                                <td>${product.quantity}</td>
                                                                <td>${product.factory}</td>
                                                                <td>${product.target}</td>

                                                                <td>
                                                                    <a href="/admin/product/${product.id}"
                                                                        class="btn btn-success btn-sm">
                                                                        View
                                                                    </a>

                                                                    <a href="/admin/product/update/${product.id}"
                                                                        class="btn btn-warning btn-sm mx-1">
                                                                        Update
                                                                    </a>

                                                                    <a href="/admin/product/delete/${product.id}"
                                                                        class="btn btn-danger btn-sm">
                                                                        Delete
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>

                                                        <c:if test="${empty products}">
                                                            <tr>
                                                                <td colspan="9" class="text-center">
                                                                    No products found
                                                                </td>
                                                            </tr>
                                                        </c:if>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </main>

                            <!-- FOOTER -->
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>