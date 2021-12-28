<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/11
  Time: 13:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社会实践系统注册</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="static/dist/js/toast.min.js"></script>
</head>
<body>
<div class="card" style="margin-left: 2rem;margin-right: 2rem;margin-top: 2rem;">
    <div class="card-header">
       用户注册
    </div>
<form action="${pageContext.request.contextPath}/adduser" method="post" style="margin-top: 2vw;">
    <div style="margin-left: 2vw; margin-right: 2vw;">
<div class="form-group row">
    <label for="staffid" class="col-sm-2 col-form-label">员工id</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="staffid" name="staffid" placeholder="请输入你的工号/学号" required>
    </div>
</div>
    <div class="form-group row">
        <label for="usr" class="col-sm-2 col-form-label">用户名</label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="usr" name="username" placeholder="请输入你的用户名" required>
        </div>
    </div>
    <div class="form-group row">
        <label for="pwd" class="col-sm-2 col-form-label">密码</label>
        <div class="col-sm-10">
            <input type="password" class="form-control" id="pwd" name="password" placeholder="请输入你的密码" required>
        </div>
    </div>
<div class="form-group row">
    <label for="college" class="col-sm-2 col-form-label">学院</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="college" placeholder="请输入你所在的学院" name="college" required>
    </div>
</div>
<div class="input-group mb-3">
    <label for="authority" class="col-sm-2 col-form-label">身份</label>
    <select class="custom-select" id="authority" name="authority">
        <option  value="1">学生</option>
        <option value="2">教师</option>
        <option value="3">管理员</option>
    </select>
</div>
<div class="form-group row">
    <label for="phone" class="col-sm-2 col-form-label">联系方式</label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="phone" placeholder="请输入你的手机号" name="phone" required>
    </div>
</div>
<button type="submit" class="btn btn-primary " style="margin-left: 20vw;">注册</button>
        <a role="button" class="btn btn-primary "  href="login.jsp" style="margin-left: 30vw;">返回登录</a>
    </div>
</form>
</div>
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
    console.log(flag)
    if(flag=='0')
    {
        this.dialogtest("警告","注册错误","static/image/error.svg");
    }
    if(flag=='2')
    {
        this.dialogtest("警告","手机号已被注册!","static/image/error.svg");
    }
    else if(flag=='3')
    {
        this.dialogtest("警告","手机号为空!","static/image/error.svg");
    }
</script>
</body>
</html>
