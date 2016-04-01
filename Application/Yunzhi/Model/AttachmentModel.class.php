<?php
/**
 * 附件管理
 * panjie
 */
namespace Yunzhi\Model;

Class AttachmentModel extends YunzhiModel
{
	protected $_auto = array(
		array("create_time", "time", 1, "function"),
		array("update_time", "time", 2, "function")
		);
}