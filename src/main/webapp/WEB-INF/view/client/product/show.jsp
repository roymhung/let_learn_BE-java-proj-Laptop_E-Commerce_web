<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="utf-8">
                    <title>Sản Phẩm - Laptopshop</title>
                    <meta content="width=device-width, initial-scale=1.0" name="viewport">
                    <meta content="" name="keywords">
                    <meta content="" name="description">

                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
                        rel="stylesheet">

                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                        rel="stylesheet">

                    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                    <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
                    <link href="/client/css/bootstrap.min.css" rel="stylesheet">
                    <link href="/client/css/style.css" rel="stylesheet">
                </head>

                <body class="page-products">

                    <div id="spinner"
                        class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
                        style="z-index: 99999;">
                        <div class="spinner-grow text-primary" role="status"></div>
                    </div>

                    <jsp:include page="../layout/header.jsp" />

                    <div class="container-fluid py-4 mt-5">
                        <div class="container py-3">
                            <!-- Breadcrumb -->
                            <nav aria-label="breadcrumb" class="mb-4 mt-5">
                                <ol class="breadcrumb page-products-breadcrumb">
                                    <li class="breadcrumb-item"><a href="/">Home</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Danh Sách Sản Phẩm</li>
                                </ol>
                            </nav>

                            <div class="row g-4">
                                <!-- Sidebar Filters -->
                                <aside class="col-12 col-md-4 col-lg-3">
                                    <div class="product-filters-card">
                                        <div class="product-filters-header">
                                            <i class="fas fa-filter product-filters-header-icon"></i>
                                            <span class="product-filters-header-text">Bộ lọc</span>
                                        </div>

                                        <form id="filterForm" class="product-filters-body" action="/products"
                                            method="get">
                                            <div class="filter-group" id="factoryFilter">
                                                <div class="filter-group-title">Hãng sản xuất</div>
                                                <div class="filter-options">
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="brand" value="APPLE">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Apple</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="brand" value="ASUS">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Asus</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="brand" value="LENOVO">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Lenovo</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="brand" value="DELL">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Dell</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="brand" value="LG">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">LG</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="brand" value="ACER">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Acer</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="filter-group" id="targetFilter">
                                                <div class="filter-group-title">Mục đích sử dụng</div>
                                                <div class="filter-options">
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="purpose" value="GAMING">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Gaming</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="purpose" value="SINHVIEN-VANPHONG">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Sinh viên - văn phòng</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="purpose" value="THIET-KE-DO-HOA">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Thiết kế đồ họa</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="purpose" value="MONG-NHE">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Mỏng nhẹ</span>
                                                    </label>
                                                    <label class="filter-check">
                                                        <input type="checkbox" name="purpose" value="DOANH-NHAN">
                                                        <span class="filter-checkmark"></span>
                                                        <span class="filter-label">Doanh nhân</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="filter-group" id="priceFilter">
                                                <div class="filter-group-title">Mức giá</div>
                                                <div class="filter-options filter-options-radio">
                                                    <label class="filter-radio">
                                                        <input type="checkbox" name="price" value="duoi-10-trieu">
                                                        <span class="filter-radio-dot"></span>
                                                        <span class="filter-label">Dưới 10 triệu</span>
                                                    </label>
                                                    <label class="filter-radio">
                                                        <input type="checkbox" name="price" value="10-15-trieu">
                                                        <span class="filter-radio-dot"></span>
                                                        <span class="filter-label">Từ 10 - 15 triệu</span>
                                                    </label>
                                                    <label class="filter-radio">
                                                        <input type="checkbox" name="price" value="15-30-trieu">
                                                        <span class="filter-radio-dot"></span>
                                                        <span class="filter-label">Từ 15 - 30 triệu</span>
                                                    </label>
                                                    <label class="filter-radio">
                                                        <input type="checkbox" name="price" value="tren-30-trieu">
                                                        <span class="filter-radio-dot"></span>
                                                        <span class="filter-label">Trên 30 triệu</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <div class="filter-group">
                                                <div class="filter-group-title">Sắp xếp</div>
                                                <div class="filter-options filter-options-radio">
                                                    <label class="filter-radio">
                                                        <input type="checkbox" name="sort" value="gia-tang-dan">
                                                        <span class="filter-radio-dot"></span>
                                                        <span class="filter-label">Giá tăng dần</span>
                                                    </label>
                                                    <label class="filter-radio">
                                                        <input type="checkbox" name="sort" value="gia-giam-dan">
                                                        <span class="filter-radio-dot"></span>
                                                        <span class="filter-label">Giá giảm dần</span>
                                                    </label>
                                                    <label class="filter-radio">
                                                        <input type="checkbox" name="sort" value="gia-nothing" checked>
                                                        <span class="filter-radio-dot"></span>
                                                        <span class="filter-label">Mặc định</span>
                                                    </label>
                                                </div>
                                            </div>

                                            <button type="submit" class="product-filters-btn" id="btnFilter">
                                                <i class="fas fa-search me-2"></i>
                                                Lọc sản phẩm
                                            </button>
                                        </form>
                                    </div>
                                </aside>

                                <!-- Product Grid -->
                                <main class="col-12 col-md-8 col-lg-9 text-center">
                                    <div class="row g-4 fruite">
                                        <c:if test="${totalPages == 0}">
                                            <div>Không tìm thấy sản phẩm</div>
                                        </c:if>

                                        <c:forEach var="product" items="${products}">
                                            <div class="col-md-6 col-lg-4">
                                                <div class="rounded position-relative fruite-item product-list-card">
                                                    <div class="fruite-img">
                                                        <img src="/images/product/${product.image}"
                                                            class="img-fluid w-100 rounded-top" alt="${product.name}">
                                                    </div>
                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                                                        style="top: 10px; left: 10px;">Laptop</div>
                                                    <div
                                                        class="p-4 border border-top-0 rounded-bottom product-list-card-body">
                                                        <h4 class="product-list-card-title">
                                                            <a href="/product/${product.id}">${product.name}</a>
                                                        </h4>
                                                        <p class="product-list-card-desc">${product.shortDesc}</p>
                                                        <div
                                                            class="d-flex flex-lg-wrap justify-content-center flex-column">
                                                            <p class="text-dark fw-bold mb-3 product-list-card-price">
                                                                <fmt:formatNumber type="number"
                                                                    value="${product.price}" />đ
                                                            </p>
                                                            <form action="/add-product-to-cart/${product.id}"
                                                                method="post">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button type="submit"
                                                                    class="mx-auto btn product-list-card-btn">
                                                                    <i class="fa fa-shopping-cart me-2"></i>Thêm vào giỏ
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>

                                        <c:if test="${totalPages > 1}">
                                            <div class="col-12">
                                                <ul class="pagination justify-content-center mt-5 mb-0">
                                                    <li class="page-item">
                                                        <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="${1 eq currentPage ? '#' : '/products?page='}${1 eq currentPage ? '' : currentPage - 1}"
                                                            aria-label="Previous">
                                                            <span aria-hidden="true">&laquo;</span>
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                                                        <li class="page-item">
                                                            <a class="${(loop.index + 1) eq currentPage ? 'active page-link' : 'page-link'}"
                                                                href="/products?page=${loop.index + 1}">${loop.index +
                                                                1}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <li class="page-item">
                                                        <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                                                            href="${totalPages eq currentPage ? '#' : '/products?page='}${totalPages eq currentPage ? '' : currentPage + 1}"
                                                            aria-label="Next">
                                                            <span aria-hidden="true">&raquo;</span>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </c:if>
                                    </div>
                                </main>
                            </div>
                        </div>
                    </div>

                    <jsp:include page="../layout/footer.jsp" />

                    <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                            class="fa fa-arrow-up"></i></a>

                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                    <script src="/client/lib/easing/easing.min.js"></script>
                    <script src="/client/lib/waypoints/waypoints.min.js"></script>
                    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                    <script src="/client/js/main.js"></script>
                </body>

                </html>