<%--
  Created by IntelliJ IDEA.
  User: 27317
  Date: 2021/12/21
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>社会实践管理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <link rel="stylesheet" href="static/dist/css/bootstrap.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/echarts@5.2.2/dist/echarts.min.js"></script>
    <script src="static/dist/js/jquery-3.6.0.min.js"></script>
    <script src="static/dist/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
    <link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />
    <script src="static/dist/js/toast.min.js"></script>
    <link rel="stylesheet" href="static/dist/css/toast.min.css">
</head>
<body>
<jsp:include page="managehead.jsp" />
<input id="fullactivity" name="fullactivity" type="hidden" value="${fn:length(requestScope.fullactivity)}" />
<input id="notfullactivity" name="notfullactivity" type="hidden" value="${fn:length(requestScope.notfullactivity)}" />
<c:if test="${(fn:length(requestScope.fullactivity))+(fn:length(requestScope.notfullactivity))==0}">
    啊嘞，还没有社会实践发布！
</c:if>
<c:if test="${(fn:length(requestScope.fullactivity))+(fn:length(requestScope.notfullactivity))!=0}">
<div class="row">
    <div class="col-1">
        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
            <a class="nav-link active" id="v-pills-home-tab" data-toggle="pill" href="#v-pills-home" role="tab" aria-controls="v-pills-home" aria-selected="true">实践统计</a>
            <a class="nav-link" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">实践信息</a>
            <a class="nav-link" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">实践修改</a>
            <a class="nav-link" id="v-pills-settings-tab" data-toggle="pill" href="#v-pills-settings" role="tab" aria-controls="v-pills-settings" aria-selected="false">实践删除</a>
        </div>
    </div>
    <div class="col-11">
        <div class="tab-content" id="v-pills-tabContent">
            <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">
                <div id="activitypersons" style="width: 30vw;height: 30vw;float: right;margin-top: 2vw"></div>
                <div id="activityfullis" style="width: 30vw;height: 30vw;"></div>
                <h5>共计${(fn:length(requestScope.fullactivity))+(fn:length(requestScope.notfullactivity))}个社会实践活动</h5>
            </div>
            <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">活动序号</th>
                        <th scope="col">活动id</th>
                        <th scope="col">活动名称</th>
                        <th scope="col">活动详情</th>
                        <th scope="col">开始时间</th>
                        <th scope="col">结束时间</th>
                        <th scope="col">参与人数</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.activityuser}" varStatus="activitystatus" var="activity">
                    <tr>
                        <th scope="row">${activitystatus.index+1}</th>
                        <td>${activity.activityid}</td>
                        <td>${activity.activitytitle}</td>
                        <td data-toggle="modal" data-target="#detailModal" data-whatever="${activity.activitydetail}" data-title="${activity.activitytitle}">点击查看详情</td>
                        <td>${activity.starttime}</td>
                        <td>${activity.endtime}</td>
                        <td>${activity.counts}</td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <div class="modal fade" id="detailModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-scrollable modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title text-center" id="detailModalLabel"></h5>
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
            </div>
            <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">
                <h5>请务必输入活动id,在想改写的内容中填写修改内容！</h5>
                <div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="activityid" class="float-left">活动id</label>
                            <input type="text" class="form-control" id="activityid" name="activityid">
                        </div>
                    </div>
                    <div class="form-inline">
                        <div class="form-row">
                            <div class="form-group mb-2">
                                <select class="custom-select mr-sm-2" id="inputactivityselect" name="property">
                                    <option  value="activitytitle">活动名称</option>
                                    <option value="activitydetail">活动详情</option>
                                    <option value="persons">所需人数</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea type="text" class="form-control" id="activityinfo" name="activityinfo" placeholder="1234 Main St" row="4" ></textarea>
                    </div>
                    <div class="form-group" >
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label class="float-left">开始时间</label>
                                <input type="text" class="form-control"  name="starttime" id="inputstarttime">
                            </div>
                            <div class="form-group col-md-6">
                                <label class="float-left">结束时间</label>
                                <input type="text" class="form-control" id="inputendtime"  name="endtime">
                            </div>
                        </div>
                    </div>
                    <a role="button" class="btn btn-primary mb-2" href="javascript:dopostupdateActivity()">修改</a>
                </div>
            </div>
            <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">
                <form action="${pageContext.request.contextPath}/deleteactivityByManage" method="post">
                <div class="form-group row" style="margin-top: 5vh;">
                    <label for="inputactivity-id" class="col-sm-2 col-form-label">活动id</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="inputactivity-id" name="activityid" required/>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary mb-2">删除</button>
            </form>
            </div>
        </div>
    </div>
