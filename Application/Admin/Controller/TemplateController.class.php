<?php
/**
 * 后台模板
 */
namespace Admin\Controller;

use Think\Controller;

class TemplateController extends Controller{
	public function __construct()
	{
		parent::__construct();

		//取左侧菜单
		$tpl = T("Admin@Template/nav");
		$YZ_TEMPLATE_NAV = $this->fetch($tpl);
		$this->assign("YZ_TEMPLATE_NAV", $YZ_TEMPLATE_NAV);
	}
}