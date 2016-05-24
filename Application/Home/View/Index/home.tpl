<extend name="Base:index" />
<block name="wrapper">
    <div class="row-fluid">
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <h3>最后一次上机实验</h3>
                <hr />
                <h4>实验步骤</h4>
                <ol>
                  <li>注册SAE</li>
                  <li>在SAE中建立新的应用。选择空应用，版本控制选择svn.</li>
                  <li>用"名字全拼学号"注册二级域名(名称如果过长或已占用，可以用其它名字)</li>
                  <li>将前几次实验中的代码及相关文件，上传至SAE</li>
                  <li>在SAE中，结合自己能力，最大程序的模仿学校官网</li>
                  <li>在<a href="{:U('student/sae')}">SAE域名提交</a>中,提交自己的域名（比如:http://1.mengyunzhi.applinzi.com/）.</li>
                  <li>
                  注意事项：
                    <ol>
                      <li>系统将在2周后关闭</li>
                      <li>在规定的时间内，未提交SAE域名视作业未完成，0分。</li>
                      <li>密码遗忘的，可发送邮件至3792535@qq.com，请求重置</li>
                      <li>其它问题，可以在周一至周五小窗至群值班小组长</li>
                      <li>在编程的道路上，有任何问题，欢迎在群中与我们交流</li>
                    </ol>
                  </li>
                  <li>祝每人都能取得一个理想的成绩!</li>
                </ol>

                <hr />
                <h3>第三次上机实验</h3>
                <hr />
                <h4>实验步骤</h4>
                <ol>
                    <li>
                        打开计算中心本地地址，如：10.1.7.XXX（该地址上课后，老师会给出），下载相关软件。
                    </li>
                    <li>
                        打开codepen.io, 以slidershow为关键字，进行搜索。
                    </li>
                    <li>找到第二页的A Pen by Fang, 点击查看</li>
                    <li>在上节课的HTML代码的基础上新建一个盒子(该盒子用来放 幻灯片)<br />
                        <pre>
&lt;!--第三个盒子开始--&gt;
&lt;div&gt;
&lt;/div&gt;
&lt;!--第三个盒子结束--&gt;
                        </pre>
                    </li>

                    <li>复制A Pen by Fang中的html代码。将其粘贴到刚刚新建的盒子内<br />
                    <pre>
&lt;div class=&quot;slidershow&quot;&gt;
    &lt;div class=&quot;container&quot;&gt;
        &lt;ul&gt;
            &lt;li&gt;
                &lt;a href=&quot;#&quot;&gt;
                    &lt;img src=&quot;http://www.17buyfood.com.tw/templates/17buyfood.com.tw/images/big_banner_001.jpg&quot; alt=&quot;one&quot; /&gt;
                    &lt;h5&gt;加進去的東西&lt;/h5&gt;
                &lt;/a&gt;
            &lt;/li&gt;
            &lt;li&gt;
                &lt;a href=&quot;#&quot;&gt;
                    &lt;img src=&quot;http://www.17buyfood.com.tw/templates/17buyfood.com.tw/images/big_banner_002.jpg&quot; alt=&quot;one&quot; /&gt;
                    &lt;h5&gt;圖片大小規格&lt;/h5&gt;
                &lt;/a&gt;
            &lt;/li&gt;
            &lt;li&gt;
                &lt;a href=&quot;#&quot;&gt;
                    &lt;img src=&quot;http://www.17buyfood.com.tw/templates/17buyfood.com.tw/images/big_banner_003.jpg&quot; alt=&quot;one&quot; /&gt;
                    &lt;h5&gt;專屬平台&lt;/h5&gt;
                &lt;/a&gt;
            &lt;/li&gt;
        &lt;/ul&gt;
    &lt;/div&gt;
&lt;/div&gt;
&lt;!--.slidershow--&gt;

                    </pre>
                    </li>
                    <li>在&lt;/body&gt;&lt;/html&gt;这间增加&lt;style type=&quot;text/css&quot;&gt;&lt;/style&gt;用来放置CSS代码
                    
                    </li>
                    <li>复制A Pen by Fang中的css代码，将其粘贴到style type=&quot;text/css&quot;&gt;&lt;/style&gt;之间。
                    <pre>
&lt;/body&gt;
&lt;style type=&quot;text/css&quot;&gt;
.slidershow ul, li {
    padding:0;
    margin:0;
    border:0;
}
.container {
    width:1100px;
    height:333px;
    margin:0px auto;
    overflow:hidden;
}
.container ul {
    width:3300px; 
    list-style:none;
    position:relative;
    left:0;
    -webkit-animation: slide 16s 0s linear infinite;
    -moz-animation: slide 16s 0s linear infinite;
    -ms-animation: slide 16s 0s linear infinite;
    -o-animation: slide 16s 0s linear infinite;
    animation: slide 16s 0s linear infinite;
}
.container ul li {
    position:relative;
    left:0px;
    float:left;
    padding:0px;
    margin:0px;
}
.container ul, .container h5 {
  -webkit-animation-iteration-count: infinite;
  -webkit-animation-timing-function: ease-out;
}