</div>
</c:if>
<jsp:include page="foot.jsp" />
<script type="text/javascript">
    $('#inputstarttime').datepicker({format: 'yyyy-mm-dd'});
    $('#inputendtime').datepicker({format: 'yyyy-mm-dd'});
    $('#detailModal').on('show.bs.modal', function (event) {
        let button = $(event.relatedTarget) // Button that triggered the modal
        let detailactivity = button.data('whatever');
        let activitytitle=button.data("title");
        var modal = $(this);
        modal.find('#detailModalLabel').text(activitytitle);
        modal.find('#detailact').text(detailactivity);
    });
    //这里写到了人数满不满
    var dom = document.getElementById("activityfullis");
    var dom1=document.getElementById("activitypersons");
    var myChart = echarts.init(dom);
    var mychart= echarts.init(dom1);
    let fullactivitylength=document.getElementById("fullactivity").value;
    let notfullactivitylength=document.getElementById("notfullactivity").value;
    let s='${requestScope.activityinusers}';
    let activitydata=eval(s);
    var app = {};
    //柱状图
    var option;
    option = {
        xAxis: {
            type: 'category',
            data: ['已满的社会实践', '未满的社会实践']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                data: [fullactivitylength, notfullactivitylength],
                type: 'bar'
            }
        ]
    };

    if (option && typeof option === 'object') {
        myChart.setOption(option);
    }
    //饼状图
    var option1;
    option1 = {
        tooltip: {
            trigger: 'item'
        },
        legend: {
            top: '5%',
            left: 'center'
        },
        series: [
            {
                name: 'Access From',
                type: 'pie',
                radius: ['40%', '70%'],
                avoidLabelOverlap: false,
                itemStyle: {
                    borderRadius: 10,
                    borderColor: '#fff',
                    borderWidth: 2
                },
                label: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: '40',
                        fontWeight: 'bold'
                    }
                },
                labelLine: {
                    show: false
                },
                data: activitydata
            }
        ]
    };

    if (option1 && typeof option1 === 'object') {
        mychart.setOption(option1);
    }
    function dopostupdateActivity() {
        let activityid=document.getElementById("activityid").value;
        if(!activityid.trim())
        {
            alert("活动id不能为空");

        }
        else{
            let name=document.getElementById("inputactivityselect").value;
            let info=document.getElementById("activityinfo").value;
            let starttime=document.getElementById("inputstarttime").value;
            let endtime=document.getElementById("inputendtime").value;
            let useform=document.createElement("form");
            useform.method="post";
            useform.action="${pageContext.request.contextPath}/updateactivitybymanage";
            let idinput=document.createElement("input");
            idinput.setAttribute("name","activityid");
            idinput.setAttribute("value",activityid);
            let nameinput=document.createElement("input");
            nameinput.setAttribute("name",name);
            nameinput.setAttribute("value",info);
            if(starttime.trim())
            {
                let sttime=document.createElement('input');
                sttime.setAttribute("name","starttime");
                sttime.setAttribute("value",starttime);
                useform.appendChild(sttime);
            }
            if(endtime.trim())
            {
                let edtime=document.createElement('input');
                edtime.setAttribute("name","endtime");
                edtime.setAttribute("value",endtime);
                useform.appendChild(edtime);
            }
            useform.appendChild(idinput);
            useform.appendChild(nameinput);
            document.body.appendChild(useform);
            useform.submit();
            document.body.removeChild(useform);
        }
    }
    //弹窗
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
    else if(flag=='2')
    {
        this.dialogtest("错误","删除失败","static/image/error.svg")
    }
    else if(flag=='3')
    {
        this.dialogtest("成功","删除成功","static/image/success.svg")
    }
    else if(flag=='4')
    {
        this.dialogtest("错误","未找到该活动！","static/image/error.svg")
    }
</script>
</body>
</html>
