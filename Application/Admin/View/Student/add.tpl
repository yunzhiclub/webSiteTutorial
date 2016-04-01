<extend name="Base:index" />
<block name="body">
  <div class="row-fluid" ng-app="user" ng-controller="userAdd">
    <div class="col-xs-12">
      <button type="button" class="btn btn-info" onclick="javascript:history.back(-1);">
        返回
      </button>
      <div class="panel-body">
      </div>
      <div class="panel panel-default">
        <!-- <div class="panel-heading">
          添加用户
        </div> -->
          <div class="panel-body">
            <form class="form-horizontal" name="form" action="{:U('save')}" method='post'>
              <input type="hidden" name="id" value="{$user.id}"/>

              <div class="form-group">
                <label for="username" class="col-sm-2 control-label">用户名：</label>
                  <div class="col-sm-4">
                    <input id="username" name="username" class="form-control" ng-model="username" ng-disabled="{{edit}}" required/>

                    <p class="text-danger" ng-show="form.username.$dirty && form.username.$invalid"> <span ng-show="form.username.$error.required">用户名不能为空</span></p>
                  </div>
              </div>

              <div class="form-group">
                <label for="name" class="col-sm-2 control-label">姓名：</label>
                  <div class="col-sm-4">
                    <input id="name" name="name" class="form-control" ng-model="name" ng-disabled="{{edit}}" required/>

                    <p class="text-danger" ng-show="form.name.$dirty && form.name.$invalid"> <span ng-show="form.name.$error.required">姓名不能为空</span></p>
                  </div>
              </div>

              <div class="form-group">
                <label for="phonenumber" class="col-sm-2 control-label">手机号：</label>
                  <div class="col-sm-4">
                    <input id="phonenumber" name="phonenumber" class="form-control" ng-model="phonenumber" ng-pattern="regex" required/>

                    <p class="text-danger" ng-show="form.phonenumber.$dirty && form.phonenumber.$invalid"> <span ng-show="form.phonenumber.$error.required">请输入11位手机号码</span></p>
                  </div>
              </div>

              <div class="form-group">
                  <label for="email" class="col-sm-2 control-label">邮箱：</label>
                  <div class="col-sm-4">
                    <input id="email" name="email" class="form-control" ng-model="email" required/>

                    <p class="text-danger" ng-show="form.email.$dirty && form.email.$invalid"> <span ng-show="form.email.$error.required">邮箱不能为空</span></p>
                  </div>
              </div>
              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <button type="submit" ng-disabled="form.phonenumber.$invalid" class="btn btn-sm btn-success">
                  <i class="fa fa-check"></i>保存</button>
                </div>
              </div>
            </form>
        </div>
      </div> 
    </div>
  </div>
 <include file="add.js"/>

</block>