.container ul:hover, .container ul:hover h5{
  -webkit-animation-play-state:paused;
  animation-play-state: paused;
} /*mouse paused*/

.container a{
  text-decoration: none;
} 
.container h5 {
    background:rgba(0, 0, 0, 0.5);
    position:absolute;
    bottom:2px;
    width:100%;
    padding: 10px; 
    color:#fff;
    font-size: 1.25rem; 
    text-align:left;
    margin-bottom:0px;
    letter-spacing: 0.15rem;
    font-family: Microsoft JhengHei;
    /**nimation: headings 4s infinite;**/
}
@-webkit-keyframes slide {
    25% {
        left:0px; /**first**/
    }
    31.25%, 56.25% {
        left:-1100px; /**second**/
    }
    62.5%, 87.5% {
        left:-2200px; /**third**/
    }
    93.75%{
      left: 0;/**end**/
    }
}
@keyframes slide {
    25% {
        left:0px; /**first**/
    }
    31.25%, 56.25% {
        left:-1100px; /**second**/
    }
    62.5%, 87.5% {
        left:-2200px; /**third**/
    }
    93.75%{
      left: 0;/**end**/
    }
}
/**@keyframes slide {
    10% {
        left:0px;
    }
    15%, 30% {
        left:-700px;
    }
    35%, 50% {
        left:-1400px;
    }
    55%, 70% {
        left:-2100px;
    }
    75%, 90% {
        left:-2800px;
    }
   93% {
   left: 0;
}
}
@keyframes headings {
  0%,10%, 15%,30%,35%,50%,55%,70%,75%,90%,100%{
    bottom: 0px;
  }
  
   13%,33%,53%,73%,93% {
     bottom: -100%;
   }
 }**/
&lt;/style&gt;
&lt;/html&gt;
                    </pre>
                    
                    </li>
                    <li>修改粘贴过来的html代码中的图片地址为本地图片地址，例：<br />
                    修改前：
                    <pre>
                    &lt;img src=&quot;http://www.17buyfood.com.tw/templates/17buyfood.com.tw/images/big_banner_001.jpg&quot; alt=&quot;one&quot; /&gt;
                    </pre>
                    修改后：
                    <pre>
                    &lt;img src=&quot;images/pic01.jpg&quot; alt=&quot;one&quot; /&gt;
                    </pre>
                    </li>
                    <li>修改粘贴过来的css代码中的宽度与高度为本地图片宽度与高度。比如将1100，修改为1000，把333修改为。。。</li>
                    <li><span class="text-danger">本项选做:</span>尝试在codepen.io中查找其它示例代码，自行进行修改.比如我们以slider为关键字，找到以下代码：<br />HTML：
                    <pre>
&lt;div id=&quot;slider-wrapper&quot;&gt;
  &lt;div class=&quot;inner-wrapper&quot;&gt;
    &lt;input checked type=&quot;radio&quot; name=&quot;slide&quot; class=&quot;control&quot; id=&quot;Slide1&quot; /&gt;
    &lt;label for=&quot;Slide1&quot; id=&quot;s1&quot;&gt;&lt;/label&gt;
    &lt;input type=&quot;radio&quot; name=&quot;slide&quot; class=&quot;control&quot; id=&quot;Slide2&quot; /&gt;
    &lt;label for=&quot;Slide2&quot; id=&quot;s2&quot;&gt;&lt;/label&gt;
    &lt;input type=&quot;radio&quot; name=&quot;slide&quot; class=&quot;control&quot; id=&quot;Slide3&quot; /&gt;
    &lt;label for=&quot;Slide3&quot; id=&quot;s3&quot;&gt;&lt;/label&gt;
    &lt;input type=&quot;radio&quot; name=&quot;slide&quot; class=&quot;control&quot; id=&quot;Slide4&quot; /&gt;
    &lt;label for=&quot;Slide4&quot; id=&quot;s4&quot;&gt;&lt;/label&gt;
    &lt;div class=&quot;overflow-wrapper&quot;&gt;
      &lt;a class=&quot;slide&quot; href=&quot;&quot;&gt;&lt;img src=&quot;http://placehold.it/940x470&quot; /&gt;&lt;/a&gt;
      &lt;a class=&quot;slide&quot; href=&quot;&quot;&gt;&lt;img src=&quot;http://placehold.it/940x470&quot; /&gt;&lt;/a&gt;
      &lt;a class=&quot;slide&quot; href=&quot;&quot;&gt;&lt;img src=&quot;http://placehold.it/940x470&quot; /&gt;&lt;/a&gt;
      &lt;a class=&quot;slide&quot; href=&quot;&quot;&gt;&lt;img src=&quot;http://placehold.it/940x470&quot; /&gt;&lt;/a&gt;
    &lt;/div&gt;
  &lt;/div&gt;
