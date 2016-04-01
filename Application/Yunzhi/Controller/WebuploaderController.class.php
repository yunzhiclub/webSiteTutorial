<?php
namespace Yunzhi\Controller;

use Think\Controller;

class WebuploaderController extends Controller
{
    public function configAction() {
        $this->display("config.js");
    }
    
    public function uploadAction() 
    {   
		$userId 	= I('session.userId');
		$configFile = APP_PATH . "Yunzhi/Conf/ueditor.json";
		$data 		= new \Org\Util\Ueditor($userId, $configFile);
		echo $data->output();
    }
        
}
