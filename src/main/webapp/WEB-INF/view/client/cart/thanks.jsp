<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Đặt hàng thành công</title>

                    <!-- Google Font -->
                    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
                        rel="stylesheet">

                    <style>
                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                            font-family: 'Poppins', sans-serif;
                        }

                        body {
                            height: 100vh;
                            background: linear-gradient(135deg, #4e73df, #1cc88a);
                            display: flex;
                            align-items: center;
                            justify-content: center;
                        }

                        .success-card {
                            background: white;
                            padding: 50px 40px;
                            border-radius: 20px;
                            text-align: center;
                            width: 90%;
                            max-width: 500px;
                            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.2);
                            animation: fadeIn 0.8s ease-in-out;
                        }

                        .checkmark {
                            width: 90px;
                            height: 90px;
                            border-radius: 50%;
                            background: #1cc88a;
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            margin: 0 auto 20px auto;
                            animation: pop 0.5s ease;
                        }

                        .checkmark svg {
                            width: 50px;
                            height: 50px;
                            stroke: white;
                            stroke-width: 4;
                            fill: none;
                        }

                        h1 {
                            color: #333;
                            margin-bottom: 10px;
                            font-weight: 600;
                        }

                        p {
                            color: #666;
                            font-size: 15px;
                            margin-bottom: 30px;
                        }

                        .btn-group {
                            display: flex;
                            gap: 15px;
                            justify-content: center;
                        }

                        .btn {
                            padding: 12px 22px;
                            border-radius: 8px;
                            text-decoration: none;
                            font-weight: 500;
                            transition: 0.3s;
                        }

                        .btn-primary {
                            background: #4e73df;
                            color: white;
                        }

                        .btn-primary:hover {
                            background: #2e59d9;
                        }

                        .btn-outline {
                            border: 2px solid #4e73df;
                            color: #4e73df;
                        }

                        .btn-outline:hover {
                            background: #4e73df;
                            color: white;
                        }

                        @keyframes fadeIn {
                            from {
                                opacity: 0;
                                transform: translateY(20px);
                            }

                            to {
                                opacity: 1;
                                transform: translateY(0);
                            }
                        }

                        @keyframes pop {
                            0% {
                                transform: scale(0);
                            }

                            100% {
                                transform: scale(1);
                            }
                        }
                    </style>
                </head>

                <body>

                    <div class="success-card">
                        <div class="checkmark">
                            <svg viewBox="0 0 24 24">
                                <path d="M5 13l4 4L19 7" />
                            </svg>
                        </div>

                        <h1>Đặt hàng thành công 🎉</h1>
                        <p>
                            Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi.
                            Đơn hàng của bạn đang được xử lý và sẽ sớm được giao đến bạn.
                        </p>

                        <div class="btn-group">
                            <a href="/" class="btn btn-primary">Về trang chủ</a>
                            <a href="/orders" class="btn btn-outline">Xem đơn hàng</a>
                        </div>
                    </div>

                </body>

                </html>