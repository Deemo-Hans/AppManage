<%--
  Created by IntelliJ IDEA.
  User: 50692
  Date: 2020/1/13
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>条件查询</title>
    <!--jquery导入-->
    <script type="text/javascript" src="../statics/js/jquery-3.4.1.min.js"></script>
    <!--jquery导入 结束-->
    <!--layui引入-->
    <link rel="stylesheet" href="../statics/layui/css/layui.css">
    <script src="../statics/layui/layui.js"></script>
    <!--layui引入 结束-->
</head>
<body style="padding-bottom: 30px">
<%--静态表单条件区域--%>
<form class="layui-form" action="/selectManageMain" id="form1">
<%--    第一行--%>
    <div class="layui-form-item">
    <label class="layui-form-label">软件名称</label>
    <div class="layui-input-inline">
        <input type="text" name="softwareName" id="softwareName"  placeholder="请输入标题" autocomplete="off" class="layui-input">
    </div>
        <label class="layui-form-label">APP状态</label>
        <div class="layui-input-inline">
            <select name="status" id="status" lay-verify="" lay-search>
            </select>
        </div>
        <label class="layui-form-label">所属平台</label>
        <div class="layui-input-inline">
            <select name="flatformId" id="flatformId" lay-verify="" lay-search>
            </select>
        </div>
    </div>
<%--    第二行--%>
    <div class="layui-form-item">
    <label class="layui-form-label">一级分类</label>
    <div class="layui-input-inline">
        <select name="categoryLevel1" id="categoryLevel1" lay-verify="" lay-search onchange="oneGoTwo()" lay-filter="one">
            <option value="" selected>请选择</option>
        </select>
    </div>
    <label class="layui-form-label">二级分类</label>
    <div class="layui-input-inline">
        <select name="categoryLevel2" id="categoryLevel2" lay-verify="" lay-search onchange="twoGoThree()" lay-filter="two">

        </select>
    </div>
    <label class="layui-form-label">三级分类</label>
    <div class="layui-input-inline">
        <select name="categoryLevel3" id="categoryLevel3" lay-verify="" lay-search lay-filter="three">

        </select>
    </div>
</div>
    <div class="layui-form-item" >
        <div class="layui-input-block">
            <button type="button" class="layui-btn" id="submin" onclick="selectInfo()">查询</button>
            <button type="reset" class="layui-btn layui-btn-primary">清空</button>
        </div>
    </div>
    <input type="hidden" name="page" id="page" value="1">
    <input type="hidden" name="pageSize" id="pageSize" value="10">
</form>
<div style="margin-left: 50px;">
    <button type="button" class="layui-btn">新增app基本信息</button>
</div>
<%--表格--%>
<div>
    <table class="layui-table" id="table1">

    </table>
</div>
<div id="pagei" style="text-align: center">
    <button type="button" class="layui-btn" onclick="firstPage()">首页</button>
    <button type="button" class="layui-btn" onclick="prePage()">上一页</button>
    <span id="pagen"></span>
    <button type="button" class="layui-btn" onclick="nextPage()">下一页</button>
    <button type="button" class="layui-btn" onclick="lastPage()">尾页</button>
</div>
</body>
</html>
<!--layui模块加载-->
<script>
    //Demo
    layui.use('form', function(){

        var form = layui.form;
        form.render()
        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
        //监听select动态获取下拉框联动
        form.on('select(one)', function(data){
            if(document.getElementById("categoryLevel1").value=="")
            {$("#categoryLevel2").html("<option value='' selected >请选择</option>")
                layui.form.render("select")}
            else{
            var parentId=data.value;
            $.post("/selectLink","parentId="+parentId,function(bata){
                $("#categoryLevel2").html("<option value='' selected >请选择</option>")
                for (var i=0;i<bata.length;i++)
                {
                    var option="<option value="+bata[i].id+">"+bata[i].categoryname+"</option>";
                    $("#categoryLevel2").append(option);
                }
                layui.form.render("select");//菜单渲染 把内容加载进去
            },"json")}
            if(document.getElementById("categoryLevel1").value=="")
            {$("#categoryLevel3").html("<option value='' selected >请选择</option>")
                layui.form.render("select")}
        });
        form.on('select(two)', function(data){
            if(document.getElementById("categoryLevel1").value==""||document.getElementById("categoryLevel2").value=="")
            {$("#categoryLevel3").html("<option value='' selected >请选择</option>")
                layui.form.render("select")}
            else{
            var parentId=data.value;
            $.post("/selectLink","parentId="+parentId,function(bata){
                $("#categoryLevel3").html("<option value='' selected >请选择</option>")
                for (var i=0;i<bata.length;i++)
                {
                    var option="<option value="+bata[i].id+">"+bata[i].categoryname+"</option>";
                    $("#categoryLevel3").append(option);
                }
                layui.form.render("select");//菜单渲染 把内容加载进去
            },"json")}
        });
        //监听select动态获取下拉框联动 结束
    });
</script>
<!--layui模块加载 结束-->
<!--自定义js-->
<script>
    //自动加载
