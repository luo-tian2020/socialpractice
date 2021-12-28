<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/23
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>教师进度管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="static/dist/js/jquery.waypoints.min.js"></script>
    <script src="static/dist/js/toast.min.js"></script>
</head>
<body>
<jsp:include page="teacherhead.jsp" />
<c:if test="${requestScope.progress==0}">
    <c:if test="${fn:length(requestScope.teachersactivity)==0}">
        你还没有发布社会实践活动！
    </c:if>
    <c:if test="${fn:length(requestScope.teachersactivity)!=0}">
    <div style="margin-left: 5vw;margin-right: 5vw;">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">活动序号</th>
            <th scope="col">活动名称</th>
            <th scope="col">开始时间</th>
            <th scope="col">结束时间</th>
            <th scope="col">参与人数</th>
            <th scope="col">查看参与详情</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.teachersactivity}" var="activity" varStatus="activitystatus">
        <tr>
            <th scope="row">${activitystatus.index+1}</th>
            <td>${activity.activitytitle}</td>
            <td>${activity.starttime}</td>
            <td>${activity.endtime}</td>
            <td>${activity.persons-activity.leaveperson}</td>
            <td>
                <a role="button" class="btn btn-primary" href="javascript:doPost('${pageContext.request.contextPath}/getactivityPersonsDetail', {'activityid':'${activity.activityid}'})">查看参与详情</a>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    </c:if>
</c:if>
<c:if test="${requestScope.progress==1}">
    <h2>${activitytitle}</h2>
    <c:if test="${fn:length(requestScope.activitypersonsdetail)==0}">
        暂时没有学生选择该活动！
    </c:if>
    <c:if test="${fn:length(requestScope.activitypersonsdetail)!=0}">

    <div style="margin-left:5vw;margin-right: 5vw;">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">学生序号</th>
            <th scope="col">学生学号</th>
            <th scope="col">学生姓名</th>
            <th scope="col">联系方式</th>
            <th scope="col">当前进度</th>
            <th scope="col">未读信息</th>
            <th scope="col">查看日常</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.activitypersonsdetail}" var="detailact" varStatus="detailactstatus">
        <tr>
            <th scope="row">${detailactstatus.index+1}</th>
            <td>${detailact.staffid}</td>
            <td>${detailact.username}</td>
            <td>${detailact.phone}</td>
            <td>
                <div class="progress">
                    <div class="progress-bar" role="progressbar" style="width: ${detailact.mode}%;" aria-valuenow="${detailact.mode}" aria-valuemin="0" aria-valuemax="100">${detailact.mode}%</div>
                </div>
            </td>
            <td>${detailact.counts}</td>
            <td> <a role="button" class="btn btn-primary" href="javascript:doPost('${pageContext.request.contextPath}/getpersonprogress', {'activityid':'${detailact.activityid}','id':'${detailact.id}'})">查看日常</a></td>

        </tr>
        </c:forEach>
        </tbody>
    </table>
    </div>
    </c:if>
</c:if>
<c:if test="${requestScope.progress==2}">
   <a href="javascript:doPost('${pageContext.request.contextPath}/getactivityPersonsDetail', {'activityid':'${activityid}'})">返回上一级</a>
    <c:if test="${fn:length(requestScope.notpassprogress)==0}">
       <h2>暂时无未读消息！</h2>
    </c:if>
    <c:if test="${fn:length(requestScope.notpassprogress)!=0}">
<div class="app-container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">序号</th>
            <th scope="col">学号</th>
            <th scope="col">学生姓名</th>
            <th scope="col">填写时间</th>
            <th scope="col">填写内容</th>
            <th scope="col">进度调整</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.notpassprogress}" var="notp" varStatus="notpstatus">
        <tr>
            <th scope="row">${notpstatus.index+1}</th>
            <td>${notp.staffid}</td>
            <td>${notp.username}</td>
            <td>${notp.protime}</td>
            <td class="detail" data-toggle="modal" data-target="#detailModal" data-detail="${notp.proinfo}">查看详情</td>
            <td>
                <div class="progress">
                <input type="range" class="form-control-range" id="formControlRange${notpstatus.index}" value="${notp.mode}">
                </div>
            </td>
            <td> <a role="button" href="javascript:readprogress('${notpstatus.index}','${notp.activityid}','${notp.id}','${notp.proid}')" class="btn btn-primary" >确认</a></td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:if>
    <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="detailModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="detailModalLabel">New message</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <span id="detailact" ></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
    <h5>学生总体进度</h5>
