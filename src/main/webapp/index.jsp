<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
<%--    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->--%>
<%--    <title>Head Page</title>--%>
<%--    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->--%>
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <style>

        .bg{
            background: url(static/image/bg.jpg) no-repeat;
            max-width: 100%;
            max-height: 100%;
        }
        .masthead {
            margin-bottom: 2rem;
        }
        .masthead-brand {
            margin-bottom: 0;
        }

        .nav-masthead .nav-link {
            padding: .25rem 0;
            font-weight: 700;
            color: rgba(255, 255, 255, .5);
            background-color: transparent;
            border-bottom: .25rem solid transparent;
        }

        .nav-masthead .nav-link:hover,
        .nav-masthead .nav-link:focus {
            border-bottom-color: rgba(255, 255, 255, .25);
        }

        .nav-masthead .nav-link + .nav-link {
            margin-left: 1rem;
        }

        .nav-masthead .active {
            color: #fff;
            border-bottom-color: #fff;
        }

        @media (min-width: 48em) {
            .masthead-brand {
                float: left;
            }
            .nav-masthead {
                float: right;
            }
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
        .cover-container {
            max-width: 42em;
        }
        a,
        a:focus,
        a:hover {
            color: #fff;
        }

        /* Custom default button */
        .btn-secondary,
        .btn-secondary:hover,
        .btn-secondary:focus {
            color: #333;
            text-shadow: none; /* Prevent inheritance from `body` */
            background-color: #fff;
            border: .05rem solid #fff;
        }
        .cover {
            padding: 0 1.5rem;
        }
        .cover .btn-lg {
            padding: .75rem 1.25rem;
            font-weight: 700;
        }
        .mastfoot {
            color: rgba(255, 255, 255, .5);
        }
    </style>
    <title>社会实践系统首页</title>
</head>
<body class="text-center">
<div class="bg">
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
    <header class="masthead mb-auto">

    </header>
    <main role="main" class="inner cover">
        <h1 class="cover-heading">Join us!</h1>
        <p class="lead" style="color: white">从社会中学习，在实践中体悟，开阔眼界，接触自然</p>
        <p class="lead">
            <a href="${pageContext.request.contextPath}/login.jsp" class="btn btn-lg btn-secondary">加入</a>
        </p>
    </main>

    <footer class="mastfoot mt-auto">
        <div class="inner">
            <a href="https://beian.miit.gov.cn/)#/Integrated/index">©2021 luotian. All rights reserved. 备案号:豫ICP备2021028668号</a>
        </div>
    </footer>
</div>

</div>

</body>
</html>