&lt;/div&gt;
                    </pre>
                    CSS:
                    <pre>
#slider-wrapper {
  width: 940px;
  height: 470px;
  margin: 50px auto;
  position: relative;
  margin-bottom: 0px;
  background: rgba(0, 0, 0, 0.5);
  overflow: hidden;
}

#s1 {
  padding: 6px;
  background: #000000;
  position: absolute;
  left: 50%;
  bottom: 25px;
  margin-left: -36px;
  border-radius: 20px;
  opacity: 0.3;
  cursor: pointer;
  z-index: 999;
}

#s2 {
  padding: 6px;
  background: #000000;
  position: absolute;
  left: 50%;
  bottom: 25px;
  margin-left: -12px;
  border-radius: 20px;
  opacity: 0.3;
  cursor: pointer;
  z-index: 999;
}

#s3 {
  padding: 6px;
  background: #000000;
  position: absolute;
  left: 50%;
  bottom: 25px;
  margin-left: 12px;
  border-radius: 20px;
  opacity: 0.3;
  cursor: pointer;
  z-index: 999;
}

#s4 {
  padding: 6px;
  background: #000000;
  position: absolute;
  left: 50%;
  bottom: 25px;
  margin-left: 36px;
  border-radius: 20px;
  opacity: 0.3;
  cursor: pointer;
  z-index: 999;
}

#s1:hover,
#s2:hover,
#s3:hover,
#s4:hover {
  opacity: .50;
}

.inner-wrapper {
  width: 940px;
  height: 470px;
  position: absolute;
  top: 0;
  left: 0;
  margin-bottom: 0px;
  overflow: hidden;
}

.control {
  display: none;
}

#Slide1:checked ~ .overflow-wrapper {
  margin-left: 0%;
}

#Slide2:checked ~ .overflow-wrapper {
  margin-left: -100%;
}

#Slide3:checked ~ .overflow-wrapper {
  margin-left: -200%;
}

#Slide4:checked ~ .overflow-wrapper {
  margin-left: -300%;
}

#Slide1:checked + #s1 {
  opacity: 1;
}

#Slide2:checked + #s2 {
  opacity: 1;
}

#Slide3:checked + #s3 {
  opacity: 1;
}

#Slide4:checked + #s4 {
  opacity: 1;
}

.overflow-wrapper {
  width: 400%;
  height: 100%;
  position: absolute;
  top: 0;
  left: 0;
  overflow-y: hidden;
  z-index: 1;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -o-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

.slide img {
  width: 25%;
  float: left;
}                    
                    </pre></li>
                    <li>上传作业文件</li>
                </ol>
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
                    <li>在解压后的src文件夹下，新建images文件夹，将有用的图片下载至该文件夹</li>
                    <li>找开src文件夹下的index.html,双击使用系统自带的浏览器打开。</li>
                    <li>右键index.html, 并使用自己喜欢的编辑器（dreamweaver,editplus,sublime等）进行编辑</li>
                    <li>找到title与/title(第8行），将原有的"Bootstrap 3, from LayoutIt!"删除掉，替换成自己的姓名+学号.比如：张三+10000</li>
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
                                    <li>如果达到了预期效果，那么恭喜你！你的运气真的很适合与代码打交道。</li>
                                    <li>如果没有，同样也恭喜你，因为排错本身也是一种快乐。当错误被排出的那个瞬间，你将体会到编程中最大的幸福。</li>
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
                    <li>极客学院的部分课程为收费课程，我们购买了极客学院的会员，如果你有临时使用的需求，请发送邮件至1454179583@qq.com(刘茜 计算机研一在读)获取。</li>
                    <li>本系统数据库表结构如下（更新日期:2016.4.5,github对应代码标识:98c2c37）：
                        <pre>
/*
 Navicat Premium Data Transfer

 Source Server         : websitecrouse
 Source Server Type    : MySQL
 Source Server Version : 50616
 Source Host           : 127.0.0.1
 Source Database       : websitecrouse

 Target Server Type    : MySQL
 Target Server Version : 50616
 File Encoding         : utf-8

 Date: 04/05/2016 15:06:24 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

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
  `attachment_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '附件ID',
  `is_visitor` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0非旁听生 1旁听生',
  `class` varchar(30) NOT NULL DEFAULT '' COMMENT '班级',
  `is_registered` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '0未注册，1已注册',
  `password` varchar(40) NOT NULL DEFAULT '' COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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

-- ----------------------------
--  Table structure for `mengyunzhi_work`
-- ----------------------------
DROP TABLE IF EXISTS `mengyunzhi_work`;
CREATE TABLE `mengyunzhi_work` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attachment_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '附件ID',
  `index` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '作业序号',
  `student_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;


                        </pre>
                    </li>
                </ol>
            </div>
        </div>
    </div>
</block>
