<nav class="navbar navbar-default">
    <!-- Brand and toggle get grouped for better mobile display -->
    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <block name="nav">
            <ul class="nav navbar-nav">
                <li <eq name="ACTION_NAME" value="home">class="active"</eq>>
                    <a href="{:U('Index/home')}">首页</a>
                </li>
                <li <eq name="ACTION_NAME" value="work">class="active"</eq>>
                    <a href="{:U('student/work')}">作业提交</a>
                </li>
                <li
                    <eq name="ACTION_NAME" value="sae">class="active"</eq>>
                    <a href="{:U('student/sae')}">SAE域名提交</a>
                </li>
                <li <eq name="ACTION_NAME" value="personalCenter">class="active"</eq>>
                    <a href="{:U('Student/personalCenter')}">个人中心</a>
                </li>
            </ul>
        </block>
    </div>
    <!-- /.navbar-collapse -->
</nav>
