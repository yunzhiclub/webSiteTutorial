<?php
namespace Admin\Controller;
use Admin\Controller;
use Yunzhi\Logic\PHPExcelLogic;
use Yunzhi\Logic\ZipLogic;

class IndexController extends AdminController {
    
    //登陆页
    public function indexAction(){
        $this->display();
    }

    //首页
    public function homeAction()
    {
        $this->display();
    }
}
