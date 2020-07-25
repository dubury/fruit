<%@ page import="com.user.domain.RecHotEntity" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.service.AllInfo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>全部产品</title>
    <link href="css/produ.css" rel="stylesheet">
    <link href="css/share.css" rel="stylesheet">
    <script src="js/jquery-1.12.3.js"></script>
</head>
<body>
<%
    AllInfo ai = new AllInfo();
    List<RecHotEntity> alls = ai.all(request);
%>
<!--顶部导航-->
<div class="headr">
    <div class="heard-con">
        <img src="images/logo.jpg" style="margin-top: 7px;float: left;position: absolute">
        <div class="headr-nav">
            <ul>
                <li><a href="index.jsp">首页</a> </li>
                <li><a href="hot.jsp">蔬果热卖</a> </li>
                <li><a href="produ.jsp"style="color: #4AB344"><span style="color: #4AB344">全部产品</span></a> </li>
                <li><a href="consult.jsp">最新资讯</a></li>
                <li><a href="touch.jsp">联系我们</a> </li>
            </ul>
            <div class="sptopfoot">
                <div class="spbottom"  >
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
<div class="her-banner">

</div>
<!--banner图片结束-->
<div class="content">
    <!--产品推荐开始-->
    <div class="recommand clear">
        <div class="rec-cont clear">
            <div class="rec-left">
                <div class="classily">
                    <div class="cltop">
                        <p>产品分类</p>
                    </div>
                    <div class="cltcon">
                        <p><a href="#">国产水果</a></p>
                        <p><a href="#"> 进口水果</a></p>
                        <p style="border-bottom:0px dashed #999999;"><a href="#">新鲜时蔬</a></p>
                    </div>

                </div>
                <div class="service">
                    <div class="cltop">
                        <p>在线客服</p>
                    </div>
                    <div class="sercon">
                        <div class="qqs">
                            <p><a hidefocus="true" href="#">
                                <span class="serOnline-img0 qqImg0">&nbsp;</span>蜜桃
                            </a>
                            </p>
                            <P><a hidefocus="true" href="#">
                                <span class="serOnline-img0 qqImg0">&nbsp;</span>芒果
                            </a>
                            </P>
                        </div>
                        <div class="tims">
                            <div class="marBL-10">
                                <span class="worktime-header-img">&nbsp;</span>
                                <span class="serWorkTimeText"><b>工作时间</b></span>
                            </div>
                            <div class="serOnline-list-v "><span>周一至周五 ：8:30-17:30</span></div>
                            <div class="serOnline-list-v lastData"><span>周六至周日 ：9:00-17:00</span></div>
                        </div>
                    </div>

                </div>

            </div>

            <div class="rec-right">

                <div class="bd">

                    <div class="bd1" style="display: block">
                        <%
                            for(RecHotEntity all:alls){
                        %>
                        <div class="rcr">
                            <div class="rcr-top">
                                <img src="<%=all.getPic_path()%>" width="100%">
                            </div>
                            <div class="rcr-bot">
                                <div class="rb-top">
                                    <%=all.getName()%>
                                </div>
                                <div class="second_P">
                                    <span class="fk-prop">￥</span>
                                    <span class="fk-prop-price"><%=all.getPrice()%>
                                            <span class="fk-prop-p">.00</span>
                                        </span>
                                </div>
                                <div class="buy">
                                    <a class="second_mallBuy" href="../front/detail.do?id=<%=all.getId()%>">
                                        <span style="color: white;">购买</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>

                </div>
            </div>


        </div>
    </div>

    <!--产品推荐结束-->
</div>
<!--底部-->
<div class="footer">
    <div class="ft-con">
        <div class="ft-top">
            <img src="images/fot-1.jpg">
        </div>
        <div class="ft-bo">
            <div class="ft-b">
                <h3>服务保障</h3>
                <p>正品保证</p>
                <p>7天无理由退换</p>
                <p>退货返运费</p>
                <p>7X15小时客户服务</p>

            </div>
            <div class="ft-b">
                <h3>支付方式</h3>
                <p>公司转账</p>
                <p>货到付款</p>
                <p>在线支付</p>
                <p>分期付款</p>

            </div>
            <div class="ft-b">
                <h3>商家服务</h3>
                <p>商家入驻</p>
                <p>培训中心</p>
                <p>广告服务</p>
                <p>服务市场</p>

            </div>
            <div class="ft-b">
                <h3>服务保障</h3>
                <p>免运费</p>
                <p>海外配送</p>
                <p>EMS</p>
                <p>211限时达</p>

            </div>

        </div>
        <div class="banq">
            <p>©2016 果然新鲜 版权所有</p>
            <p>手机版 | 本站使用<span><img src="images/ft.jpg"></span>凡科建站搭建 | <a style="text-decoration: none; color: #92CA9D;;" href="../backgroundshop/login.jsp">管理登录</a> </p>
        </div>

    </div>
</div>
</body>
<script src="js/hot.js"></script>
</html>
