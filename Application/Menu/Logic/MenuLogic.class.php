<?php
/**
 * 菜单管理logic
 */
namespace Menu\Logic;

use Menu\Model\MenuModel;

class MenuLogic extends MenuModel
{
	public function getListByIsDev($module="Admin", $IsDev = null)
	{
		$map = array();
		if ($IsDev !== null)
		{
			$map['is_dev'] = $IsDev;
		}
		$map['module'] = $module;
		return $this->getMenuTree(null,$map,1,2);
	}

	/**
	 * 获取当前菜单的面包屑信息。
	 * 必须保证每条菜单的最原始根菜单是一级菜单，否则将返回false
	 * @return list 
	 * panjie
	 */
	public function getBreadCrumbs()
	{
		//获取当前菜单数据 
		if (!$menu = $this->getCurrentMenu())
		{
			$this->setError("MenuL:The action is not set in menu table(未找到当前action的相当记录)");
			return false;
		}

		//获取当前菜单数据的上级、上上级菜单
		$menus = array();
		$menus[] = $menu;
		while ($menu['parent_id'] != '0')
		{
			if (!$menu = $this->getListById($menu['parent_id']))
			{
				$this->setError("MenuL:The action's parent menu is not set in menu table(未找到当前菜单的上级菜单)");
				return false;
			}
			$menus[] = $menu;
		}
		return $menus;
	}

	/**
	 * 获取当前菜单的列表数据
	 * @return list
	 * panjie
	 */
	public function getCurrentMenu()
	{
		//获取当前菜单
		$map = array();
		$map['module'] 		= MODULE_NAME;
		$map['controller'] 	= CONTROLLER_NAME;
		$map['action'] 		= ACTION_NAME;

		return $this->where($map)->find();
	}
		
		
}