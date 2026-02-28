<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <title>Update Order</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="sb-nav-fixed">

                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">

                                <h1 class="mt-4">Cập nhật đơn hàng</h1>

                                <div class="card shadow-sm mt-3">
                                    <div class="card-body">
                                        <!-- INFO -->
                                        <p>
                                            <strong>Mã đơn hàng = </strong> ${newOrder.id}
                                            &nbsp;&nbsp;&nbsp;
                                            <strong>Tổng tiền: </strong>
                                            <fmt:formatNumber value="${newOrder.totalPrice}" pattern="#,##0" /> đ
                                        </p>

                                        <form:form method="post"
                                            action="${pageContext.request.contextPath}/admin/order/update"
                                            modelAttribute="newOrder">

                                            <form:hidden path="id" />

                                            <!-- USER (readonly) -->
                                            <div class="mb-3">
                                                <label class="form-label">Tên tài khoản:</label>
                                                <input type="text" class="form-control"
                                                    value="${newOrder.user.fullName}" readonly />
                                            </div>

                                            <!-- STATUS -->
                                            <div class="mb-3">
                                                <label class="form-label">Status</label>
                                                <form:select path="status" cssClass="form-select">
                                                    <form:option value="PENDING" label="PENDING" />
                                                    <form:option value="SHIPPING" label="SHIPPING" />
                                                    <form:option value="COMPLETE" label="COMPLETE" />
                                                    <form:option value="CANCEL" label="CANCEL" />
                                                </form:select>
                                            </div>

                                            <button type="submit" class="btn btn-warning">
                                                Update
                                            </button>

                                        </form:form>

                                    </div>
                                </div>

                            </div>
                        </main>

                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>

            </body>

            </html>