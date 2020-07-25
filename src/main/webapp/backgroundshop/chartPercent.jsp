<%@ page import="com.admin.domain.SalePercent" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <title>果然新鲜后台</title>
    <!-- 引入 echarts.js -->
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
</head>
<body>
<%
    if(session.getAttribute("admin") == null)
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
                <li class="layui-nav-item"><a href="index.jsp">修改商品</a></li>
                <li class="layui-nav-item"><a href="delete.jsp">删除商品</a></li>
                <li class="layui-nav-item"><a href="../bgfruit/salesTotal.do">商品销量</a></li>
                <li class="layui-nav-item"><a class="layui-this" href="../bgfruit/salesPercent.do">商品营业额</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div id="main" style="width: 80%;height:550px;margin-top: 2em;margin-left: 6em;"></div>
    </div>
</div>

<script type="text/javascript" src="./javascript/jquery.min.js"></script>
<script type="text/javascript" src="./layui/layui.js"></script>
<script type="text/javascript" src="./javascript/index.js"></script>
</body>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var chart = echarts.init(document.getElementById('main'));

    option = {
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b}: {c} ({d}%)'
        },
        legend: {
            orient: 'vertical',
            left: 10,
            data: [
                <%
                SalePercent[] salePercents = (SalePercent[]) session.getAttribute("salePercents");
                   for(SalePercent salePercent:salePercents){
                %>
                "<%=salePercent.getFruit_name()%>",
                <%}%>
            ]
        },
        series: [
            {
                name: '营业额',
                type: 'pie',
                radius: ['55%', '80%'],
                avoidLabelOverlap: false,
                label: {
                    show: false,
                    position: 'center'
                },
                emphasis: {
                    label: {
                        show: true,
                        fontSize: '30',
                        fontWeight: 'bold'
                    }
                },
                labelLine: {
                    show: false
                },
                data: [
                    <%
                    for(SalePercent salePercent:salePercents){
                    %>
                    {value: <%=salePercent.getMoney()%>, name: '<%=salePercent.getFruit_name()%>'},
                    <%}%>
                ]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    chart.setOption(option);
</script>
</html>