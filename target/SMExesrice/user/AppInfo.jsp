<%--
  Created by IntelliJ IDEA.
  User: 50692
  Date: 2020/1/20
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>APP信息查询</title>
    <!--layui引入-->
    <link rel="stylesheet" href="../statics/layui/css/layui.css">
    <script src="../statics/layui/layui.js"></script>
    <!--layui引入 结束-->
    <!--jquery导入-->
    <script type="text/javascript" src="../statics/js/jquery-3.4.1.min.js"></script>
    <!--jquery导入 结束-->
</head>
<body>
<h1>APP基础信息</h1>
<hr/>
<form class="layui-form" action="#" id="form1">
    <div>
    <div class="layui-form-item">
        <label class="layui-form-label">软件名称*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.softwarename}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">APK名称*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.apkname}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">支持ROM*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.supportrom}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">界面语言*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.interfacelanguage}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">软件大小*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.softwaresize}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">下载次数*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.downloads}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label"> 所属平台*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.v_flatformId}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属分类*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.v_categoryLevel1}->${selectOne.v_categoryLevel2}->${selectOne.v_categoryLevel3}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">APP状态*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <input type="text" value="${selectOne.v_status}" readonly="readonly" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">应用简介*:</label>
        <div class="layui-input-inline" style="width: 30%">
            <textarea readonly="readonly" class="layui-textarea" style="width: 300px">${selectOne.appinfo}</textarea>
        </div>
    </div>
        <div align="center">
        <a href="/user/SelectInfo.jsp" class="layui-btn">返回</a>
        </div>
    </div>
</form>
<form id="form2">
    <input type="hidden" name="appid" value="${selectOne.id}">
<input type="hidden" name="page" id="page" value="1">
<input type="hidden" name="pageSize" id="pageSize" value="3">
</form>
<h1>APP历史版本信息</h1>
<hr/>
<div style="padding-bottom: 30px">
    <div>
    <table name="appVerInfo" id="appHistoryInfo" class="layui-table" ></table>
    </div>
    <div id="pagei" style="text-align: center">
        <button type="button" class="layui-btn" onclick="firstPage()">首页</button>
        <button type="button" class="layui-btn" onclick="prePage()">上一页</button>
        <span id="pagen"></span>
        <button type="button" class="layui-btn" onclick="nextPage()">下一页</button>
        <button type="button" class="layui-btn" onclick="lastPage()">尾页</button>
    </div>
</div>
</body>
</html>
<!--框架模板及监听-->
<script>
    //框架模板及监听
    layui.use('form', function(){
        var form = layui.form;
        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
<!--框架模板及监听 結束-->
<!--js部分-->
<script>
    $(function () {

        selectHistoryVer()
    })
    //查询APP历史版本信息
    function selectHistoryVer()
    {
        var form=$("#form2").serialize();
        $.post("/selectHistoryVer",form ,function(data){
            $("#appHistoryInfo").html(null);
            $("#appHistoryInfo").html("<tr><td>软件名称</td><td>版本号</td><td>版本大小</td><td>发布状态</td><td>APK文件下载</td><td>最新更新时间</td></tr>");
            for (var i=0;i<data.list.length;i++)
            {
                var date=new Date(data.list[i].creationdate);
                var year=date.getFullYear();//年
                var month=date.getMonth();//月
                var day=date.getDate();//日
                var table="<tr><td>"+data.list[i].v_softwareName+"</td>" +
                    "<td>"+data.list[i].versionno+"</td>"+
                    "<td>"+data.list[i].versionsize+"M</td>" +
                    "<td>"+data.list[i].v_publishstatus+"</td>" +
                    "<td><a>"+data.list[i].apkfilename+"<a></td>" +
                    "<td>"+year+"年"+month+"月"+day+"日</td></tr>"
                $("#appHistoryInfo").append(table) ;
                $("#pagen").html("第"+data.pageNum+"页/共"+data.pages+"页")
            }
            layui.table.render();
        },"json");
    }
    //获取pageinfo
    function getPageInfo()
    {
        var getPageInfo=new Object();
        var form=$("#form2").serialize();
        $.ajaxSettings.async = false;//同步ajax请求
        $.post("/selectHistoryVer",form,function(data){
            getPageInfo=data;
        },"json");
        $.ajaxSettings.async = true;//恢复异步ajax请求
        return getPageInfo;
    }
    //首页
    function firstPage() {
        var getPageInfo1=getPageInfo();
        $("#page").val(getPageInfo1.firstPage);
        selectHistoryVer();
    }
    //尾页
    function lastPage() {
        var getPageInfo1=getPageInfo();
        $("#page").val(getPageInfo1.lastPage);
        selectHistoryVer();
    }
    //上一页
    function prePage() {
        var getPageInfo1=getPageInfo();
        $("#page").val(getPageInfo1.prePage==0?1:getPageInfo1.prePage);
        selectHistoryVer();
    }
    //下一页
    function  nextPage() {
        var getPageInfo1=getPageInfo();
        $("#page").val(getPageInfo1.nextPage==0?1:getPageInfo1.nextPage);
        selectHistoryVer();
    }
</script>
