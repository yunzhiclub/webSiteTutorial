<extend name="Base:index" />
<block name="wrapper">
    <div class="row-fluid" ng-controller="personalCenter">
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <form class="form-horizontal" action="{:U('save')}" method="post" name="form">
                                    <input type="hidden" name="id" value="{$user.id}" />
                                    <div class="form-group">
                                        <label class="col-md-2 text-right">学号:</label>{$student['num']}
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 text-right">姓名:</label>{$student['name']}
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 text-right">班级:</label>{$student['class']}
                                    </div>
                                    <div class="form-group">
                                        <label for="password" class="col-md-2 text-right">原密码:</label>
                                        <input type="password" name="password" ng-model="student.password" minlength="6" maxlength="10" />
                                        <span class="text-danger" ng-show="form.password.$dirty && form.password.$invalid">6至10位</span>
                                    </div>
                                    <div class="form-group">
                                        <label for="repassword" class="col-md-2 text-right">新密码:</label>
                                        <input type="password" name="newpassword" minlength="6" maxlength="10" ng-model="student.newpassword"> <span class="text-danger" ng-show="form.password.$dirty && (form.newpassword.$invalid || !form.newpassword.$dirty)">6至10位</span>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-2 text-right">生活照:</label>
                                        <input name="attachment_id" value="{{student.attachment_id}}" type="hidden" />

                                        <img class="img-rounded col-md-8" ng-src="{{student.image}}" ng-show="student.image" />
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-2"></div>
                                        <div class="col-md-8">
                                            <input id="file" name="filename" type="file" multiple="true" value="上传图片" />
                                        </div>
                                        
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-6 text-center">
                                            <button type="submit" ng-disabled="" class="btn btn-md btn-success"><i class="fa fa-check "></i>保存</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <include file="personalCenter.js" />
</block>
