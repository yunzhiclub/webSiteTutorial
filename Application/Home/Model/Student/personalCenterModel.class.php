<?php
/**
 * 个人中心
 * 
 */
namespace Home\Model\Student;

use Attachment\Logic\AttachmentLogic;

class personalCenterModel
{
    /**
     * 通过ID获取URL信息
     * @param  int $id 
     * @return string 
     */
    public function getUrlByAttachmentId($attachmentId)
    {
        $AttachmentL = new AttachmentLogic();
        $url = $AttachmentL->getUrlById($attachmentId);
        if ($url === false)
        {
            $url = "";
        }

        return $url;
    }
}