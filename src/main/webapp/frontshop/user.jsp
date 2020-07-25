<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登录</title>
    <script src="https://www.jq22.com/jquery/jquery-1.10.2.js"></script>
    <link rel="stylesheet" href="https://www.jq22.com/jquery/bootstrap-4.2.1.css">
    <script src="https://www.jq22.com/jquery/bootstrap-4.2.1.js"></script>
    <script src="./js/yz.js"></script>
    <script src="js/jAlert.js"></script>
    <script src="./js/modal_dialog.js"></script>
    <link rel="stylesheet" href="https://www.jq22.com/jquery/font-awesome.4.7.0.css">
    <link rel="stylesheet" type="text/css" href="css/login.css"/>

    <script src="http://res.wx.qq.com/connect/zh_CN/htmledition/js/wxLogin.js"></script>
</head>

<body>
<%
    session.removeAttribute("user");
%>
<div class="shadow mb-5 bg-light rounded login-top">
    <div class="head">
        <img src="./images/logo.png"><span>
                <h1>·</h1>登录
            </span>
    </div>
</div>
<div class="login-box">
    <div class="tree">
        <img src="./images/2.png" class="img-fluid">
    </div>
    <div class="slogan">
        克勤之致<br><span class="yellow">结青藤</span>之缘
    </div>
    <div id="earth" class="earth">
        <img src="./images/1.png" class="img-fluid">
    </div>
    <!-- 登录 -->
    <form action="../user/login.do" method="post">
        <div class="login">
            <div class="login-logo">
                <img src="./images/logo.png" class="img-fluid">
            </div>
            <div class="login-other">
                <div onclick='toQzoneLogin()'><img src="./images/icon/QQ-line.png"></div>
                <div onclick='toweChat()'><img src="./images/icon/wx-line.png"></div>
                <div><img src="./images/icon/sina-line.png"></div>
            </div>
            <div class="hr"><span>或</span></div>
            <div class="login-form">
                <form method="POST">
                    <code class="check_log_phone"></code>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-user-circle-o text-success"></span>
                            </span>
                        </div>
                        <input type="text" name="username" class="form-control" id="logphone" placeholder="手机号码">
                    </div>
                    <code class="check_log_pwd"></code>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-unlock text-success"></span>
                            </span>
                        </div>
                        <input type="password" class="form-control" name="password" id="logpwd" placeholder="密码">
                    </div>
                    <button type="submit" id="login" class="btn btn-success btn-block">登录</button>
                </form>
            </div>
            <div class="login-regist">
                没有帐号？<span id="ToRegist">立即注册</span>
            </div>
        </div>
    </form>
    <!-- 注册 -->
    <form id="regtable" action="#" method="post">
        <div class="regist">
            <div class="regist-title">
                手机注册<span><img src="./images/logo.png" height="40px"></span>
            </div>
            <div class="regist-form">
                <form method="POST" action="">
                    <code class="check_reg_phone"></code>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-mobile text-success"></span>
                            </span>
                        </div>
                        <input type="text" class="form-control" name="username" id="regphone" placeholder="手机号码">
                    </div>
                    <code class="check_reg_pwd"></code>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-unlock-alt text-success"></span>
                            </span>
                        </div>
                        <input type="password" class="form-control" name="password" id="regpwd" placeholder="密码">
                    </div>
                    <code class="check_reg_pwd2"></code>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                <span class="fa fa-unlock-alt text-success"></span>
                            </span>
                        </div>
                        <input type="password" class="form-control" id="regcheckpwd" placeholder="确认密码">
                    </div>
                    <code class="check_reg_code"></code>
                    <button type="submit" id="regist" class="btn btn-success btn-block">注册</button>
                </form>
            </div>
            <div class="otherLogin">
                <div class="qq">
                    <img src="./images/icon/QQ.png" onclick='toQzoneLogin()' class="img-fluid">
                </div>
                <div class="wx">
                    <img src="./images/icon/wx.png" onclick='toweChat()' class="img-fluid">
                </div>
            </div>
            <div class="login-login">
                <span id="otherLogin">快捷登录</span>
                <span id="phoneLogin">手机注册</span>
                <span id="ToLogin">返回登录</span>
            </div>
        </div>
    </form>
</div>

<div class="login-footer">
    <div class="container">
        <div class="row">
            <div class="col text-center login-nav">
                <ul>
                    <li><a href="#">首页</a>
                        <div class="border"></div>
                    </li>
                    <li><a href="#">关于我们</a>
                        <div class="border"></div>
                    </li>
                    <li><a href="#">企业招聘</a>
                        <div class="border"></div>
                    </li>
                    <li><a href="#">合作专区</a>
                        <div class="border"></div>
                    </li>
                    <li><a href="#">联系我们</a>
                        <div class="border"></div>
                    </li>
                    <li><a href="#">意见反馈</a></li>
                </ul>
                <div class="foot">
                    报名咨询热线：400-1597-0213&emsp;&emsp;邮箱：<a href="mailto:guoranxinxian@126.com"
                                                          target="_blank">guoranxinxian@126.com</a>&emsp;&emsp;备案号：京ICP备19004658号
                </div>
            </div>
        </div>
    </div>
</div>

<script src="./js/check.js"></script>
<script>
    setTimeout('changeState()', 1000)

    //地球动画
    function changeState() {
        // console.log('动画开始');
        $('#earth').removeClass('earth');
        $('#earth').addClass('move');
    }


    $(function () {

        var login = $('#login');    //登录按钮对象
        var regist = $('#regist');    //注册按钮对象

        $(".cuo").click(function () {
            $(".box-bg").css("display", "none");
            login.attr("disabled", false);
        })


        //注册登录切换
        //登录
        $('#ToRegist').click(function () {
            // console.log('登录')
            $('.regist').css('display', 'block')
            $('.login').css('display', 'none')
        })
        //注册
        $('#ToLogin').click(function () {
            // console.log('注册')
            $('.regist').css('display', 'none')
            $('.login').css('display', 'block')
        })

        //注册页面注册方式切换
        $('#otherLogin').click(function () {
            $('.regist-form').css('display', 'none')
            $('.otherLogin').css('display', 'block')
            $('#phoneLogin').css('display', 'block')
            $('#otherLogin').css('display', 'none')
            $('.regist-title').html('快捷登录')
        })
        $('#phoneLogin').click(function () {
            $('.regist-form').css('display', 'block')
            $('.otherLogin').css('display', 'none')
            $('.regist-title').html('手机注册')
            $('#phoneLogin').css('display', 'none')
            $('#otherLogin').css('display', 'block')
        })

        //点击注册
        regist.click(function () {
            let phone = $('#regphone').val()
            var myreg = /^[1][3,4,5,7,8][0-9]{9}$/;
            var flag = true
            var error_info = "";
            if (!myreg.test(phone)) {
                flag = false
                error_info = error_info + "手机号码格式不正确"
            }
            let password = $('#regpwd').val();
            let repassword = $('#regcheckpwd').val();
            if (password != repassword) {
                flag = false
                error_info = error_info + "\n两次密码不一致"
            }

            if (!flag) {
                jAlert('提示', error_info, '确定')
            } else{
                $("#regtable").attr("action","../user/register.do")
            }
        })

    })

</script>
</body>

</html>