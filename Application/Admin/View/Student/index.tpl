<extend name="Base:index" />
<block name="title">
    数据列表
</block>
<block name="body">
    <div class="row-fluid" ng-controller="index">
        <div class="col-xs-12">
            <div class="row">
                <div class="col-md-3">
                    <form action="{:U('index?keywords=')}" method="get">
                        <div class="input-group custom-search-form">
                            <input class="form-control" name="keywords" placeholder="Search..." type="text" value="{:I('get.keywords')}" />
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="fa fa-search"></i>
                                </button> 
                            </span>
                        </div>
                    </form>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-success" ng-show="info" role="alert" ng-bind="info"></div>
                </div>
            </div>
            <div class="box">
                <div class="box-body table-responsive">
                    <div class="panel-body">
                        <table class="table table-bordered table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>序号</th>
                                    <?php $order=I('get.order') ?>
                                    <th>
                                        <a href="<eq name='order' value=" desc "> {:U('index?by=num&order=asc', I('get.'))}  
                                <else/> {:U('index?by=num&order=desc', I('get.'))} </eq>">学号</a>
                                    </th>
                                    <th>姓名</th>
                                    <th>附件</th>
                                    <th>作业地址</th>
                                    <th>得分</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="student in students">
                                    <td>{{ $index+1 }}</td>
                                    <td>{{student.num}}</td>
                                    <td>{{student.name}}</td>
                                    <td>{{student.attachment_id}}</td>
                                    <td><a href="{{student.url}}" target="_blank">{{student.url}}</a></td>
                                    <td>
                                        <input min="0" max="100" type="text" ng-model="student.score" />
                                        <button type="button" ng-click="submitScore(student)" class="btn-sm btn-success">提交</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <nav>
                    <Yunzhi:page />
                </nav>
            </div>
        </div>
    </div>
    <include file="index.js" />
</block>
