<?php
namespace Home\Controller;

use Attachment\Logic\AttachmentLogic;

Use Think\Controller;

class UploadController extends Controller
{
    public function __construct()
    {
        parent::__construct();

        //规避macos中，FF使用swf未成功传入cookie的问题.
        //对该问题的阐述，请参见：
        //http://www.mengyunzhi.com/share/javascript/208-php-uploadify-uploadify-http-status-302.html
        session_destroy();
        session_id($_POST['PHPSESSID']);
        session_start();

        //判断用户是否登陆
        if (session('student') === null)
        {
            $result = array();
            $result['status'] = "ERROR";
            $result['message'] = "Plz login first";
            $this->ajaxReturn($result);
            return;
        }
        else
        {
            session('student', session('student'));
        }
    }
    /**
     * 图片上传接口
     * @return [type] [description]
     */
    public function uploadImageAction()
    {
        $AttachmentL = new AttachmentLogic();
        $attachment = $AttachmentL->upload("uploadimage");
        $this->ajaxReturn($attachment);
    }

    /**
     * 投交作业 附件接口
     * @return json
     */
    public function uploadWorkAction()
    {

    }
}