<!DOCTYPE html>
<html>
<head>
    <title>ueditor</title>
    <meta charset="UTF-8"> 
    <script src="__BOW__/jquery/dist/jquery.min.js"></script>
</head>
<body>
    <form action="{:U('ueditorSave')}" method="post">
        <html:editor id="ueditor" name="ueditor" type="Ueditor">
                <H1>HEELO</H1>
        </html:editor>
        <button type="submit">submit</button>
    </form>
    
    <!--ueditor-->
    <js href="__ROOT__/lib/ueditor/ueditor.config.js" />
    <js href="__ROOT__/lib/ueditor/ueditor.all.min.js" />
    <js href="__ROOT__/lib/ueditor/lang/zh-cn/zh-cn.js" />
</body>
</html>