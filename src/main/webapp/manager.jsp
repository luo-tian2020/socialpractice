<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/18
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>vip</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/dist/css/pricing.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="managehead.jsp" />
<div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
<h1 class="display-4">Admin</h1>
<p class="lead">尊敬的管理员${sessionScope.user.username}先生，欢迎使用本系统。</p>
</div>
<div class="container">
    <div class="card-deck mb-3 text-center">
        <div class="card mb-4 shadow-sm">
            <div class="card-header">
                <h4 class="my-0 font-weight-normal">个人中心</h4>
            </div>
            <div class="card-body">
                <h5 class="card-title pricing-card-title"> <small class="text-muted">关于个人</small></h5>
                <ul class="list-unstyled mt-3 mb-4">
                    <li>查看私人信息</li>
                    <li>修改私人信息</li>
                </ul>
            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header">
                <h4 class="my-0 font-weight-normal">用户管理</h4>
            </div>
            <div class="card-body">
                <h5 class="card-title pricing-card-title"><small class="text-muted">关于用户</small></h5>
                <ul class="list-unstyled mt-3 mb-4">
                    <li>用户数据统计</li>
                    <li>用户信息查看</li>
                    <li>用户信息修改</li>
                    <li>用户信息删除</li>
                </ul>
            </div>
        </div>
        <div class="card mb-4 shadow-sm">
            <div class="card-header">
                <h4 class="my-0 font-weight-normal">社会实践</h4>
            </div>
            <div class="card-body">
                <h5 class="card-title pricing-card-title"> <small class="text-muted">关于实践</small></h5>
                <ul class="list-unstyled mt-3 mb-4">
                    <li>统计实践数据</li>
                    <li>实践信息查看</li>
                    <li>实践信息修改</li>
                    <li>实践信息删除</li>
                </ul>
            </div>
        </div>
    </div>
<jsp:include page="foot.jsp" />
</body>
</html>
