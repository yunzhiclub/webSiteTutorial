<?php
/**
 * admin 根类
 */
namespace Admin\Model\Admin;

use Menu\Logic\MenuLogic; 	//菜单

class ConstructModel
{
	protected $menuLists; //菜单列表
	protected $breadCrumbs = null; 	//当前菜单对应的面包屑
	public function getMenuLists($module = "Admin")
	{
		$MenuL = new MenuLogic();
		$menus = $MenuL->getListByIsDev($module);
		return $menus;
	}

	/**
	 * 获取面包屑数据
	 * 返回的数组中，第0个数据，是当前菜单数据
	 * @return lists 
	 */
	public function getBreadCrumbs()
	{
		if ($breadCrumbs === null)
		{
			$MenuL = new MenuLogic();
			$this->breadCrumbs = $MenuL->getBreadCrumbs();
		}
		return $this->breadCrumbs;
	}

	/**
	 * 检测传入的菜单LIST是否位于整个面包屑上
	 * @param   $list 
	 * @return 是返回true 否false       
	 * panjie 2016-01
	 */
	public function checkIsCurrent($list)
	{
		//不存在id则直接返回
		if (!isset($list['id']))
		{
			return false;
		}

		//获取面包屑信息并遍历，如果找到值，返回true，否则false
		$id = $list['id'];
		$breadCrumbs = $this->getBreadCrumbs();
		foreach($breadCrumbs as $key => $value)
		{
			if ($value['id'] == $id)
			{
				return true;
			}
		}

		return false;

	}

}