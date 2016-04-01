<!DOCTYPE html>
<html>

<head>
    <include file="Base/head" />
</head>

<body>
    <block name="main">
        <div id="main">
            {$YZ_TEMPLATE_NAV}
            <include file="Base/body" />
            <div id="footer" style="clear:both;display:block">
                <block name="footer">
                    <p>
                        <span style="text-align:left;float:left">&copy;<?php echo date("Y"); ?> <a href="http://www.mengyunzhi.com" alt="www.mengyunzhi.club">梦云智</a></span>
                    </p>
                </block>
            </div>
        </div>
        <!--/#wrapper-->
        <include file="Base/footer" />
    </block>
</body>

</html>
