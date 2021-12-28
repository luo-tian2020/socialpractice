<%@ page import="com.luotian.Entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/14
  Time: 20:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>个人中心</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="static/dist/js/toast.min.js"></script>
</head>
<body>
<c:if test="${sessionScope.user.authority==1}">
    <jsp:include page="studenthead.jsp" />
</c:if>
<c:if test="${sessionScope.user.authority==2}">
    <jsp:include page="teacherhead.jsp" />
</c:if>
<c:if test="${sessionScope.user.authority==3}">
    <jsp:include page="managehead.jsp" />
</c:if>
<c:if test="${param.action==0||action==0}">
<div class="container">
    <h2 class="text-center">基本信息</h2>
    <div class="col-md-9 ">
        <ul class="list-group list-group-flush" style="margin-left: 15rem;">
            <li class="list-group-item">用户名:    ${sessionScope.user.username}</li>
            <li class="list-group-item">工号:${sessionScope.user.staffid}</li>
            <li class="list-group-item">学院:${sessionScope.user.college}</li>
            <li class="list-group-item">身份:${sessionScope.user.staff}</li>
            <li class="list-group-item">联系方式:${sessionScope.user.phone}</li>
        </ul>
        <a href="userinfo.jsp?action=1" >
        <button class="btn btn-outline-primary" type="submit" style="margin-left: 45rem;">
       修改
        </button>
        </a>
    </div>
</div>
</c:if>
<c:if test="${param.action==1||action==1}">
    <div class="card" style="margin-left: 2rem;margin-right: 2rem">
        <div class="card-header">
            个人信息
        </div>
        <form style="margin-left: 2rem;margin-right: 1rem;" action="${pageContext.request.contextPath}/updateuser" method="post">
            <div class="form-row">
                <input name="id" value="${sessionScope.user.id}" type="hidden">
                <div class="form-group col-md-6">
                    <label>用户名</label>
                    <input type="text" class="form-control"  value="${sessionScope.user.username}" name="username">
                </div>
                <div class="form-group col-md-6">                    <label for="inputPassword4">密码</label>
                    <input type="password" class="form-control" id="inputPassword4" value="${sessionScope.user.password}" name="password">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputstaffid">学号</label>
                    <input type="text" class="form-control" id="inputstaffid" value="${sessionScope.user.staffid}"  name="staffid">
                </div>
            <div class="form-group col-md-6">
                <label for="inputAddress">学院</label>
                <input type="text" class="form-control" id="inputAddress" placeholder="学院" value="${sessionScope.user.college}" name="college">
            </div>
            </div>
            <div class="form-group">
                <label for="inputAddress2">联系方式</label>
                <input type="text" class="form-control" id="inputAddress2" placeholder="Apartment, studio, or floor" value="${sessionScope.user.phone}" name="phone">
            </div>
            <div class="form-row">
<%--                                <div class="form-group col-md-6">--%>
<%--                                    <label for="inputCity">City</label>--%>
<%--                                    <input type="text" class="form-control" id="inputCity">--%>
<%--                                </div>--%>
                <div class="form-group col-md-4">
                    <label for="inputState">State</label>
                    <select id="inputState" class="form-control" value="${sessionScope.user.staff}" name="authority">
                        <option value="1">学生</option>
                        <option value="2">教师</option>
                        <option value="3">管理员</option>
                    </select>
                </div>
<%--                                <div class="form-group col-md-2">--%>
<%--                                    <label for="inputZip">Zip</label>--%>
<%--                                    <input type="text" class="form-control" id="inputZip">--%>
<%--                                </div>--%>
            </div>
<%--                        <div class="form-group">--%>
<%--                            <div class="form-check">--%>
<%--                                <input class="form-check-input" type="checkbox" id="gridCheck">--%>
<%--                                <label class="form-check-label" for="gridCheck">--%>
<%--                                    Check me out--%>
<%--                                </label>--%>
<%--                            </div>--%>
<%--                        </div>--%>
            <button type="submit" class="btn btn-primary">修改</button>
        </form>
    </div>
</c:if>
<script type="text/javascript">
    function dialogtest(title,content,pic)
    {
        $.toast({
            title: title,
            subtitle: '刚刚',
            content: content,
            type: 'info',
            delay: 2000,
            img: {
                src: pic,
                class: 'rounded',
                title: 'Thumbnail Title',
            },
            pause_on_hover: false
        });
    }
    let flag='${requestScope.flag}';
    if(flag=='0')
    {
        this.dialogtest("警告","修改失败","static/image/error.svg")
    }
    else if(flag=='1')
    {
        this.dialogtest("成功","修改成功","static/image/success.svg")
    }
    if(flag=='2')
    {
        this.dialogtest("警告","手机号已被注册","static/image/error.svg")
    }
</script>
</body>
</html>
