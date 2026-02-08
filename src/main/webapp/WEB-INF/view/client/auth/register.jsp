<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta name="viewport" content="width=device-width, initial-scale=1" />
                    <title>Create Account</title>

                    <!-- Bootstrap -->
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <!-- FontAwesome -->
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>

                    <!-- Template Stylesheet -->
                    <link href="/client/css/register.css" rel="stylesheet">
                </head>

                <body>

                    <div class="card auth-card shadow-lg border-0">
                        <div class="row g-0">

                            <!-- LEFT -->
                            <div class="col-md-5 auth-left d-flex flex-column justify-content-center">
                                <h2>Welcome 🌱</h2>
                                <p class="mt-3">
                                    Create your account to start managing your system easily and efficiently.
                                </p>
                                <p class="mt-4 small">
                                    Already have an account?<br>
                                    <a href="login.html" class="text-white text-decoration-underline">
                                        Login here
                                    </a>
                                </p>
                            </div>

                            <!-- RIGHT -->
                            <div class="col-md-7 auth-right">
                                <div class="card-headr">
                                    <h3 class="mb-4 text-center">Create Account</h3>
                                </div>
                                <div class="card-body">
                                    <form:form method="post" action="/register" modelAttribute="registerUser">
                                        <!-- ERROR VARS -->
                                        <c:set var="errorPassword">
                                            <form:errors path="confirmPassword" cssClass="invalid-feedback d-block" />
                                        </c:set>

                                        <c:set var="errorEmail">
                                            <form:errors path="email" cssClass="invalid-feedback d-block" />
                                        </c:set>

                                        <div class="row mb-3">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <label class="form-label">First name</label>
                                                <form:input type="text" class="form-control" placeholder="John"
                                                    path="firstName" />
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Last name</label>
                                                <form:input type="text" class="form-control" placeholder="Doe"
                                                    path="lastName" />
                                            </div>
                                        </div>

                                        <div class="mb-3">
                                            <label class="form-label">Email address</label>
                                            <form:input type="email"
                                                cssClass="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
                                                placeholder="name@example.com" path="email" />
                                            ${errorEmail}
                                        </div>

                                        <div class="row mb-4">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <label class="form-label">Password</label>
                                                <form:input type="password"
                                                    cssClass="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
                                                    placeholder="••••••••" path="password" />
                                                ${errorPassword}
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label">Confirm password</label>
                                                <form:input type="password" class="form-control" placeholder="••••••••"
                                                    path="confirmPassword" />
                                            </div>
                                        </div>

                                        <div class="d-grid mb-3">
                                            <button class="btn btn-primary">
                                                <i class="fa-solid fa-user-plus me-2"></i>
                                                Create Account
                                            </button>
                                        </div>

                                        <div class="text-center auth-footer text-muted">
                                            By registering, you agree to our
                                            <a href="#">Terms</a> & <a href="#">Privacy Policy</a>
                                        </div>
                                    </form:form>
                                </div>

                            </div>
                        </div>
                    </div>

                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
                </body>

                </html>