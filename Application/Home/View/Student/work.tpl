<extend name="Base:index" />
<block name="wrapper">
    <div ng-controller="workCtrl">
        <form action="workSubmit" method="post">
        <p class="bg-danger">文件上传未进行蒙板处理，点击"请先择作业文件"后，如未正常回显代码，需要稍待一会。</p>
        <div class="panel panel-default">
            <div class="panel-heading">已上传文件代码</div>
            <div class="panel-body" style="white-space: pre;">
                <div ng-show="show">{:htmlspecialchars($M->getTextByAttachmentId($work['attachment_id']))}</div>
                <div ng-hide="show">{{index.html}}</div>
            </div>
            <input type="hidden" name="attachment_id" value="{{attachment_id}}" />
        </div>
        <div class="btn btn-primary" ngf-select="upload($file)" ng-model="file" name="file" ngf-pattern="'text/html,text/htm'" ngf-accept="'text/html,text/htm'" ngf-max-size="20MB">请选择作业文件</div>
        <button class="btn btn-success" type="submit">提交</button>
        </form>
    </div>
    <include file="work.js" />
</block>
