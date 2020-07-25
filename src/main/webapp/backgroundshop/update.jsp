<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>果然新鲜后台</title>
    <link rel="stylesheet" href="./layui/css/layui.css">

    <style type="text/css">
        .picfile {
            padding: 2px 10px;
            width: 28em;
            line-height: 150%;
            position: relative;
            cursor: pointer;
            color: #888;
            background: #fafafa;
            border: 1px solid #ddd;
            border-radius: 4px;
            overflow: hidden;
            display: inline-block;
            *display: inline;
            *zoom: 1
        }

        .picfile input {
            position: absolute;
            font-size: 24px;
            line-height: 150%;
            right: 0;
            top: 0;
            opacity: 0;
            filter: alpha(opacity=0);
            cursor: pointer
        }
    </style>

</head>

<body class="layui-layout-body">
<%
    if (session.getAttribute("admin") == null)
        response.sendRedirect("login.jsp");
%>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">果然新鲜后台</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="image/mypic.jpg" class="layui-nav-img">
                    ${admin}
                </a>

            </li>
            <li class="layui-nav-item"><a href="../admin/loginout.do">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item"><a href="index.jsp">商品信息</a></li>
                <li class="layui-nav-item"><a href="add.jsp">添加商品</a></li>
                <li class="layui-nav-item"><a class="layui-this" href="index.jsp">修改商品</a></li>
                <li class="layui-nav-item"><a href="delete.jsp">删除商品</a></li>
                <li class="layui-nav-item"><a href="../bgfruit/salesTotal.do">商品销量</a></li>
                <li class="layui-nav-item"><a href="../bgfruit/salesPercent.do">商品营业额</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-container">
        <div class="layui-row">
            <div class="layui-col-lg12">
                <fieldset class="layui-elem-field" style="margin: 2em 15em;">
                    <legend>修改商品</legend>
                    <div class="layui-field-box">
                        <form class="layui-form" enctype="multipart/form-data" action="../bgfruit/updateInfo.do"
                              method="post">
                            <div class="layui-form-item">
                                <label class="layui-form-label">商品号</label>
                                <div class="layui-input-block">
                                    <input type="text" name="id" placeholder="请输入标题" autocomplete="off" class="picfile"
                                           value="${fruit.id}" readonly/>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">商品名称</label>
                                <div class="layui-input-block">
                                    <input type="text" name="name" required lay-verify="required" placeholder="请输入商品名称"
                                           autocomplete="off" class="picfile" value="${fruit.name}">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">商品进价</label>
                                <div class="layui-input-block">
                                    <input type="text" name="purchase" required lay-verify="required"
                                           placeholder="请输入商品进价"
                                           autocomplete="off" class="picfile" value="${fruit.purchase}">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">商品售价</label>
                                <div class="layui-input-block">
                                    <input type="text" name="sell" required lay-verify="required" placeholder="请输入商品售价"
                                           autocomplete="off" class="picfile" value="${fruit.sell}">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">商品数量</label>
                                <div class="layui-input-block" style="width: 5em;">
                                    <input type="text" name="quantity" required lay-verify="required"
                                           placeholder="请输入商品数量"
                                           autocomplete="off" class="picfile" value="${fruit.quantity}">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">商品状态</label>
                                <div class="layui-input-block" style="width: 5em;">

                                    <select name="status">
                                        <option ${status[0]}>上架</option>
                                        <option ${status[1]}>下架</option>
                                    </select>
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <label class="layui-form-label">商品分类</label>
                                <div class="layui-input-block" style="width: 5em;">
                                    <select name="kind">
                                        <option ${kind[0]}>推荐</option>
                                        <option ${kind[1]}>热卖</option>
                                    </select>
                                </div>
                            </div>


                            <div class="layui-form-item" id="pic">
                                <label class="layui-form-label">商品图</label>
                                <div class="picfile" style="width: 4em;">
                                    <input type="file" accept=".png,.jpg" name="main_pic" onchange="pic(this,0)"/>上传主图
                                </div>

                                <div class="picfile" style="width: 3.6em;">
                                    <input type="file" accept=".png,.jpg" name="sub_pic" onchange="pic(this,1)"/>详情图1
                                </div>

                                <div class="picfile" style="width: 3.6em;">
                                    <input type="file" accept=".png,.jpg" name="sub_pic" onchange="pic(this,2)"/>详情图2
                                </div>
                                <div class="picfile" style="width: 3.6em;">
                                    <input type="file" accept=".png,.jpg" name="sub_pic" onchange="pic(this,3)"/>详情图3
                                </div>

                                <div id="imgcontainer" class="layui-input-block">
                                    <img id="img0" src="${pics[0]}" width="100px" height="100px">
                                    <img id="img1" src="${pics[1]}" height="100px">
                                    <img id="img2" src="${pics[2]}" height="100px">
                                    <img id="img3" src="${pics[3]}" height="100px">
                                </div>
                            </div>

                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button type="submit" class="layui-btn">立即提交</button>
                                    <button type="button" onclick="location.reload()"
                                            class="layui-btn layui-btn-primary">重置
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>

</div>

<script type="text/javascript">
    // ---------------- 使用createObjectURL获取图片url便且预览显示 ---------------

    // 选择图片后触发的方发
    function pic(obj, i) {
        if (obj.value === '') {
            return // 这里防止第二次选择图片时候点击取消出现报错
        }

        var pic = document.getElementById("img" + i);
        console.log(obj)

        var imgObject = obj.files[0]
        console.log(imgObject) // 输出了图片的信息
        // console.log(typeof imgObject) // 图片是个对象类型
        var showPicURL = getObjectURL(imgObject)

        // 设置显示预览

        pic.src = showPicURL;
    }

    // 获取图片URL的兼容写法
    function getObjectURL(file) {
        var url = null
        if (window.createObjectURL != undefined) { // 基础判断
            url = window.createObjectURL(file)

        } else if (window.URL != undefined) { // 判断 mozilla (firefox)
            url = window.URL.createObjectURL(file)

        } else if (window.webkitURL != undefined) { // 判断 webkit 和 chrome 浏览器
            url = window.webkitURL.createObjectURL(file)
        }

        return url // 返回获得的url
    }
</script>

<script type="text/javascript" src="./javascript/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./javascript/index.js"></script>
<script type="text/javascript" src="./javascript/dw_form_submit.js"></script>
</body>
</html>