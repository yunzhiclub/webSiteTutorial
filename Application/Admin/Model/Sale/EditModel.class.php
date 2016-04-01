<?php
/*
 添加出房
 panjie
 2015-12-30
 */
namespace Admin\Model\Sale;

use Room\Logic\RoomLogic;		//房型

class EditModel
{
	//获取正常的房型列表
	public function getRooms()
	{
		$RoomL = new RoomLogic();
		if($rooms = $RoomL->getAllLists())
		{
			return $rooms;
		}
		return array();
	}
}