<section class="timeline">
    <div class="wrapper">
        <c:forEach items="${requestScope.passprogress}" var="propass" varStatus="propassstatus">
        <div class="timeline__item timeline__item--${propassstatus.index}">
            <div class="timeline__item__station"></div>
            <div class="timeline__item__content">
                <h2 class="timeline__item__content__date">${propass.protime}</h2>
                <p class="timeline__item__content__description">${propass.proinfo}</p>
            </div>
        </div>
        </c:forEach>
    </div>
</section>
    <h5>为学生充分发展服务，对学生终生发展负责</h5>
    </div>
</c:if>
<jsp:include page="foot.jsp"/>
<script type="text/javascript">
    $('#detailModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var detailinfo = button.data('detail'); // Extract info from data-* attributes
        var modal = $(this);
        modal.find('#detailact ').text(detailinfo);
    })
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
    if(flag=='0'||flag=='1')
    {
        this.dialogtest("警告","更新失败","static/image/error.svg")
    }
    else if (flag=='2')
    {
        this.dialogtest("成功","更新成功","static/image/success.svg")
    }
    function readprogress(index,activityid,id,proid){
        let mode=document.getElementById("formControlRange"+index).value;
        //进度提交
        let modeform=document.createElement("form");
        modeform.method="post";
        modeform.action="${pageContext.request.contextPath}/updatemodeProgress";
        let inputactivityid=document.createElement("input");
        inputactivityid.setAttribute("name","activityid");
        inputactivityid.setAttribute("value",activityid);
        let inputstudentid=document.createElement("input");
        inputstudentid.setAttribute("name","studentid");
        inputstudentid.setAttribute("value",id);
        let inputmode=document.createElement("input");
        inputmode.setAttribute("name","mode");
        inputmode.setAttribute("value",mode);
        let inputproid=document.createElement("input");
        inputproid.setAttribute("name","proid");
        inputproid.setAttribute("value",proid);
        modeform.appendChild(inputproid);
        modeform.appendChild(inputstudentid);
        modeform.appendChild(inputactivityid);
        modeform.appendChild(inputmode);
        document.body.appendChild(modeform);
         modeform.submit();
        document.body.removeChild(modeform);
    }
    function customWayPoint(className, addClassName, customOffset) {
        var waypoints = $(className).waypoint({
            handler: function(direction) {
                if (direction == "down") {
                    $(className).addClass(addClassName);
                } else {
                    $(className).removeClass(addClassName);
                }
            },
            offset: customOffset
        });
    }

    var defaultOffset = '50%';
    let numstr='${fn:length(requestScope.passprogress)}';
    let num=eval(numstr);
    for (i = 0; i < num; i++) {
        customWayPoint('.timeline__item--' + i, 'timeline__item-bg', defaultOffset);
    }
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

