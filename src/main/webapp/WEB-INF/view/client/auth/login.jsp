<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1" />
                    <title>Login</title>
                    <!-- Bootstrap -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <!-- FontAwesome -->
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>

                    <!-- Template Stylesheet -->
                    <link href="/client/css/login.css" rel="stylesheet">
                </head>

                <body>

                    <form:form method="post" action="/login" modelAttribute="loginUser">
                        <div class="card auth-card shadow-lg border-0">
                            <div class="row g-0">

                                <!-- LEFT -->
                                <div class="col-md-5 auth-left d-flex flex-column justify-content-center">
                                    <h2>Chào mừng quay lại 👋</h2>
                                    <p class="mt-3">
                                        Đăng nhập để tiếp tục quản lý hệ thống của bạn một cách nhanh chóng và an toàn.
                                    </p>
                                    <p class="mt-4 small">
                                        Chưa có tài khoản?<br>
                                        <a href="/register" class="text-white text-decoration-underline">
                                            Tạo tài khoản
                                        </a>
                                    </p>
                                </div>

                                <!-- RIGHT -->
                                <div class="col-md-7 auth-right">
                                    <div class="card-headr">
                                        <h3 class="mb-4 text-center">Đăng nhập</h3>
                                    </div>

                                    <div class="card-body">
                                        <!-- LOGIN ERROR -->
                                        <c:if test="${param.error != null}">
                                            <div class="alert alert-danger d-flex align-items-center py-2 px-3 mb-4">
                                                <i class="fa-solid fa-circle-exclamation me-2"></i>
                                                Thông tin đăng nhập không hợp lệ!
                                            </div>
                                        </c:if>

                                        <div class="mb-3">
                                            <label class="form-label">Email address</label>
                                            <input type="email" class="form-control" placeholder="name@example.com"
                                                name="username">
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Password</label>
                                            <input type="password" class="form-control" placeholder="••••••••"
                                                name="password">
                                        </div>

                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

                                        <div class="d-flex justify-content-between align-items-center mb-4">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" id="remember">
                                                <label class="form-check-label" for="remember">
                                                    Ghi nhớ đăng nhập
                                                </label>
                                            </div>
                                            <a href="/register">Quên mật khẩu?</a>
                                        </div>

                                        <div class="d-grid mb-3">
                                            <button class="btn btn-primary">
                                                <i class="fa-solid fa-right-to-bracket me-2"></i>
                                                Đăng nhập
                                            </button>
                                        </div>

                                        <div class="text-center text-muted small">
                                            Đăng nhập an toàn, được bảo vệ bởi hệ thống của bạn 🌿
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </form:form>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>