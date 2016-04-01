/**
 * 修正日期2016.03
 * 修正功能：
 * 1. 将uploadify的传入参数修改为对象
 */

 /*从数组中移除元素
    sample code:
    var members = new array("zhangsan","lisi","wangwu");
    members.remove("zhangsan");
 */
 Array.prototype.remove = function() {
     var what, a = arguments,
         L = a.length,
         ax;
     while (L && this.length) {
         what = a[--L];
         while ((ax = this.indexOf(what)) !== -1) {
             this.splice(ax, 1);
         }
     }
     return this;
 };




//日期插件
var dataInit = function(){
    $('.date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,       //默认视图。2－month.
        minView: 2,         //默认提供的最精确的视图 1-day
        maxView: 4,         //向上点选时，最多能提供前后5年的选择
        forceParse: 0,
        format: 'yyyy-mm-dd'
    });
};


/**
 * uploaer 实例化
 * @param  {string} id      操作的DOM关键字
 * @param {string} url 触发的action的详细url
 * @param  {sting} btnClass 按钮额外的CLASS
 * @param  {string} formData 传送数据
 * @param  bool debug 是否启用debug调试
 * @param {string} fileTypeExts 上传附件扩展名
 * @param {int} fileSizeLimit 附件大小限制
 * @param {int} queueSizeLimit 附件队列限制
 * @param {int} uploadlimit 附件上传最大数
 * @return 
 * file 上传文件信息
 * data 后台接口返回信息
 * response 请求响应信息
 * panjie
 * update:2016.03.31
 */
 var uploader = function(config) {

    if (typeof(config) !== "object")
    {
        throw "js.js uploader error: config's type must be object";
    }
    
    config.fileObjName = "yunzhifile";         //与后台接收字段相对应，上传附件表单的name值

    if (config.uploader === undefined)
    {
        throw "js.js uploader error:don't defined url function for uploadify, or typeof url must be string";
    }

    //判断回调函数
    if (typeof(config.callback) !== 'function')
    {
        throw "js.js uploader error:don't defined callback function for uploadify, or typeof callback is not function";
    }

    //设置ID默认值
    if (config.id === undefined) {
        config.id = "file";
    }

    //如果在DOM中找不到相关元素，则抛出异常
    if ($('#' + config.id).length === 0)
    {
        throw "js.js uploader error: Can not find the element of id: " + id;
    }

    //设置btnClass默认值
    if (config.buttonClass === undefined ) {
     config.buttonClass = "btn btn-primary";
    }

    //设置按钮文字
    config.buttonText = $('#' + config.id).attr("value");

    //设置调试模式
    if (config.debug !== true)
    {
        config.debug = false;
    }

    //设置允许上传附件类型
    if (config.fileTypeExts === undefined)
    {
        config.fileTypeExts = "";
    }

    //设置上传大小限制
    if (config.fileSizeLimit === undefined)
    {
        config.fileSizeLimit = "2048000B";
    }

    //设置单次上传队列限制
    if (config.queueSizeLimit === undefined)
    {
        config.queueSizeLimit = 1;
    }

    //设置上传附件总数限制
    if (config.uploadLimit === undefined)
    {
        config.uploadLimit = 10;
    }

    if (config.removeTimeout === undefined)
    {
        config.removeTimeout = 3;       //上传后，附件回显时间
    }

    if (config.swf === undefined)
    {
        config.swf = '__ROOT__/lib/uploadify/uploadify.swf';       //设置上传swf路径
    }

    config.onUploadError  = function(file, errorCode, errorMsg, errorString) {    //设置发生错误信息
         console.log('The file ' + file.name + ' could not be uploaded: ' + errorString);
    };

    config.onUploadSuccess = function(file, data, response) {                    //设置正确返回结果
        config.callback(file, JSON.parse(data), response);
    };

    console.log(config);
    $('#' + config.id).uploadify(config); //实例化
 };

 //只能输入整数
function onlyInteger(obj) {
    var curVal = obj.value + '';
    if(curVal.length > 1) {
        var filterValue = obj.value.replace(/[^\d]/g,'').replace(/^0\d*$/g,'');
        if(obj.value != filterValue) {
            obj.value = filterValue;
        }
    } else {
        obj.value = obj.value.replace(/\D/g,'');
    }
}

