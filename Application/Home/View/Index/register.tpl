<extend name="Index/index" />
<block name="form">
    <div class="login-panel panel panel-default login-form" ng-controller="register">
        <div class="panel-heading">
            <h3 class="panel-title">请注册</h3>
        </div>
        <div class="panel-body">
            <form role="form" ng-submit="submit()" name="form" id="loginform" ng-show="is_register">
                <fieldset>
                    <div class="form-group">
                        <input class="form-control" placeholder="学号" name="num" ng-model="student.num" id="num" ng-maxlength="6" ng-minlength="6" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="姓名" name="name" ng-model="student.name" ng-maxlength="10" ng-minlength="2" required="">
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="密码" ng-model="student.password" name="password" id="password" type="password" ng-maxlength="10" ng-minlength="6" />
                    </div>
                    <div class="form-group">
                        <input class="form-control" placeholder="确认密码" ng-model="student.repassword" type="password" name="repassword"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="hidden" id="img" />
                    </div>
                    <div class="form-group">
                        <button class="btn btn-lg btn-success btn-block" ng-disabled="form.num.$invalid || form.name.$invalid || invalid" id="login">注册</button>
                    </div>
                    <div class="form-group">
                        <p ng-show="form.num.$invalid && form.num.$dirty">
                            学号长度必须为6
                        </p>
                        <p ng-show="form.name.$invalid && form.name.$dirty">
                            姓名长度须在2至10位之间
                        </p>
                        <p ng-show="form.password.$invalid && form.password.$dirty">
                            密码长度须在6至10位之间
                        </p>
                        <p ng-show="form.repassword.$dirty && invalid">
                            两次输入的密码不一致
                        </p>
                    </div>
                </fieldset>
            </form>
            <div ng-hide="is_register">
                <div class="form-group">
                     <div class="alert alert-success" ng-hide="student.is_visitor">
                         {{student.name}}欢迎你！信息无误请点击确认继续。
                     </div>
                     <div class="alert alert-danger" ng-show="student.is_visitor">
                        欢迎你！<br />但系统未检测到您的信息，如果你非本班学生，请补充班级信息后，点击确认。<br />如果是本班学生不小心输错了学号姓名，请返回重新输入.
                     </div>
                </div>

                <div class="form-group">
                    学号：{{student.num}}
                    <br />
                    姓名：{{student.name}}
                    <br />
                    <span ng-show="student.is_visitor"><input class="form-control" ng-model="student.class" placeholder="请输入班级信息" required/></span><span ng-hide="student.is_visitor">班级:{{student.class}}</span>
                    <br />
                </div>

                <div class="form-group">
                    <div class="col-md-6">
                        <button ng-click="is_register = 1" class="btn btn-lg btn-success btn-block">返回</button>
                    </div>
                    <div class="col-md-6">
                        <button ng-click="register()"  class="btn btn-lg btn-success btn-block">确认</button>
                    </div>
                </div>

            </div>
        </div>
        <div ng-show="isError" class="alert alert-danger">
            {{error}}
            </div>
    </div>
    <include file="register.js" />
</block>
