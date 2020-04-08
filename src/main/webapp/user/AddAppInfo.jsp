<%--
  Created by IntelliJ IDEA.
  User: 50692
  Date: 2020/2/6
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加APP基本信息</title>
    <!--jquery导入-->
    <script type="text/javascript" src="../statics/js/jquery-3.4.1.min.js"></script>
    <!--jquery导入 结束-->
    <!--layui引入-->
    <link rel="stylesheet" href="../statics/layui/css/layui.css">
    <script src="../statics/layui/layui.js"></script>
    <!--layui引入 结束-->
</head>
<body>
<form class="layui-form" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">软件名称*</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="请输入软件名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">APK名称*</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="请输入apk名称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">支持ROM*</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="请输入支持的ROM" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">界面语言*</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="请输入界面语言" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">软件大小*</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="请输入软件大小" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">下载次数*</label>
        <div class="layui-input-block">
            <input type="text" name="title" required  lay-verify="required" placeholder="请输入下载次数" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">所属平台*</label>
        <div class="layui-input-inline">
            <select name="flatformId" id="flatformId" lay-verify="" lay-search>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">一级分类</label>
        <div class="layui-input-inline">
            <select name="categoryLevel1" id="categoryLevel1" lay-verify="" lay-search onchange="oneGoTwo()" lay-filter="one">
                <option value="" selected>请选择</option>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">二级分类</label>
        <div class="layui-input-inline">
            <select name="categoryLevel2" id="categoryLevel2" lay-verify="" lay-search onchange="twoGoThree()" lay-filter="two">

            </select>
        </div>
    </div>
        <div class="layui-form-item">
        <label class="layui-form-label">三级分类</label>
        <div class="layui-input-inline">
            <select name="categoryLevel3" id="categoryLevel3" lay-verify="" lay-search lay-filter="three">

            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">App状态*</label>
        <div class="layui-input-inline">
            <input type="text" name="title" required  lay-verify="required" value="待审核(不可修改)" autocomplete="off" class="layui-input" readonly="readonly">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">应用简介*</label>
        <div class="layui-input-block">
            <textarea name="" required lay-verify="required" placeholder="请输入" class="layui-textarea"></textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">App状态*</label>
        <div class="layui-input-inline">
            文件上传日后再说
        </div>
    </div>
    <button type="button" class="layui-btn">提交</button>
    <a href="/user/SelectInfo.jsp" class="layui-btn">返回</a>
</form>

<script>
    //Demo
    layui.use('form', function(){
        var form = layui.form;

        //监听提交
        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));
            return false;
        });
    });
</script>
</body>
</html>
<script>
    $(function () {
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
</script>
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
<!--layui模块加载 end-->