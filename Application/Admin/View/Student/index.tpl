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
                <div class="col-md-3">
                    <a class="button btn btn-info"  href="{:U('edit')}" ><i class="glyphicon glyphicon-plus"></i> 添加学生</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <div ng-show="0"><input id="file" name="filename" type="file" multiple="true" value="上传图片"></div>
                </div>
            </div>
            <div class="box">
                <div class="box-body table-responsive">
                    <div class="panel-body">
                    </div>

                    <table class = "table table-bordered table-striped table-hover">
	                    <thead>
	                        <tr>
                                <th>序号</th>
                                <?php $order=I('get.order') ?>
			                    <th>
			                    <a href="<eq name='order' value="desc"> {:U('index?by=username&order=asc', I('get.'))}  
			                    <else/> {:U('index?by=username&order=desc', I('get.'))} </eq>">用户名</a>
			                    </th>

			                    <th>姓名</th>
			                    <th>手机号</th>
                                <th>邮箱</th>
			                    <th>操作</th>
		                    </tr>
	                    </thead>
	                    <tbody>
		                    <foreach name="users" item="user" key="k">
			                    <tr>
				                    <td>{$k+1}</td>
                                    <td>{$user['username']}</td>
				                    <td>{$user['name']}</td>
				                    <td>{$user['phonenumber']}</td>
				                    <td>{$user['email']}</td>
				                    <td>
				                    <a class="btn btn-sm btn-primary" href="{:U('edit?id='.$user['id'])}"><i class="fa fa-pencil"></i>&nbsp;编辑</a>
				                    <a class="btn btn-sm btn-danger" href="{:U('delete?id='.$user['id'])}"><i class="fa fa-trash-o "></i>&nbsp;删除</a>
				                    <a class="btn btn-sm btn-warning delete" href="{:U('resetPassword?id='.$user['id'])}"><i class="fa fa-repeat"></i>&nbsp;重置密码</a>
				                    </td>
                                </tr>
		                    </foreach>	
	                    </tbody>
                    </table>

                </div>
                <nav>
                    <Yunzhi:page />
                </nav>

            </div>
        </div>
    </div>
    <include file="index.js" />
</block>
