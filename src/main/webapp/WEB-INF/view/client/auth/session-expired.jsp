<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <title>Session Expired</title>

                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
                        rel="stylesheet">

                    <style>
                        body {
                            background: linear-gradient(135deg, #eef2ff, #f8fafc);
                            min-height: 100vh;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            font-family: "Inter", sans-serif;
                        }

                        .error-container {
                            text-align: center;
                            max-width: 520px;
                            padding: 40px;
                        }

                        .error-illustration {
                            width: 260px;
                            margin-bottom: 20px;
                        }

                        .error-code {
                            font-size: 64px;
                            font-weight: 700;
                            color: #111827;
                            margin-bottom: 10px;
                        }

                        .error-title {
                            font-size: 28px;
                            font-weight: 600;
                            color: #1f2937;
                            margin-bottom: 10px;
                        }

                        .error-desc {
                            color: #6b7280;
                            font-size: 16px;
                            margin-bottom: 25px;
                            line-height: 1.6;
                        }

                        .btn-home {
                            padding: 12px 28px;
                            border-radius: 999px;
                            font-weight: 500;
                            box-shadow: 0 6px 18px rgba(37, 99, 235, 0.25);
                        }

                        .btn-home:hover {
                            transform: translateY(-1px);
                            box-shadow: 0 10px 25px rgba(37, 99, 235, 0.35);
                        }
                    </style>
                </head>

                <body>

                    <div class="error-container">

                        <!-- Illustration -->
                        <img src="https://cdn-icons-png.flaticon.com/512/595/595067.png" class="error-illustration"
                            alt="session expired">

                        <div class="error-code">Session</div>

                        <div class="error-title">
                            Phiên đăng nhập đã hết hạn
                        </div>

                        <div class="error-desc">
                            Phiên đăng nhập của bạn đã kết thúc hoặc bạn đã đăng nhập ở nơi khác.<br>
                            Vui lòng đăng nhập lại để tiếp tục sử dụng hệ thống.
                        </div>

                        <a href="/login" class="btn btn-primary btn-home">
                            🔐 Đăng nhập lại
                        </a>

                    </div>

                </body>

                </html>