<style>
    .app-container {
        height: 90%;
        overflow: auto;
        margin: 0;
    }

    @import url('https://fonts.googleapis.com/css?family=Nunito:300,400,700');

    /* _variables.css */

    /* _mixins.css */

    /* _global.css */
    * {
        box-sizing: border-box;
    }

    body {
        font-family: 'Nunito', sans-serif;
        background-color: #f3f1f1;
    }

    img {
        max-width: 100%;
        height: auto;
    }

    /* _site-header.css */
    .site-header {
        text-align: center;
        padding: 40px 0;

    }
    .site-header__title {
        font-size: 36px;
        color: #fff;
    }

    /* _wrapper.css */
    .wrapper {
        padding-left: 18px;
        padding-right: 18px;
        max-width: 1236px;
        margin-left: auto;
        margin-right: auto;
    }


    /* _timeline.css */
    .timeline {
        position: relative;
        margin: 30px auto;
        padding: 60px 0;

    }
    .timeline::before {
        content: "";
        position: absolute;
        top: 0;
        left: 10%;
        width: 4px;
        height: 100%;
        background-color: #8d94b1;
    }
    @media (min-width: 800px){
        .timeline::before{
            left: 50%;
            margin-left: -2px;
        }
    }
    .timeline__item {
        margin-bottom: 100px;
        position: relative;
    }
    .timeline__item::after{
        content: "";
        clear: both;
        display: table;
    }
    .timeline__item:nth-child(2n) .timeline__item__content {
        float: right;
    }
    .timeline__item:nth-child(2n) .timeline__item__content::before {
        content: '';
        right: 40%;
    }
    @media (min-width: 800px){
        .timeline__item:nth-child(2n) .timeline__item__content::before{
            left: inherit;
        }
    }
    .timeline__item:nth-child(2n) .timeline__item__content__date {
        background-color: #b292c5;
    }
    .timeline__item:nth-child(2n) .timeline__item__content__description {
        color: #b292c5;
    }
    .timeline__item:last-child {
        margin-bottom: 0;
    }
    .timeline__item-bg {
        -webkit-transition: all 1s ease-out;
        transition: all 1s ease-out;
        color: #fff;
    }
    .timeline__item-bg:nth-child(2n) .timeline__item__station {
        background-color: #7646b5;
    }
    .timeline__item-bg:nth-child(2n) .timeline__item__content {
        background-color: #7646b5;
    }
    .timeline__item-bg:nth-child(2n) .timeline__item__content::before {
        background-color: #b292c5;
    }
    .timeline__item-bg:nth-child(2n) .timeline__item__content__description {
        color: #fff;
    }
    .timeline__item-bg .timeline__item__station {
        background-color: #0072e8;
    }
    .timeline__item-bg .timeline__item__content {
        background-color: #0072e8;
    }
    .timeline__item-bg .timeline__item__content::before {
        background-color: #65adb7;
    }
    .timeline__item-bg .timeline__item__content__description {
        color: #fff;
    }
    .timeline__item__station {
        background-color: #9aa0b9;
        width: 40px;
        height: 40px;
        position: absolute;
        border-radius: 50%;
        padding: 10px;
        top: 0;
        left: 10%;
        margin-left: -33px;
        border: 4px solid #8d94b1;
        -webkit-transition: all .3s ease-out;
        transition: all .3s ease-out;
    }
    @media (min-width: 800px){
        .timeline__item__station{
            left: 50%;
            margin-left: -30px;
            width: 60px;
            height: 60px;
            padding: 15px;
            border-width: 6px;
        }
    }
    .timeline__item__content {
        width: 80%;
        background: #fff;
        padding: 20px 30px;
        border-radius: 6px;
        float: right;
        -webkit-transition: all .3s ease-out;
        transition: all .3s ease-out;
    }
    @media (min-width: 800px){
        .timeline__item__content{
            width: 40%;
            float: inherit;
            padding: 30px 40px;
        }
    }
    .timeline__item__content::before {
        content: '';
        position: absolute;
        left: 10%;
        background: #8d94b1;
        top: 20px;
        width: 10%;
        height: 4px;
        z-index: -1;
        -webkit-transition: all .3s ease-out;
        transition: all .3s ease-out;
    }
    @media (min-width: 800px){
        .timeline__item__content::before{
            left: 40%;
            top: 30px;
            height: 4px;
            margin-top: -2px;
        }
    }
    .timeline__item__content__date {
        margin: 0;
        padding: 8px 12px;
        font-size: 15px;
        margin-bottom: 10px;
        background-color: #65adb7;
        color: #fff;
        display: inline-block;
        border-radius: 4px;
        border: 2px solid #fff;
    }
    .timeline__item__content__description {
        margin: 0;
        padding: 0;
        font-size: 16px;
        line-height: 24px;
        font-weight: 300;
        color: #65adb7;
    }
    @media (min-width: 800px){
        .timeline__item__content__description{
            font-size: 19px;
            line-height: 28px;
        }
    }

    /* _site-footer.css */
    .site-footer {
        padding: 50px 0 200px 0;

    }
    .site-footer__text {
        color: #e6e6e6;
        font-size: 14px;
        text-align: center;
    }
    .site-footer__text__link {
        color: #8287a9;
    }
</style>
</body>
</html>
