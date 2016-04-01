<?php
/**
 * 附件LOGIC
 */
namespace Yunzhi\Logic;

use Yunzhi\Model\AttachmentModel;

class AttachmentLogic extends AttachmentModel
{
	/**
	 * 返回以SHA1 MD5 RECORDID查询返回的记录
	 * @param  [string] $sha1    
	 * @param  [string] $md5     
	 * @param  [int] $recordId 记录ID
	 * @return [list]    成功则返回一维数据 ， 不存在数据，则返回NULL
	 */
	public function getListBySha1Md5RecoredId($sha1, $md5, $recordId = null)
	{
		if (strlen($sha1) != 40 || strlen($md5) != 32)
		{
			return false;
		}

		$map = array();
		$map['sha1'] = $sha1;
		$map['md5'] = $md5;
		$map['record_id'] = $recordId;

		return $this->where($map)->find();
	}

	/**
	 * 新增记录
	 * 如果返回了id，证明为关联记录。
	 * 则做为关联附件进行新增
	 * @param   $list 
	 * @return 成功，附件ID，失败 FALSE
	 */
	public function addRecordList($list)
	{
		$data = array();
		$data['record_id']	= isset($list['id']) ? $list['id'] : 0;			//附件关联ID，表示两个附件是相同的
		$data['uid'] 		= 0;					//TODO：上传用户ID
		$data['name']		= $list['name'];		//文件原始名
		$data['savename']	= $list['savename'];	//文件保存到服务器上的名称
		$data['type'] 		= $list['type'];		//文件类型
		$data['size'] 		= $list['size'];		//文件大小
		$data['savepath'] 	= $list['savepath'];	//文件保存路径
		$data['sha1'] 		= $list['sha1'];		//sha1值
		$data['md5'] 		= $list['md5'];			//md5值
		$data['ext'] 		= $list['ext'];			//扩展名
		return parent::saveList($data);
	}

	/**
	 * 通过附件IDS，返回附件的URL信息
	 * @param  string $idsString 字符串 "1,2,3,4"
	 * @return lists               二维数组
	 */
	public function getListsByStringIds($idsString , $delimiter = ",")
	{
		$datas = array();
		$ids = explode($delimiter, $idsString);
		foreach ($ids as $id)
		{
			$datas["$id"] = $this->getListById($id);
		}
		return $datas;
	}

	/**
	 * 通过附件ID,返回附件信息
	 * @param  int $attachmentId 附件ID
	 * @return list               一组数组，其中附件的URL，用绝对地址进行了拼接
	 */
	public function getListById($id)
	{
		$data = parent::getListById($id);
		if ($data)
		{
			$data['url'] = __ROOT__ . "/uploads" . $data['savepath'] . $data['savename'];
			return $data;
		}
		else
		{
			return array();
		}
	}

	/**
	 * 附件上传
	 * 传入$_FILE['yunzhifile']
	 * @return list 附件上传后的信息
	 * panjie
	 */
	public function upload() 
    {   
    	C('TOKEN_ON',false); //关闭令牌
    	if (I('get.action') == "")
    	{
    		$_GET['action'] = "uploadfile";
    	}
		$userId 	= 0;

		//获取配置信息
		$configFile = APP_PATH . "Yunzhi/Conf/ueditor.json";
		$config = json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents($configFile)), true);
		
		$Ueditor 		= new \Org\Util\Ueditor($userId, $config);
		$data = $Ueditor->getResult();

		//返回成功，写入数据库
		if ($data['state'] == "SUCCESS")
		{
			if ($id = $this->addRecordList($data))
			{
				$data['id'] = $id;
			}
			else
			{
				$data['state'] = "Attachment save error, msg:" . $this->getError();
			}
			
		}
		return $data;
    }    
}