<extend name="Base:index" />
<block name="wrapper">
    <div class="row-fluid">
        <div class="row">
            <div class="col-md-12 col-xs-12">
             <h3>第一次上机实验</h3>
             <h4>说明：</h4>
             <ol>
                <li>
                    上机实验计入平时成绩。
                </li>
                <li>
                    按自已的想法或参考本页"实验步骤"进行河北工业大学官网的LOGO,MENU两个模块的代码设计.
                </li>
                <li>
                    在 作业提交 中，提交最终的作业文件 index.html.
                </li>
                <li>
                    在 个人中心 中提交自己的生活照片。
                </li>
             </ol>
            <h4>实验步骤</h4>
             <ol>
                <li>下载firefox浏览器，并安装web developer插件</li>
                <li>进入layout官方站点，下载.ZIP压缩包，并解压至本机。如果有困难，可以直接本页的资源列表中下载。</li>
                <li>使用firefox打开www.hebut.edu.cn，并利用web developer插件查看图片及颜色信息</li>
                <li>在src文件夹下，新建images文件夹，将有用的图片下载至该文件夹</li>
                <li>找开src文件夹下的index.html,双击使用系统自带的浏览器打开。</li>
                <li>右键index.html, 并使用自己喜欢的编辑器（dreamweaver,editplus,sublime等）进行编辑</li>
                <li>找到title与/tile(第8行），将原有的"Bootstrap 3, from LayoutIt!"删除掉，替换成自己的姓名+学号.比如：张三+10000</li>
                <li>删除index.html中 body 与 /body 间冗余的div信息.</li>
                <li>按学校官网划出3个行</li>
                <li>第一行：LOGO
                    <ol>
                        <li>增加背景色, 设置高度</li>
                        <li>建立居中盒子。设置宽度为1000px, 左右边距为auto</li>
                        <li>为居中盒子设置高度，设置背景图片</li>
                        <li>将盒子分左右两个部分。左边的盒子设置为左浮动，右边的盒子设置为右浮动</li>
                        <li>设置右边盒子的宽度为300px</li>
                        <li>将右边的盒子中新建两个盒子
                            <ol>
                                <li>在第一个盒子中，写入邮箱登陆 English等。设置文字对齐方式为右对齐。文字颜色为白色.</li>
                                <li>在第二个盒子中增加input输入框，并设置其上边距、下边距、高度、宽度等以达到与背景图片相一致的效果。</li>
                            </ol>
                        </li>
                    </ol>
                </li>
                <li>第二行，MENU
                    <ol>
                        <li>增加背景色，设置高度</li>
                        <li>建立居中盒子。设置宽度为1000px,左右边距auto.</li>
                        <li>建立第一个菜单盒子 首页 。</li>
                        <li>建立第二个菜单盒子 学校概括 。</li>
                        <li>设置以上两个盒子:
                            <ol>
                                <li>设置为左浮动，使其水平排列。</li>
                                <li>设置高度使其与父盒子相等。</li>
                                <li>设置行高其高度相等，达到水平居中的效果</li>
                            </ol>
                        </li>
                    </ol>
                </li>
                <li>第三行：slidershow
                    <ol>
                        <li>增加背景色，设置高度</li>
                        <li>建立居中盒子。设置宽度为1000px,左右边距auto.</li>
                        <li>以下为下节课讲解内容，按自己实际情况进行尝试
                            <ol>
                                <li>继续打开layoutit官方站点</li>
                                <li>在右侧编辑区域中，点击所有的REMOVE。去除冗余信息.</li>
                                <li>在左侧菜单中，找到 GRID SYSTEM(格珊系统) 拖动第一行，即字样为12,至右侧编辑区域中的column中。</li>
                                <li>在左侧菜单中，找到JAVASCRIPT 托动至右侧编辑区域</li>
                                <li>点击download -> continue non logined</li>
                                <li>去掉前三行，后三行，复制其余代码。如下：<pre>          
&lt;div class=&quot;carousel slide&quot; id=&quot;carousel-733302&quot;&gt;
    &lt;ol class=&quot;carousel-indicators&quot;&gt;
        &lt;li class=&quot;active&quot; data-slide-to=&quot;0&quot; data-target=&quot;#carousel-733302&quot;&gt;
        &lt;/li&gt;
        &lt;li data-slide-to=&quot;1&quot; data-target=&quot;#carousel-733302&quot;&gt;
        &lt;/li&gt;
        &lt;li data-slide-to=&quot;2&quot; data-target=&quot;#carousel-733302&quot;&gt;
        &lt;/li&gt;
    &lt;/ol&gt;
    &lt;div class=&quot;carousel-inner&quot;&gt;
        &lt;div class=&quot;item active&quot;&gt;
            &lt;img alt=&quot;Carousel Bootstrap First&quot; src=&quot;http://lorempixel.com/output/sports-q-c-1600-500-1.jpg&quot; /&gt;
            &lt;div class=&quot;carousel-caption&quot;&gt;
                &lt;h4&gt;
                    First Thumbnail label
                &lt;/h4&gt;
                &lt;p&gt;
                    Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                &lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;item&quot;&gt;
            &lt;img alt=&quot;Carousel Bootstrap Second&quot; src=&quot;http://lorempixel.com/output/sports-q-c-1600-500-2.jpg&quot; /&gt;
            &lt;div class=&quot;carousel-caption&quot;&gt;
                &lt;h4&gt;
                    Second Thumbnail label
                &lt;/h4&gt;
                &lt;p&gt;
                    Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                &lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
        &lt;div class=&quot;item&quot;&gt;
            &lt;img alt=&quot;Carousel Bootstrap Third&quot; src=&quot;http://lorempixel.com/output/sports-q-c-1600-500-3.jpg&quot; /&gt;
            &lt;div class=&quot;carousel-caption&quot;&gt;
                &lt;h4&gt;
                    Third Thumbnail label
                &lt;/h4&gt;
                &lt;p&gt;
                    Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                &lt;/p&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt; &lt;a class=&quot;left carousel-control&quot; href=&quot;#carousel-733302&quot; data-slide=&quot;prev&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-chevron-left&quot;&gt;&lt;/span&gt;&lt;/a&gt; &lt;a class=&quot;right carousel-control&quot; href=&quot;#carousel-733302&quot; data-slide=&quot;next&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-chevron-right&quot;&gt;&lt;/span&gt;&lt;/a&gt;
&lt;/div&gt;
                                    </pre></li>
                                <li>将复制的代码粘贴到居中盒子中.</li>
                                <li>修改src="http:xxxxx 为src="./images/xxxx，即显示本地图片</li>
                                <li>如果看到效果了，那么恭喜你！</li>
                                <li>如果没有，同样也恭喜你，因为排错本身也是一种快乐。当错误并排出的一瞬间，幸福感将油然而生。</li>
                            </ol>
                        </li>
                    </ol>
                </li>
                <li>资源列表:
                    <ol>
                        <li>layoutit资源包:<a href="__ROOT__/downloads/layoutit.zip">下载</a></li>
                        <li>示例代码一：
                            <pre>
&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;

&lt;head&gt;
    &lt;meta charset=&quot;utf-8&quot;&gt;
    &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;
    &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1&quot;&gt;
    &lt;title&gt;商业网站开发入门实验1&lt;/title&gt;
    &lt;meta name=&quot;description&quot; content=&quot;Source code generated using layoutit.com&quot;&gt;
    &lt;meta name=&quot;author&quot; content=&quot;LayoutIt!&quot;&gt;
    &lt;link href=&quot;css/bootstrap.min.css&quot; rel=&quot;stylesheet&quot;&gt;
    &lt;link href=&quot;css/style.css&quot; rel=&quot;stylesheet&quot;&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;div style=&quot;background-color: #072c87&quot;&gt;
        &lt;div style=&quot;margin:0px auto;width:1000px;height: 113px;background-image: url('./images/header.jpg')&quot;&gt;
            &lt;div style=&quot;float:left;width:500px;&quot;&gt;
               
            &lt;/div&gt;
            &lt;div style=&quot;float:right;width:500px;&quot;&gt;
                &lt;div style=&quot;color:white;text-align:right;&quot;&gt; 邮箱登陆 | Englist&lt;/div&gt;
                &lt;div&gt;
                    &lt;input type=&quot;text&quot; style=&quot;margin-top: 66px;margin-left: 335px;height: 21px;width: 133px;&quot;/&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div style=&quot;background-image:url('./images/nav-bg.jpg'); height: 37px;&quot;&gt;
        &lt;div style=&quot;width:1000px; margin:0px auto;color:white;height: 37px;line-height: 37px;&quot;&gt;
            &lt;div style=&quot;float:left;margin:0px 10px;&quot;&gt;
                首页
            &lt;/div&gt;
            &lt;div style=&quot;float:left;margin:0px 10px&quot;&gt;
                联系我们
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div&gt;slidershow&lt;/div&gt;
    &lt;script src=&quot;js/jquery.min.js&quot;&gt;&lt;/script&gt;
    &lt;script src=&quot;js/bootstrap.min.js&quot;&gt;&lt;/script&gt;
    &lt;script src=&quot;js/scripts.js&quot;&gt;&lt;/script&gt;
&lt;/body&gt;

&lt;/html&gt;
                            </pre>
                        </li>
                        <li>加入slidershow后的示例代码
                            <pre>
&lt;!DOCTYPE html&gt;
&lt;html lang=&quot;en&quot;&gt;

&lt;head&gt;
    &lt;meta charset=&quot;utf-8&quot;&gt;
    &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;
    &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1&quot;&gt;
    &lt;title&gt;商业网站开发入门实验1&lt;/title&gt;
    &lt;meta name=&quot;description&quot; content=&quot;Source code generated using layoutit.com&quot;&gt;
    &lt;meta name=&quot;author&quot; content=&quot;LayoutIt!&quot;&gt;
    &lt;link href=&quot;css/bootstrap.min.css&quot; rel=&quot;stylesheet&quot;&gt;
    &lt;link href=&quot;css/style.css&quot; rel=&quot;stylesheet&quot;&gt;
&lt;/head&gt;

&lt;body&gt;
    &lt;div style=&quot;background-color: #072c87&quot;&gt;
        &lt;div style=&quot;margin:0px auto;width:1000px;height: 113px;background-image: url('./images/header.jpg')&quot;&gt;
            &lt;div style=&quot;float:left;width:500px;&quot;&gt;
            &lt;/div&gt;
            &lt;div style=&quot;float:right;width:500px;&quot;&gt;
                &lt;div style=&quot;color:white;text-align:right;&quot;&gt; 邮箱登陆 | Englist&lt;/div&gt;
                &lt;div&gt;
                    &lt;input type=&quot;text&quot; style=&quot;margin-top: 66px;margin-left: 335px;height: 21px;width: 133px;&quot; /&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div style=&quot;background-image:url('./images/nav-bg.jpg'); height: 37px;&quot;&gt;
        &lt;div style=&quot;width:1000px; margin:0px auto;color:white;height: 37px;line-height: 37px;&quot;&gt;
            &lt;div style=&quot;float:left;margin:0px 10px;&quot;&gt;
                首页
            &lt;/div&gt;
            &lt;div style=&quot;float:left;margin:0px 10px&quot;&gt;
                联系我们
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;div style=&quot;background-image: url('./images/blue_07.jpg'); height:322px&quot;&gt;
        &lt;div style=&quot;margin:0 auto; width:1000px;&quot;&gt;
            &lt;div class=&quot;carousel slide&quot; id=&quot;carousel-733302&quot;&gt;
                &lt;ol class=&quot;carousel-indicators&quot;&gt;
                    &lt;li class=&quot;active&quot; data-slide-to=&quot;0&quot; data-target=&quot;#carousel-733302&quot;&gt;
                    &lt;/li&gt;
                    &lt;li data-slide-to=&quot;1&quot; data-target=&quot;#carousel-733302&quot;&gt;
                    &lt;/li&gt;
                    &lt;li data-slide-to=&quot;2&quot; data-target=&quot;#carousel-733302&quot;&gt;
                    &lt;/li&gt;
                &lt;/ol&gt;
                &lt;div class=&quot;carousel-inner&quot;&gt;
                    &lt;div class=&quot;item active&quot;&gt;
                        &lt;img alt=&quot;Carousel Bootstrap First&quot; src=&quot;./images/pic01.jpg&quot; /&gt;
                        &lt;div class=&quot;carousel-caption&quot;&gt;
                            &lt;h4&gt;
                                First Thumbnail label
                            &lt;/h4&gt;
                            &lt;p&gt;
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            &lt;/p&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                    &lt;div class=&quot;item&quot;&gt;
                        &lt;img alt=&quot;Carousel Bootstrap Second&quot; src=&quot;./images/pic02.jpg&quot; /&gt;
                        &lt;div class=&quot;carousel-caption&quot;&gt;
                            &lt;h4&gt;
                                Second Thumbnail label
                            &lt;/h4&gt;
                            &lt;p&gt;
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            &lt;/p&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                    &lt;div class=&quot;item&quot;&gt;
                        &lt;img alt=&quot;Carousel Bootstrap Third&quot; src=&quot;./images/pic03.jpg&quot; /&gt;
                        &lt;div class=&quot;carousel-caption&quot;&gt;
                            &lt;h4&gt;
                                Third Thumbnail label
                            &lt;/h4&gt;
                            &lt;p&gt;
                                Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
                            &lt;/p&gt;
                        &lt;/div&gt;
                    &lt;/div&gt;
                &lt;/div&gt;
                &lt;a class=&quot;left carousel-control&quot; href=&quot;#carousel-733302&quot; data-slide=&quot;prev&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-chevron-left&quot;&gt;&lt;/span&gt;&lt;/a&gt; &lt;a class=&quot;right carousel-control&quot; href=&quot;#carousel-733302&quot; data-slide=&quot;next&quot;&gt;&lt;span class=&quot;glyphicon glyphicon-chevron-right&quot;&gt;&lt;/span&gt;&lt;/a&gt;
            &lt;/div&gt;
        &lt;/div&gt;
    &lt;/div&gt;
    &lt;script src=&quot;js/jquery.min.js&quot;&gt;&lt;/script&gt;
    &lt;script src=&quot;js/bootstrap.min.js&quot;&gt;&lt;/script&gt;
    &lt;script src=&quot;js/scripts.js&quot;&gt;&lt;/script&gt;
&lt;/body&gt;

&lt;/html&gt;
                            </pre>
                        </li>
                    </ol>
                </li>
             </ol>
             <h3>系统说明（选读）</h3>
                <ol>
                    <li>本系统采用php开发，使用bootstrape前端框架，thinkphp后端框架，数据库系统为mysql，前端页面交互使用angularjs</li>
                    <li>你可以访问以下地址来获取系统源代码：<a href="https://github.com/yunzhiclub/webSiteTutorial">https://github.com/yunzhiclub/webSiteTutorial</a></li>
                    <li>HTML+CSS在线学习站点：<a href="http://www.runoob.com/html/html-tutorial.html">菜鸟教程(www.runoob.com)</a>。同时，你还可以在该站点获取到PHP的内容</li>
                    <li>bootstrape thinkphp mysql 的前期学习，可以参考<a href="http://www.imooc.com">www.imooc.com（慕课网）</a>中的相关课程</li>
                    <li>bootstrape thinkphp mysql 的前期学习，还可以参考<a href="http://www.jikexueyuan.com">www.jikexueyuan.com(极客学院)</a>中的相关课程</li>
                    <li>极客学院的部分课程为收费课程，我们购买了极客学院的会员，如果你有临时使用的需求，请发送邮件至1181551049@qq.com(李甜 云智团队成员 研一在读)获取。</li>
                    <li>本系统数据库表结构如下（更新日期:2016.4.1,github对应代码标识:31d26e）：
                        <pre>
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50539
 Source Host           : localhost
 Source Database       : websitecrouse

 Target Server Type    : MySQL
 Target Server Version : 50539
 File Encoding         : utf-8

 Date: 04/01/2016 08:56:42 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `mengyunzhi_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `mengyunzhi_attachment`;
CREATE TABLE `mengyunzhi_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '附件存在服务器上的名字',
  `savename` varchar(100) NOT NULL DEFAULT '' COMMENT '附件显示名',
  `type` varchar(100) NOT NULL DEFAULT '0' COMMENT '附件类型',
  `source` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '资源ID',
  `record_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关联记录ID',
  `download` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '附件大小',
  `savepath` varchar(40) NOT NULL DEFAULT '' COMMENT '上级目录',
  `sort` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `sha1` char(40) NOT NULL DEFAULT '',
  `md5` char(32) NOT NULL DEFAULT '',
  `ext` varchar(10) NOT NULL DEFAULT '' COMMENT '扩展名',
  PRIMARY KEY (`id`),
  KEY `idx_record_status` (`record_id`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
--  Table structure for `mengyunzhi_menu`
-- ----------------------------
DROP TABLE IF EXISTS `mengyunzhi_menu`;
CREATE TABLE `mengyunzhi_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `title` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单标题名',
  `subhead` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单副标题名',
  `parent_id` int(10) DEFAULT '0' COMMENT '上级菜单id',
  `icon` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '小图标',
  `module` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '模块名',
  `controller` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '控制层名',
  `action` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '方法名',
  `parameter` varchar(60) CHARACTER SET utf8 DEFAULT '' COMMENT '参数',
  `url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT 'url',
  `order` int(10) DEFAULT '1' COMMENT '排序',
  `state` tinyint(10) DEFAULT '1' COMMENT '状态，0表示禁用，1表示启用',
  `show` tinyint(10) DEFAULT '1' COMMENT '是否显示，0表示隐藏，1表示显示 默认为1',
  `development` tinyint(10) DEFAULT '0' COMMENT '是否开放模式，1代表开放模式 默认为0',
  `remarks` varchar(40) CHARACTER SET utf8 DEFAULT '无' COMMENT '备注',
  `abstract` text CHARACTER SET utf8 COMMENT '简介',
  `dev_user` varchar(60) CHARACTER SET utf8 DEFAULT '' COMMENT '开发人员',
  `dev_time` varchar(12) CHARACTER SET utf8 DEFAULT '0' COMMENT '开发开始日期',
  `dev_branch` varchar(30) CHARACTER SET utf8 DEFAULT '' COMMENT '开发分支',
  `tables` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '关联数据表',
  `test_user` varchar(60) CHARACTER SET utf8 DEFAULT '' COMMENT '测试人员',
  `check_user` varchar(60) CHARACTER SET utf8 DEFAULT '' COMMENT '验证人员',
  `is_done` tinyint(2) unsigned DEFAULT '0' COMMENT '0未完成 1已完成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `mengyunzhi_student`
-- ----------------------------
DROP TABLE IF EXISTS `mengyunzhi_student`;
CREATE TABLE `mengyunzhi_student` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '姓名',
  `num` varchar(10) NOT NULL DEFAULT '' COMMENT '学号',
  `attachement_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '附件ID',
  `is_visitor` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0非旁听生 1旁听生',
  `class` varchar(30) NOT NULL DEFAULT '' COMMENT '班级',
  `is_registered` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0未注册，1已注册',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `mengyunzhi_user`
-- ----------------------------
DROP TABLE IF EXISTS `mengyunzhi_user`;
CREATE TABLE `mengyunzhi_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码',
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phonenumber` varchar(255) NOT NULL,
  `district` varchar(255) DEFAULT '' COMMENT '区域',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

SET FOREIGN_KEY_CHECKS = 1;

                        </pre>
                    </li>
                </ol>
            </div>
        </div>
    </div>
</block>