$(function () {
    //加载表格首页
    selectInfo();
    //加载一级下拉框
    $.post("/selectLink",null,function(bata){
        $("#categoryLevel1").html("<option value=''>请选择</option>")
        for (var i=0;i<bata.length;i++)
        {
            var option="<option value="+bata[i].id+">"+bata[i].categoryname+"</option>";
            $("#categoryLevel1").append(option);
        }
        layui.form.render("select");//菜单渲染 把内容加载进去
    },"json")
    //平台下拉框
    $.post("/selectFlatform",null,function(bata){
        $("#flatformId").html("<option value=''>请选择</option>")
        for (var i=0;i<bata.length;i++)
        {
            var option="<option value="+bata[i].valueid+">"+bata[i].valuename+"</option>";
            $("#flatformId").append(option);
        }
        layui.form.render("select");//菜单渲染 把内容加载进去
    },"json");
    //状态下拉框
    $.post("/selectStatus",null,function(bata){
        $("#status").html("<option value=''>请选择</option>")
        for (var i=0;i<bata.length;i++)
        {
            var option="<option value="+bata[i].valueid+">"+bata[i].valuename+"</option>";
            $("#status").append(option);
        }
        layui.form.render("select");//菜单渲染 把内容加载进去
    },"json")
});
    //手动调用
    //获取pageinfo
    function getPageInfo()
    {
        var getPageInfo=new Object();
        var form=$("#form1").serialize();
        $.ajaxSettings.async = false;//同步ajax请求
        $.post("/selectManageMain",form,function(data){
         getPageInfo=data;
        },"json");
        $.ajaxSettings.async = true;//恢复异步ajax请求
        return getPageInfo;
    }
    //查询
    function selectInfo()
    {
        var form=$("#form1").serialize();
        $.post("/selectManageMain",form,function(data){
            $("#table1").html("<tr><td>软件名称</td><td>APK名称</td><td>软件大小</td><td>所属平台</td><td>所属分类</td><td>状态</td>" +
                "<td>下载次数</td><td>最新版本号</td><td>操作</td></tr>");
                for (var i=0;i<data.list.length;i++)
                 {
                     var table="<tr><td>"+data.list[i].softwarename+"</td>+" +
                         "<td>"+data.list[i].apkname+"</td>"+
                         "<td>"+data.list[i].softwaresize+"M</td>" +
                         "<td>"+data.list[i].v_flatformId+"</td>" +
                         "<td>"+data.list[i].v_categoryLevel1+"->"+data.list[i].v_categoryLevel2+"->"+data.list[i].v_categoryLevel3+"</td>" +
                         "<td>"+data.list[i].v_status+"</td>" +
                         "<td>"+data.list[i].softwaresize+"</td>" +
                         "<td>"+data.list[i].v_versionid+"</td>"+
                         "<td><div id='review'>" +
                         "<div style='text-align: center'>" +
                         "<button type='button' class=\"layui-btn layui-btn-primary\" onclick='button1(this)' style='width: 150px'>点击操作<i class='layui-icon layui-icon-triangle-d'></i></button>" +                         "<ul style='display: none'>" +
                         "<li><a style='width: 150px' class=\"layui-btn layui-btn-normal\" onclick=updateStatus("+data.list[i].id+",4)>APP上架</a></li>" +
                         "<li><a style='width: 150px' class=\"layui-btn layui-btn-normal\" onclick=updateStatus("+data.list[i].id+",5)>APP下架</a></li>" +
                         "<li><a style='width: 150px;' class=\"layui-btn layui-btn-normal\" onclick=\"javascript:if (confirm('是否删除?')){delApp("+data.list[i].id+")}\">删除APP</a></li>" +
                         "<li><a style='width: 150px;' class=\"layui-btn layui-btn-normal\" onclick=selectOne("+data.list[i].id+")>查看APP基本信息</a></li>" +
                         "<li><a style='width: 150px;' class=\"layui-btn layui-btn-normal\" >修改APP基本信息</a></li>" +
                         "<li><a style='width: 150px;' class=\"layui-btn layui-btn-normal\" onclick=addAppVer("+data.list[i].id+",1,3)>新增APP版本信息</a></li>" +
                         "<li><a style='width: 150px;'  class=\"layui-btn layui-btn-normal\" onclick=selectUpdateVer("+data.list[i].id+",1,3)>修改APP版本信息</a></li>" +
                         "</ul></div></div></td></tr>"
                     $("#table1").append(table) ;
                     $("#pagen").html("第"+data.pageNum+"页/共"+data.pages+"页")
                 }
        },"json");
    }
    //首页
    function firstPage() {
        var getPageInfo1=getPageInfo();
        $("#page").val(getPageInfo1.firstPage);
        selectInfo();
    }
    //尾页
    function lastPage() {
        var getPageInfo1=getPageInfo();
        $("#page").val(getPageInfo1.lastPage);
        selectInfo();
    }
    //上一页
    function prePage() {
        var getPageInfo1=getPageInfo();
        $("#page").val(getPageInfo1.prePage==0?1:getPageInfo1.prePage);
        selectInfo();
    }
    //下一页
    function  nextPage() {
        var getPageInfo1=getPageInfo();
        $("#page").val(getPageInfo1.nextPage==0?1:getPageInfo1.nextPage);
        selectInfo();
    }
    //控制操作按钮
    function button1(a)
    {
        $(a).next("ul").slideToggle(1);
    }
    //删除
    function delApp(id)
    {
        $.post("/delApp","id="+id,function (data) {
        },"json")
        //location.href="/updateStatus?id="+id+"&status="+snum;
        selectInfo()
    }
    //审核状态修改
    function updateStatus(id,snum)
    {
        $.post("/updateStatus","id="+id+"&status="+snum,function (data) {
        },"json")
        //location.href="/updateStatus?id="+id+"&status="+snum;
        selectInfo()
    }
    //查单条
    function selectOne(id)
    {
        location.href="/selectOne?id="+id;
    }
    //修改APP版本信息
   function selectUpdateVer(appid,page,pageSize) {
       location.href="/selectUpdateVer?appid="+appid+"&page="+page+"&pageSize="+pageSize;
   }
    //添加APP版本信息
    function addAppVer(appid,page,pageSize) {
        location.href="/user/AddAppVer.jsp?appid="+appid+"&page="+page+"&pageSize="+pageSize;
    }
</script>