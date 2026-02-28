<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>Delete Order</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
            </head>

            <body class="container mt-5">

                <h3>Delete Order with ID = ${id}</h3>
                <hr />

                <div class="alert alert-danger">
                    Are you sure you want to delete this order?
                </div>

                <form:form method="post" action="/admin/order/delete" modelAttribute="newOrder">

                    <!-- Hidden ID -->
                    <form:hidden path="id" value="${id}" />

                    <button type="submit" class="btn btn-danger">Confirm Delete</button>
                    <a href="/admin/order" class="btn btn-secondary">Cancel</a>

                </form:form>

            </body>

            </html>