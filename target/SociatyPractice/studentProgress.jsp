<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/18
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
    <title>学生进度信息</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="static/dist/js/toast.min.js"></script>
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
</head>
<body>
<jsp:include page="studenthead.jsp" />
<c:if test="${fn:length(requestScope.progressActivity)==0}">
你还没有参加社会实践活动。
</c:if>
<c:if test="${fn:length(requestScope.progressActivity)!=0}">
<div class="row">
    <div class="col-1">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">当前进度</a>
            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">进度填写</a>
        </div>
    </div>
    <div class="col-9">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <table class="table" id="emp1_table">
                    <thead>
                    <th>活动id</th>
                    <th>活动名称</th>
                    <th>进度</th>
                    <th>进度百分比</th>
                    </thead>
                    <tbody>
                   <c:forEach items="${requestScope.progressActivity}" var="proscore" varStatus="status">
                    <tr>
                        <td>${proscore.activityid}</td>
                        <td>${proscore.activitytitle}</td>
                        <td>
                            <div class="progress">
                            <div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" aria-valuenow="${proscore.mode}" aria-valuemin="0" aria-valuemax="100" style="width: ${proscore.mode}%"></div>
                        </div>
                        </td>
                        <td>${proscore.mode}%</td>
                    </tr>
                   </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">活动序号</th>
                        <th scope="col">活动名称</th>
                        <th scope="col">负责人</th>
                        <th scope="col">填写进度</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.hasactivity}" var="activity" varStatus="activitystatus">
                    <tr>
                        <th scope="row">${activitystatus.index+1}</th>
                        <td>${activity.activitytitle}</td>
                        <td>${activity.username}</td>
                        <td>
                            <button class="btn btn-primary" type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-activityid="${activity.activityid}" data-teacherid="${activity.staffid}">填写进度</button>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
    <form action="${pageContext.request.contextPath}/addprogressinfo" method="post">
        <div class="modal-dialog  modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">进度填写</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="activityid" id="activityid"/>
                    <input type="hidden" name="teacherid" id="teacherid"/>
                    <input type="hidden" name="protime" id="protime"/>
                    <input type="hidden" name="id" id="id" value="${sessionScope.user.id}"/>
                    <input type="hidden" name="isread" id="isread" value="0"/>
                    <div class="form-group">
                        <label >情况填写</label>
                        <textarea class="form-control" id="proinfo" name="proinfo" row="5" placeholder="今天你完成了什么"> </textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary" >提交</button>
                </div>
            </div>
        </div>
    </form>
</div>
</c:if>
<jsp:include page="foot.jsp" />
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
    Date.prototype.format = function(fmt) {
        var o = {
            "M+" : this.getMonth()+1,                 //月份
            "d+" : this.getDate(),                    //日
            "h+" : this.getHours(),                   //小时
            "m+" : this.getMinutes(),                 //分
            "s+" : this.getSeconds(),                 //秒
            "q+" : Math.floor((this.getMonth()+3)/3), //季度
            "S"  : this.getMilliseconds()             //毫秒
        };
        if(/(y+)/.test(fmt)) {
            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
        }
        for(var k in o) {
            if(new RegExp("("+ k +")").test(fmt)){
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
            }
        }
        return fmt;
    }
    $('#exampleModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget) // Button that triggered the modal
        let activityid=button.data("activityid");
        let teacherid=button.data("teacherid");
        var modal = $(this);
        let dat=new Date().format("yyyy-MM-dd hh:mm:ss");
        modal.find('#protime').val(dat);
        modal.find('#activityid').val(activityid);
        modal.find('#teacherid').val(teacherid);
    });
    let flag='${requestScope.flag}';
    if(flag=='0')
    {
        this.dialogtest("警告","更新失败","static/image/error.svg")
    }
    else if(flag=='1')
    {
        this.dialogtest("成功","更新成功","static/image/success.svg")
    }
</script>
</html>
