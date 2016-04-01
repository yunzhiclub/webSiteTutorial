<?php
namespace Admin\Controller;

use Think\Controller;
use Admin\Model\Admin\ConstructModel;
use Menu\Logic\MenuLogic;					//菜单

class AdminController extends Controller
{
	public function __construct()
	{
		parent::__construct();

		// //判断登陆状态
		// $userId = session("userId");
		// if ($userId === null)
		// {
		// 	redirect_url(U('Index/index'));
		// 	return;
		// }
		// else
		// {
		// 	session("userId", session("userId"));
		// }

		//取当前ACTION，判断是否存在于菜单表中，不存在，开发模式时，直接跳转到菜单管理的添加
		//非开发模式时，直接跳转到报错界面
		$MenuL = new MenuLogic();
		if (!$menu = $MenuL->getCurrentMenu())
		{
			if (APP_DEBUG)
			{
				$this->redirect('Menu/add', array("module" => MODULE_NAME, "controller" => CONTROLLER_NAME, "action" => ACTION_NAME), 3, 'Plase add the action in Menu Management');
				exit();
			}
			else
			{
				$this->error("你访问的界面不存在");
				exit();
			}
		}
		

		//取左侧菜单数据	
		$ConstructM = new ConstructModel();
		$this->assign("YunzhiMenuM", $ConstructM);

		//取左侧菜单
		$tpl = T("Admin@Admin/nav");
		$YZ_TEMPLATE_NAV = $this->fetch($tpl);
		$this->assign("YZ_TEMPLATE_NAV", $YZ_TEMPLATE_NAV);

	}
}
