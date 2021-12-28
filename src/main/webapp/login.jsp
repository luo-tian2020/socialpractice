<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/9
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社会实践系统登录</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />

    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="static/dist/js/toast.min.js"></script>
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
    <style>
        .bg{
            background: url(static/image/login.jpg) no-repeat;
            max-width: 100%;
            max-height: 100%;
        }
        .login-page {
            width: 360px;
            padding: 8% 0 0;
            margin: auto;
        }
        .login-page h3{
            color:#cccccc;
        }
        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 360px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .form input {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .form button {
            font-family: "Roboto", sans-serif;
            text-transform: uppercase;
            outline: 0;
            background: #5799c3;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all;
            transition: all;
            cursor: pointer;
        }
        .form button:hover,.form button:active,.form button:focus {
            background: #3b627e;
        }
        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }
        .form .message a {
            color: #5799c3;
            text-decoration: none;
        }
        .form .register-form {
            display: none;
        }
        .container {
            position: relative;
            z-index: 1;
            max-width: 300px;
            margin: 0 auto;
        }
        .container:before, .container:after {
            content: "";
            display: block;
            clear: both;
        }
        .container .info {
            margin: 50px auto;
            text-align: center;
        }
        .container .info h1 {
            margin: 0 0 15px;
            padding: 0;
            font-size: 36px;
            font-weight: 300;
            color: #1a1a1a;
        }
        .container .info span {
            color: #4d4d4d;
            font-size: 12px;
        }
        .container .info span a {
            color: #000000;
            text-decoration: none;
        }
        .container .info span .fa {
            color: #EF3B3A;
        }
        body {
            background: #8595a1;
        }
    </style>
    <script lang="text/javascript">
      function check(form){
              let phone=form.phone.value;
              let password=form.password.value;
          if(!phone.trim())
          {
              alert("用户名不能为空！");
              return false;
          }
          if(!password.trim())
          {
              alert("密码不能为空");
              return false;
          }
          return true;
      }


      <%--    let phone=document.getElementById("phone").value;--%>
      <%--    let password=document.getElementById("password").value;--%>
      <%--    console.log(phone);--%>
      <%--    console.log(password);--%>
      <%--    if(phone==""&& phone==null&& phone==undefined)--%>
      <%--    {--%>
      <%--        alert("用户名不能为空！")--%>
      <%--        --%>
      <%--    }--%>
      <%--    else if(password==""&& password==null && password==undefined)--%>
      <%--    {--%>
      <%--        alert("密码不能为空")--%>
      <%--    }--%>

      <%--    else{--%>
      <%--        let url="${pageContext.request.contextPath}/login";--%>
      <%--        let data={--%>
      <%--            phone:phone,--%>
      <%--            password:password--%>
      <%--        }--%>
      <%--        let success=function(data){--%>

      <%--        }--%>
      <%--        $.post(url,data,success);--%>
      <%--    }--%>
      <%--}--%>
    </script>
</head>
<body class="bg">

<div class="login-page">
    <h3>Login</h3>
    <div class="form">
        <a href="registration.jsp">注册</a>
        <form class="login-form" action="${pageContext.request.contextPath}/login" method="post" onsubmit="return check(this)">
            <input type="text"  name="phone" placeholder="phone" id="phone"/>
            <input type="password" placeholder="password" name="password" id="password"/>
            <button type="submit">登录</button>
            <p class="message">忘记密码? <a href="#">联系管理员</a></p>
        </form>
<%--        <div class="alert alert-danger" role="alert">--%>
<%--            Username or password is wrong!--%>
<%--        </div>--%>
    </div>
</div>

<%--<div class="container">--%>
<%--    <form action="">--%>
<%--        <div class="form-group row">--%>
<%--            <label for="usr" class="col-sm-2 col-form-label">Email</label>--%>
<%--            <div class="col-sm-10">--%>
<%--                <input type="text" class="form-control" id="usr">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="form-group row">--%>
<%--            <label for="pwd" class="col-sm-2 col-form-label">Password</label>--%>
<%--            <div class="col-sm-10">--%>
<%--                <input type="password" class="form-control" id="pwd">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">登录</button>--%>
<%--    </form>--%>
<%--    <button type="button" class="btn btn-primary" onclick="goRegistration()">注册</button>--%>

<%--</div>--%>
<script lang="text/javascript">
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
        this.dialogtest("警告","密码错误","static/image/error.svg")
    }
    else if(flag=='1')
    {
        this.dialogtest("成功","注册成功","static/image/success.svg")
    }
    else if(flag=='2')
    {
        this.dialogtest("警告","用户尚未注册","static/image/error.svg")
    }
    function goRegistration() {
        window.location.href="registration.jsp";
    }
</script>
</body>
</html>
