<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@page import="com.admin.service.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.admin.domain.Fruit" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>果然新鲜后台</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <style type="text/css">
        .update a{
            color: #007DDB;
            text-decoration: none;
        }
    </style>

</head>
<body class="layui-layout-body">
<%
    if(session.getAttribute("admin") == null)
        response.sendRedirect("login.jsp");
%>
<%
    FruitInfo info = new FruitInfo();
    List<Fruit> fruits = info.findAllFruit();
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
                <li class="layui-nav-item"><a class="layui-this" href="index.jsp">商品信息</a></li>
                <li class="layui-nav-item"><a href="add.jsp">添加商品</a></li>
                <li class="layui-nav-item"><a href="index.jsp">修改商品</a></li>
                <li class="layui-nav-item"><a href="delete.jsp">删除商品</a></li>
                <li class="layui-nav-item"><a href="../bgfruit/salesTotal.do">商品销量</a></li>
                <li class="layui-nav-item"><a href="../bgfruit/salesPercent.do">商品营业额</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <fieldset class="layui-elem-field">
                <legend>商品信息</legend>
                <div class="layui-field-box">
                    <table class="layui-table">
                        <colgroup>
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                            <col width="100">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>商品号</th>
                            <th>商品名称</th>
                            <th>商品进价</th>
                            <th>商品售价</th>
                            <th>商品数量</th>
                            <th>商品状态</th>
                            <th>商品分类</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            for (Fruit fruit : fruits) {
                        %>
                        <tr>
                            <td><%=fruit.getId()%>
                            </td>
                            <td><%=fruit.getName()%>
                            </td>
                            <td><%=fruit.getPurchase()%>
                            </td>
                            <td><%=fruit.getSell()%>
                            </td>
                            <td><%=fruit.getQuantity()%>
                            </td>
                            <td><%=fruit.getStatus()%>
                            </td>
                            <td><%=fruit.getKind()%>
                            </td>
                            <td class="update"><a href="../bgfruit/update.do?id=<%=fruit.getId()%>"> 更新</a> </td>
                        </tr>
                        <%
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </fieldset>
        </div>
    </div>
</div>

<script type="text/javascript" src="./javascript/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./javascript/index.js"></script>
</body>
</html>
