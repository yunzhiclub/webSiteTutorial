<?php
/**
 * 附件管理
 * 实际附件上传的统一入口
 */
namespace Yunzhi\Controller;

use Think\Controller;
use Yunzhi\Logic\AttachmentLogic;

class AttachmentController extends Controller
{
    public function configAction() {
        $this->display("config.js");
    }
    
        
}
