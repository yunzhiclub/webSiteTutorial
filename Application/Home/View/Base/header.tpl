<div class="page-header logo">
    <php>$expert = session('expert');</php>
    <div class="row">
        <div class="col-sm-8">
            <h2>
           商业网站开发入门随堂系统<small><a href="http://www.mengyunzhi.com">&nbsp;&nbsp;河北工业大学梦云智软件开发团队</a></small>
        </h2>
        </div>
        <div class="col-sm-4 text-right">
            <php>$student = session('student');</php>
            <p><b>{:$student['name']}</b> 欢迎您　　　</p>
            <p><a href="{:U('Login/logout')}">注销 <span class="glyphicon glyphicon-log-out"></span></a>　　　</p>
        </div>
    </div>
</div>

