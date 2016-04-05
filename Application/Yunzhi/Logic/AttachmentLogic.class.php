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
	 * 附件上传接口。
	 * 附件上传信息需放在 $_FILES['yunzhifile'] 中
	 * @return list 附件上传后的信息
	 * panjie
	 * 
	 * 示例代码：
	 * 前台：<input name="yunzhifile" type="file" multiple="true" value="上传图片" />
	 * 后台：
	 * $AttachmentL = new Attachment\Logic\AttachmentLogic();
     * $attachment = $AttachmentL->upload();
     *
     * 返回值示例： 成功
     * ["state"]=>
	 * string(7) "SUCCESS":成功。 "ERROR"：失败.
	 * ["url"]=> 用于回显的图片URL
	 * string(61) "/websitecrouse/Public/uploads/file/20160401/56fdfb7ea5ad4.jpg" 
	 * ["title"]=> 附件存在服务器上的名称
	 * string(13) "56fdfb7ea5ad4"
	 * ["original"]=> 附件原始名称
	 * string(24) "邮益宝申请单-1.jpg"
	 * ["type"]=> 附件类型
	 * string(10) "image/jpeg"
	 * ["size"]=> 附件大小
	 * int(848261)
	 * ["name"]=> 附件原始名称
	 * string(24) "邮益宝申请单-1.jpg"
	 * ["md5"]=> 
	 * string(32) "0e4e88add6581e5d299774f42c7fa102"
	 * ["sha1"]=>
	 * string(40) "0864784d78f1d3c794a0aaf263678cc205227d97"
	 * ["key"]=>
	 * int(0)
	 * ["ext"]=> 扩展名
	 * string(3) "jpg"
	 * ["savename"]=> 服务器存的名称
	 * string(13) "56fdfb7ea5ad4"
	 * ["savepath"]=> 相对于上传文件夹的保存路径
	 * string(15) "/file/20160401/"
	 * ["id"]=> 附件ID
	 * string(2) "19"
	 * sreate_time:创建时间
	 * download:下载次数
	 * record_id:关联ID
	 * sort:排序
	 * update_time:更新时间
	 * 返回示例：失败
	 * 
	 */
	public function upload($action = "", $config = array()) 
    {   
    	C('TOKEN_ON',false); //关闭令牌
    	if ($action == "")
    	{
    		$action = I('get.action') === "" ? "uploadfile" : I('get.action');
    	}

		//获取配置信息, 同时拼接传入配置信息
		$configFile = APP_PATH . "Yunzhi/Conf/ueditor.json";
		$config = array_merge(json_decode(preg_replace("/\/\*[\s\S]+?\*\//", "", file_get_contents($configFile)), true), $config);

		//实例化ueditor,使用ueditor提供的封装类，进行上传操作.
		$Ueditor 		= new \Org\Util\Ueditor($config, $action);
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
				$data['state'] = "ERROR";
				$data['message'] = "Attachment save error, msg:" . $this->getError();
			}
			
		}
		return $data;
    }    

    /**
     * 通过ID获取附件的URL地址
     * @param  int $id 
     * @return string    url地址，
     * todo:我们将系统默认显示的图片放在这里
     */
    public function getUrlById($id)
    {
    	$id = (int)$id;
    	$list = $this->getListById($id);
    	if ($list == null)
    	{
    		return false;
    	}
    	else
    	{
    		return C("TMPL_PARSE_STRING.__UPLOADS__") . $list['savepath'] . $list['savename'] . '.'. $list['ext'];
    	}
    }

    /**
     * 通过ID获取文件内容(ascii编码)
     * @param  int $id 
     * @return string 含有ascii编码的文本
     * 2016.04
     */
    public function getTextById($id)
    {
    	//获取附件信息
    	$attachment = $this->getListById($id);
    	if ($attachment == null)
    	{
    		$this->setError("$id list can't found");
    		return false;
    	}

    	//拼接服务器路径
    	$path = I('server.DOCUMENT_ROOT');
    	$filePath = $path . C('TMPL_PARSE_STRING.__UPLOADS__') . $attachment['savepath'] . $attachment['savename'] . '.' . $attachment['ext'];
    	
    	//调用内置类，获取文件信息
    	try
    	{
    		$text = "";
    		$File = new \SplFileObject($filePath);
	    	while (!$File -> eof())
	    	{
	    		$text .= $File->fgets();
	    	}
	    	return $text;
    	}
    	catch(\Exception $e)
    	{
    		$this->setError("Error:" . $e->getMessage());
    		return false;
    	}
    }
}