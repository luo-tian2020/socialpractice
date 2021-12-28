<%@ page import="com.luotian.Entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/13
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>studentheader</title>
    <link rel="stylesheet" href="static/dist/css/head.css">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }
        .zaixian{
            float: right;
            margin-right: 2rem;
        }


        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
</head>
<body>
<div>
    <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
        <a class="navbar-brand" href="#">社会实践管理系统</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample03" aria-controls="navbarsExample03" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample03">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="javascript:doPost('userinfo.jsp', {'action':0})">个人中心 <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="javascript:doPost('${pageContext.request.contextPath}/choosesocial', {'id':'${sessionScope.user.id}'})">社会实践选择</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="javascript:doPost('${pageContext.request.contextPath}/searchscore', {'id':'${sessionScope.user.id}'})">成绩查询</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="javascript:doPost('${pageContext.request.contextPath}/searchProgress', {'id':'${sessionScope.user.id}'})">进度管理</a>
                </li>

                <%--            <li class="nav-item dropdown">--%>
                <%--                <a class="nav-link dropdown-toggle" href="#" id="dropdown03" data-toggle="dropdown" aria-expanded="false">Dropdown</a>--%>
                <%--                <div class="dropdown-menu" aria-labelledby="dropdown03">--%>
                <%--                    <a class="dropdown-item" href="#">Action</a>--%>
                <%--                    <a class="dropdown-item" href="#">Another action</a>--%>
                <%--                    <a class="dropdown-item" href="#">Something else here</a>--%>
                <%--                </div>--%>
                <%--            </li>--%>
            </ul>
            <form class="form-inline my-2 my-md-0">
                <a class="nav-link zaixian" href="javascript:doPost('${pageContext.request.contextPath}/goindex', {'id':'${sessionScope.user.id}','authority':'${sessionScope.user.authority}'})">${sessionScope.user.username}在线</a>
                <a href="${pageContext.request.contextPath}/logout">退出</a>
            </form>
        </div>
    </nav>
</div>
<script type="text/javascript">

    function doPost(to, p) { // to:提交动作（action）,p:参数
        var myForm = document.createElement("form");
        myForm.method = "post";
        myForm.action = to;
        for ( var i in p) {
            var myInput = document.createElement("input");
            myInput.setAttribute("name", i); // 为input对象设置name
            myInput.setAttribute("value", p[i]); // 为input对象设置value
            myForm.appendChild(myInput);
        }
        document.body.appendChild(myForm);
        myForm.submit();
        document.body.removeChild(myForm); // 提交后移除创建的form
    }
</script>
</body>
</html>
