<?php
/**
 * ueditor后台对接接口。
 * uploader后台，已迁移至attachment。
 * 该模块现仅供ueditor使用.
 * panjie
 */
namespace Yunzhi\Controller;

use Think\Controller;

class UeditorController extends Controller{
	public function indexAction()
	{
		$userId 	= 0;
		
		//获取配置信息
		$configFile = APP_PATH . "Yunzhi/Conf/ueditor.json";
		$config = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents($configFile)), true);
		$file = $_FILES['yunzhifile'];
		$Ueditor = new \Org\Util\Ueditor($userId, $config);
		$jsonData = $Ueditor->output();
		echo $jsonData;
	}
}