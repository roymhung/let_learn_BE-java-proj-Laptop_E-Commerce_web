<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

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
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

                <!-- Bootstrap 5 JavaScript -->
                <!-- Latest compiled JavaScript -->
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js">
                </script>

                <!-- jQuery (tùy chọn, nếu bạn cần dùng) -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${newProduct.image}";
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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

                                <!-- update user -->
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Update Product</h3>
                                            <hr />

                                            <form:form method="POST" action="/admin/product/update"
                                                modelAttribute="newProduct" class="row" enctype="multipart/form-data">
                                                <!-- ERROR VARS -->
                                                <c:set var="errorName">
                                                    <form:errors path="name" cssClass="invalid-feedback d-block" />
                                                </c:set>

                                                <c:set var="errorPrice">
                                                    <form:errors path="price" cssClass="invalid-feedback d-block" />
                                                </c:set>

                                                <c:set var="errorDetailDesc">
                                                    <form:errors path="detailDesc"
                                                        cssClass="invalid-feedback d-block" />
                                                </c:set>

                                                <c:set var="errorShortDesc">
                                                    <form:errors path="shortDesc" cssClass="invalid-feedback d-block" />
                                                </c:set>

                                                <c:set var="errorQuantity">
                                                    <form:errors path="quantity" cssClass="invalid-feedback d-block" />
                                                </c:set>

                                                <c:set var="errorSold">
                                                    <form:errors path="sold" cssClass="invalid-feedback d-block" />
                                                </c:set>

                                                <!-- ID -->
                                                <div class="mb-3 col-12 col-md-6" style="display: none;">
                                                    <label class="form-label">ID:</label>
                                                    <form:input path="id" cssClass="form-control" />
                                                </div>

                                                <!-- Name -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Product Name:</label>
                                                    <form:input path="name"
                                                        cssClass="form-control ${not empty errorName ? 'is-invalid' : ''}" />
                                                    ${errorName}
                                                </div>

                                                <!-- Price -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Price:</label>
                                                    <form:input path="price" type="number" step="0.01"
                                                        cssClass="form-control ${not empty errorPrice ? 'is-invalid' : ''}" />
                                                    ${errorPrice}
                                                </div>

                                                <!-- Detail Desc -->
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Detail Description:</label>
                                                    <form:textarea path="detailDesc" rows="4"
                                                        cssClass="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}" />
                                                    ${errorDetailDesc}
                                                </div>

                                                <!-- Short Desc -->
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Short Description:</label>
                                                    <form:textarea path="shortDesc" rows="2"
                                                        cssClass="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}" />
                                                    ${errorShortDesc}
                                                </div>

                                                <!-- Quantity -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Quantity:</label>
                                                    <form:input path="quantity" type="number"
                                                        cssClass="form-control ${not empty errorQuantity ? 'is-invalid' : ''}" />
                                                    ${errorQuantity}
                                                </div>

                                                <!-- Sold -->
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Sold:</label>
                                                    <form:input path="sold" type="number"
                                                        cssClass="form-control ${not empty errorSold ? 'is-invalid' : ''}" />
                                                    ${errorSold}
                                                </div>

                                                <!-- Factory -->
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label">Factory</label>
                                                    <form:select path="factory" cssClass="form-select">
                                                        <form:option value="APPLE">Apple</form:option>
                                                        <form:option value="ASUS">Asus</form:option>
                                                        <form:option value="LENOVO">Lenovo</form:option>
                                                        <form:option value="DELL">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="ACER">Acer</form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Target -->
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label">Target</label>
                                                    <form:select path="target" cssClass="form-select">
                                                        <form:option value="GAMING">Gaming</form:option>
                                                        <form:option value="SINHVIEN-VANPHONG">Sinh viên – Văn phòng
                                                        </form:option>
                                                        <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa
                                                        </form:option>
                                                        <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                    </form:select>
                                                </div>

                                                <!-- Upload image -->
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label">Change Image</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        name="hungFile" accept=".png,.jpg,.jpeg" />
                                                </div>

                                                <!-- Current Image -->
                                                <div class="col-12 mb-3">
                                                    <label class="form-label">Current Image</label><br />
                                                    <c:if test="${not empty newProduct.image}">
                                                        <img id="avatarPreview" src="/uploads/product/${product.image}"
                                                            style="max-height: 250px;" />
                                                    </c:if>
                                                </div>

                                                <button class="btn btn-warning">Update</button>
                                            </form:form>

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