//只能输入2位金额
function onlyMoney(obj) {
    var curVal = obj.value + '';
    if(curVal.length > 1) {
        var filterValue = obj.value.replace(/^\D*(\d*(?:\.\d{0,2})?).*$/g, '$1').replace(/^0(\d{1,10}(?:\.\d{0,2})?)*$/g, '');
        if(obj.value != filterValue) {
            obj.value = filterValue;
        }
    } else {
        obj.value = obj.value.replace(/\D/g,'');
    }
}
//只能输入3位重量
function onlyWeight(obj) {
    var curVal = obj.value + '';
    if(curVal.length > 1) {
        var filterValue = obj.value.replace(/^\D*(\d*(?:\.\d{0,3})?).*$/g, '$1').replace(/^0(\d{1,10}(?:\.\d{0,3})?)*$/g, '');
        if(obj.value != filterValue) {
            obj.value = filterValue;
        }
    } else {
        obj.value = obj.value.replace(/\D/g,'');
    }
}
//参数说明：num 要格式化的数字 n 保留小数位
function formatMoney(num,n) {  
    if(num&&n){
        num=parseFloat(num);
        num=String(num.toFixed(n));
        var re=/(-?\d+)(\d{3})/;
        while(re.test(num)) 
        num=num.replace(re,"$1,$2")
        return num; 
    }else{
        return "0.00";
    }
}

//分转元
function fToy(money) {
    return (parseFloat(money).div(100));
}

//元转分
function yTof(money) {
    return (parseFloat(money).mul(100));
}

//除法函数，用来得到精确的除法结果
//说明：javascript的除法结果会有误差，在两个浮点数相除的时候会比较明显。这个函数返回较为精确的除法结果。
//调用：accDiv(arg1,arg2)
//返回值：arg1除以arg2的精确结果
function accDiv(arg1,arg2){
    var t1=0,t2=0,r1,r2;
    try{t1=arg1.toString().split(".")[1].length}catch(e){}
    try{t2=arg2.toString().split(".")[1].length}catch(e){}
    with(Math){
        r1=Number(arg1.toString().replace(".",""))
        r2=Number(arg2.toString().replace(".",""))
        return (r1/r2)*pow(10,t2-t1);
    }
}

//给Number类型增加一个div方法，调用起来更加方便。
Number.prototype.div = function (arg){
    return accDiv(this, arg);
}

//乘法函数，用来得到精确的乘法结果
//说明：javascript的乘法结果会有误差，在两个浮点数相乘的时候会比较明显。这个函数返回较为精确的乘法结果。
//调用：accMul(arg1,arg2)
//返回值：arg1乘以 arg2的精确结果
function accMul(arg1,arg2)
{
    var m=0,s1=arg1.toString(),s2=arg2.toString();
    try{m+=s1.split(".")[1].length}catch(e){}
    try{m+=s2.split(".")[1].length}catch(e){}
    return Number(s1.replace(".",""))*Number(s2.replace(".",""))/Math.pow(10,m)
}

// 给Number类型增加一个mul方法，调用起来更加方便。
Number.prototype.mul = function (arg){
    return accMul(arg, this);
}

function accDiv(arg1, arg2) {
    var t1 = 0, t2 = 0, r1, r2;
    try { t1 = arg1.toString().split(".")[1].length } catch (e) { }
    try { t2 = arg2.toString().split(".")[1].length } catch (e) { }
    with (Math) {
        r1 = Number(arg1.toString().replace(".", ""))
        r2 = Number(arg2.toString().replace(".", ""))
        return (r1 / r2) * pow(10, t2 - t1);
    }
}
//给Number类型增加一个div方法，调用起来更加方便。
Number.prototype.div = function(arg) {
    return accDiv(this, arg);
}
function accMul(arg1, arg2) {
    var m = 0, s1 = arg1.toString(), s2 = arg2.toString();
    try { m += s1.split(".")[1].length } catch (e) { }
    try { m += s2.split(".")[1].length } catch (e) { }
    return Number(s1.replace(".", "")) * Number(s2.replace(".", "")) / Math.pow(10, m)
}
Number.prototype.mul = function(arg) {
    return accMul(arg, this);
}
function accAdd(arg1, arg2) {
    var r1, r2, m, c;
    try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
    c = Math.abs(r1 - r2);
    m = Math.pow(10, Math.max(r1, r2))
    if (c > 0) {
        var cm = Math.pow(10, c);
        if (r1 > r2) {
            arg1 = Number(arg1.toString().replace(".", ""));
            arg2 = Number(arg2.toString().replace(".", "")) * cm;
        } else {
            arg1 = Number(arg1.toString().replace(".", "")) * cm;
            arg2 = Number(arg2.toString().replace(".", ""));
        }
    } else {
        arg1 = Number(arg1.toString().replace(".", ""));
        arg2 = Number(arg2.toString().replace(".", ""));
    }
    return (arg1 + arg2) / m
}
Number.prototype.add = function(arg) {
    return accAdd(arg, this);
}

//排序方法
function compareInt(x, y){
    var iNum1 = parseInt(x[0]);//强制转换成int型;
    var iNum2 = parseInt(y[0]);
    if(iNum1 < iNum2){
        return -1;
    }else if(iNum1 > iNum2){
        return 1;
    }else{
        return 0;
    }
}
