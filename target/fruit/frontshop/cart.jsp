<%@ page import="com.user.service.CartService" %>
<%@ page import="com.user.domain.SelfCart" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <link href="css/index.css" rel="stylesheet">
    <link href="css/share.css" rel="stylesheet">
    <script src="js/jquery-1.12.3.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>购物车</title>
    <style>
        * {
            margin: 0px auto;
            padding: 0px;
        }

        tr:hover td {
            background: rgba(217, 214, 195, 0.2);
            cursor: pointer;
        }

        table, td {
            font-size: 16px;
        }

        table {
            display: block;
        }

        td {
            top: 25%;
            border-bottom: 1px solid lightgrey;
            color: rgba(0, 0, 0, 0.6);
            border-top: 1px solid lightgrey;
        }

        img {
            float: left;
            width: 8em;
        }

        tr {
            text-align: center;
        }

        #box {
            width: 100%;
            margin: 0 auto;
            border-radius: 20px;
        }

        #cart {
            width: 100%;
            margin: 0 auto;
            border-collapse: collapse;
        }

        #head td {
            font-size: 20px;
            border-top: 0px;
            border-bottom: 2px solid #48900F;
            color: rgba(0, 0, 0, 0.4);
            font-weight: 600;
            line-height: 250%;
        }

        #settlement {
            height: 60px;
            margin-top: 2em;
            width: 100%;
            line-height: 60px;
            border: 1px solid #fff;
            float: left;
            background: rgba(72, 144, 15, 0.75);
            color: rgba(0, 0, 0, 0.6);
            font-size: 18px;
            font-weight: 600;
            margin-top: 2em;
        }

        #settlement div {
            float: left;
        }

        #addupto {
            color: #ff0000;
            font-weight: 700;
        }

        #NumofGoods {
            color: #ff0000;
            font-weight: 600;
        }

        .goods {
            padding: 5px;
            text-align: left;
        }

        .number {
            width: 90px;
            height: 30px;
            border: 1px solid #cccccc;
            display: flex;
            margin: 0 auto;
        }

        .acc {
            width: 30px;
            height: 30px;
            border-left: 0px solid #cccccc;
            border-right: 0px solid #cccccc;
            line-height: 30px;
            font-size: 16px;
        }

        .desymbol {
            width: 30px;
            height: 30px;
            line-height: 30px;
            background: #ccc;
            font-size: 16px;
            cursor: pointer;
        }

        .adsymbol {
            width: 30px;
            height: 30px;
            line-height: 30px;
            background: #ccc;
            font-size: 16px;
            cursor: pointer;
            font-size: 16px
        }

        .text {
            text-align: left;
        }

        .total {
            color: #ff0000;
            font-weight: 500;
        }

        .button {
            height: 45px;
            line-height: 30px;
            display: inline-block;
            border-radius: 6px;
            box-shadow: #cccccc inset;
            border: 1px solid #fff;
            background-color: rgba(20, 161, 59, 0.4);
            color: #FFF;
            text-align: center;
            font-size: 16px;
            padding: 5px;
            width: 20px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 7.5px 10px;
        }

        .button:active:focus,
        .button:active,
        .button:focus {
            border: 1px solid #FFF;
        }

        .her-banner {
            width: 100%;
            height: 450px;
            overflow: hidden;
            margin: 0px auto;
            background-image: url("images/cart.jpg");
            background-size: cover;
            background-position: 50% 50%;
            background-repeat: no-repeat no-repeat;
        }

        .button span {
            cursor: pointer;
            display: inline-block;
            position: relative;
            transition: 0.5s;
            font-size: 18px;
            font-weight: 600;
        }

        .button span::after {
            content: '\00bb';
            position: absolute;
            opacity: 0;
            top: 0;
            right: -10px;
            transition: 0.5s;
            font-size: 20px;
        }

        .button:hover span {
            padding-right: 20px;
            font-size: 20px;
            font-weight: bold;
        }

        .button:hover span::after {
            opacity: 1;
            right: 0;
        }
    </style>
