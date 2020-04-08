<%--
  Created by IntelliJ IDEA.
  User: 50692
  Date: 2020/1/21
  Time: 13:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>修改APP版本信息</title>
    <title>条件查询</title>
    <!--jquery导入-->
    <script type="text/javascript" src="../statics/js/jquery-3.4.1.min.js"></script>
    <!--jquery导入 结束-->
    <!--layui引入-->
    <link rel="stylesheet" href="../statics/layui/css/layui.css">
    <script src="../statics/layui/layui.js"></script>
    <!--layui引入 结束-->
</head>
<body>
<h1>APP历史版本信息</h1>
<hr/>
<form id="form2">
    <input type="hidden" name="appid" value="${appid1}">
    <input type="hidden" name="page" id="page" value="1">
    <input type="hidden" name="pageSize" id="pageSize" value="3">
</form>
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
<h1>修改当前版本信息</h1>
<hr/>
<form>
    修改APP的应用版本<select name="select1" id="select1" onchange="versionBind()"></select>
</form>
<%--获取当前的版本号,版本大小,发布状态,版本介绍,apk文件路径--%>
<form class="layui-form" action="/UpdateVer" method="post">
    <div class="layui-form-item">
        <label class="layui-form-label">版本号*</label>
        <div class="layui-input-inline">
            <input type="text" name="versionno" required  lay-verify="required" autocomplete="off" class="layui-input" value="${oneVersion.versionno}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">版本大小*</label>
        <div class="layui-input-inline">
            <input type="text" name="versionsize" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${oneVersion.versionsize}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">发布状态*</label>
        <div class="layui-input-inline">
            <input type="text" name="" value="${oneVersion.v_publishstatus}" style="border: 0px none" readonly="readonly">
            <input type="hidden" name="publishstatus" value="${oneVersion.publishstatus}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">版本介绍*</label>
        <div class="layui-input-inline">
            <textarea name="versioninfo" required lay-verify="required"  class="layui-textarea">${oneVersion.versioninfo}</textarea>
        </div>
    </div>
    <div class="layui-form-item" id="fileUp">
        <label class="layui-form-label">apk文件*</label>
        <div class="layui-input-inline">
            <button type="button" class="layui-btn" id="upLoad">
                <i class="layui-icon">&#xe67c;</i>上传文件
            </button>
            <input type='text' value="" name='apkfilename' id='apkfilename' style="border: 0px">
            <input type='hidden' value="${oneVersion.downloadlink}" name='downloadlink' id='downloadlink'>
            <input type='hidden' value="${oneVersion.downloadlink}" name='old' id='old'>
        </div>
    </div>
    <input type="hidden" name="id" value="${oneVersion.id}">

    <div>
        <button class="layui-btn" lay-submit >修改</button>
        <a href="/user/SelectInfo.jsp" class="layui-btn">返回</a>
    </div>
</form>
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
    //文件上传模块
    layui.use('upload', function(){
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: '#upLoad' //绑定元素
            ,url: '/upLoadAPK' //上传接口
            ,accept:'file'
            ,done: function(res){
                <!--下载地址-->
                $("#downloadlink").val(res.data.src);
                <!--APK名称-->
                $("#apkfilename").val(res.data.fileName);
            }
            ,error: function(){
                alert("上传失败")  //请求异常回调
            }
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
        $.post("/selectHistoryVer",form,function(data){
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
            //app版本绑定
            for(var i=0;i<data.list.length;i++)
            {
                var option="<option value="+data.list[i].id+">"+data.list[i].versionno+"</option>"
                $("#select1").append(option);
                layui.form.render("select");//菜单渲染 把内容加载进去
            }
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
    //绑定版本
    function versionBind()
    {
       var num= $("#select1").val();
        alert(num);
        $.post("/versionBind","id=${appid1}&select1="+num,function(data){
            alert("修改完毕")
        })
    }
</script>
</body>
</html>
