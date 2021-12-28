<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/12
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>footer</title>
    <style>
        .mastfoot {
            color: rgba(255, 255, 255, .5);
        }

    </style>
</head>
<body class="text-center">
<footer class="pt-4 my-md-5 pt-md-5 border-top">
    <div class="row">
        <div class="col-12 col-md">
            <small class="d-block mb-3 text-muted" id="mingyan"></small>
            <small class="d-block mb-3 text-muted" id="fromwho"></small>
        </div>
    </div>
    <div class="inner">
        <a href="https://beian.miit.gov.cn/)#/Integrated/index">©2021 luotian. All rights reserved. 备案号:豫ICP备2021028668号</a>
    </div>
</footer>
<script type="text/javascript">
    function getmingyan(){
        let url='https://v1.hitokoto.cn/?c=d&c=i&encode=json';
        let success=function (res){

            let data=res;
            let mingyan=document.getElementById("mingyan");
            // let fromwho=document.getElementById("fromwho");
            mingyan.innerHTML=data.hitokoto;
            mingyan.setAttribute("title",data.from_who);
        }
        $.get(url,success);
    }
    window.onload=getmingyan;
</script>
</body>
</html>