</head>
<body>
<div class="headr">
    <div class="heard-con">
        <img src="images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="index.jsp" style="color: #4AB344"><span style="color: #4AB344">首页</span></a></li>
                <li><a href="hot.jsp">蔬果热卖</a></li>
                <li><a href="produ.jsp">全部产品</a></li>
                <li><a href="consult.jsp">最新资讯</a></li>
                <li><a href="touch.jsp">联系我们</a></li>
            </ul>
            <div class="sptopfoot">
                <div class="spbottom">
                </div>
            </div>
        </div>
        <div class="headr-right" style="cursor: pointer" onclick="location='cart.jsp'">
            <i class="iconfont" style="font-size: 16px;margin-right: 10px">&#xe7d5;</i>
            我的购物车
        </div>
    </div>
</div>
<!--顶部导航结束-->
<!--banner图片-->
<div class="her-banner"></div>
<!--banner图片结束-->
<!--主页内容-->
<div class="content">
    <!--果园推荐开始-->
    <form action="../front/settlement.do" id="cartform" method="post">
        <div class="recommand clear">
            <div class="rec-nav clear">
                <h2>购物车 <span>SHOPCART</span></h2>
            </div>
        </div>
        <div id="box">
            <table id="cart" width="100%">
                <tr id="head" style="width: 100%">
                    <td width="100px"><input class="allSelect" type="checkbox">
                        全选
                    </td>
                    <td colspan="2" width="36%">商品</td>
                    <td width="12%">单价</td>
                    <td width="20%">数量</td>
                    <td width="12%">小计</td>
                    <td width="12%">操作</td>
                </tr>
                <%
                    CartService cartService = new CartService();
                    List<SelfCart> carts = cartService.carts(request);
                    for (SelfCart cart : carts) {
                %>
                <tr>

                <span style="display: none" class="trStatus">
                <input style="display: none" value="<%=cart.getFruit_id()%>"/>
                <input style="display: none" value="<%=cart.getUsername()%>"/>
                <input style="display: none"/>
                </span>


                    <td><input class="select" type="checkbox"></td>
                    <td class="goods"><img src="<%=cart.getMain_pic()%>"></td>
                    <td class="text"><%=cart.getFruit_name()%>
                    </td>
                    <td class="price"><%=cart.getSell_price()%>
                    </td>
                    <td>
                        <div class="number">
                            <div class="desymbol">-</div>
                            <div class="acc"><%=cart.getCart_num()%>
                            </div>
                            <div class="adsymbol">+</div>
                        </div>
                    </td>
                    <td class="total"></td>
                    <td class="dele"><a href="../front/delCartCommodity.do?id=<%=cart.getFruit_id()%>&username=<%=cart.getUsername()%>" style="text-decoration: none"><i class="fa fa-trash fa-lg"></i></a></td>
                </tr>
                <%}%>
            </table>

            <div id="settlement">
                <div style="width: 35%; margin-left: 1.2em;">
                    <input class="allSelect" type="checkbox"> 全选
                </div>
                <div style="width:18%; margin: 0 auto;">
                    全选商品<span id="NumofGoods"></span><span>件</span>
                </div>
                <div style="width:25%; margin: 0 auto;">
                    合计：¥<span id="addupto"></span>
                </div>
                <button id="jiesuan" type="submit" style="width:10%; float: right; border-left:0;" class="button">
                    <span>结算</span>
                </button>
            </div>
        </div>
    </form>
</div>


</body>
<script src="js/cart.js"></script>
<script>
    $("#jiesuan").click(function () {
        let select = $('.select')
        let parent = $('.trStatus')
        let acc = $('.acc')
        var j = 0
        var flag = false
        for (var i = 0; i < select.length; i++) {
            if (select[i].checked == true) {
                flag = true
                parent[i].children[0].setAttribute("name", "carts[" + j + "].id")
                parent[i].children[1].setAttribute("name", "carts[" + j + "].username")
                parent[i].children[2].setAttribute("name", "carts[" + j + "].cart_num")
                parent[i].children[2].setAttribute("value",acc[i].innerHTML)
                j = j + 1
            }
        }
        if (!flag)
            $("#cartform").attr("action","#");

    })
</script>
</html>