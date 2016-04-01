<?php

namespace Admin\Controller;

use User\Logic\UserLogic;	//用户表

class PersonalCenterController extends AdminController
{
	public function editAction()
	{	
		//实例化
		$userId 	= get_user_id();
		$UserLogic 	= new UserLogic();
		$user 		= $UserLogic->getListById($userId);

		//传值
		$this->assign("user", $user);
		$this->display();
	}

	/**
	 * 保存密码
	 * @return [type] [description]
	 */
	public function saveAction()
	{

		$UserLogic 	= new UserLogic();
		if (Count($UserLogic->updateList(I('post.'))->getErrors()) > 0)
		{
			$this->error("错误信息:" . $UserLogic->getError(), U('edit'));
			return;
		}
		$this->success("操作成功!", U('edit'));

	}
}