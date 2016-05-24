<extend name="Base:index" />
<block name="wrapper">
    <div ng-controller="workCtrl">
        <form action="saveUrl" method="post">
            <div class="form-group">
                <label for="url">SAE地址</label>
                <input type="text" class="form-control" id="url" name="url" placeholder="sae地址,不超过200位" value="{:$student1['url']}">
            </div>
            <button class="btn btn-success text-center" type="submit">提交</button>
        </form>
    </div>
</block>
