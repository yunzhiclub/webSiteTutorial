<extend name="Base:index" />
<block name="wrapper">
    <div ng-controller="workCtrl">
        <div class="btn btn-primary" ngf-select="upload($file)" ng-model="file" name="file" ngf-pattern="'text/html'" ngf-accept="'text/html'" ngf-max-size="20MB">请选择作业文件</div>
    </div>
    <include file="work.js" />
</block>
