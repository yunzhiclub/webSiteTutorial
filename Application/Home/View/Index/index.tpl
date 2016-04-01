<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>商业网站开发入门随堂系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="__ROOT__/SBAdmin2/css/bootstrap.min.css" rel="stylesheet">
    <link href="__ROOT__/SBAdmin2/css/alertify.core.css" rel="stylesheet" type="text/css">
    <link href="__ROOT__/SBAdmin2/css/alertify.default.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <include file="index.css" />

     <!-- jQuery -->
    <script src="__ROOT__/SBAdmin2/js/jquery.min.js"></script>
    <script src="__ROOT__/js/angular1.4.8.min.js"></script>
    <script type="text/javascript">
        var app = angular.module("app",[]);
    </script>
</head>

<body ng-app="app">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
            <block name="form">
                <div class="login-panel panel panel-default login-form">
                    <div class="panel-heading">
                        <h3 class="panel-title">商业网站开发入门随堂系统</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form"  id="loginform" method = 'post' action="{:U('Login/login')}">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="学号" name="num" id="num" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="密码" name="password" id="password" type="password" required>
                                </div>
                                <div class="form-group">
                                    <button class="btn btn-lg btn-success btn-block" id="login">登录</button>
                                </div>
                                <div class="form-group">还没有用户名？请<a href="{:U('register')}">注册</a></div>
                            </fieldset>
                        </form>

                    </div>
                </div>
            </block>
            </div>
        </div>
    </div>
    <div ng-show="isError" class="error">
    {{error}}
    </div>

    <!-- Bootstrap Core JavaScript -->
    <script src="__ROOT__/SBAdmin2/js/bootstrap.min.js"></script>
    <script src="__ROOT__/SBAdmin2/js/alertify.min.js"></script>
    <include file="index.js" />
</body>
</html>
