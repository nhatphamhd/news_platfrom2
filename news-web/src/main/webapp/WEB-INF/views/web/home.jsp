<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng nhập</title>
</head>
<body>
<div class="position-relative">
    <div id="login-box" class="login-box visible widget-box no-border">
        <div class="widget-body">
            <div class="widget-main">
                <h4 class="header blue lighter bigger">
                    <i class="ace-icon fa fa-coffee green"></i>

                </h4>
                <div class="container">
                    <h1>Người dùng</h1>
                    <div>
                        <button type="button" class="btn btn-primary">Thêm mới</button>
                        <button type="button" class="btn btn-danger">Xóa</button>
                    </div>
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th>Fullname</th>
                            <th>status</th>
                            <th>username</th>
                            <th></th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="user" items="${users}">
                            <tr>
                                <td>${user.fullName}</td>
                                <td>${user.status}</td>
                                <td>${user.userName}</td>
                                <td>
<%--                                    <button>Edit</button>--%>
<%--                                    <button>Delete</button>--%>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="space-6"></div>


                <div class="space-6"></div>
            </div><!-- /.widget-main -->
        </div><!-- /.widget-body -->
    </div><!-- /.login-box -->
</div><!-- /.position-relative -->
</body>
</html>