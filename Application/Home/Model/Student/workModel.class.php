<?php
/**
 * 作业提交
 */
namespace Home\Model\Student;

use Attachment\Logic\AttachmentLogic;

class WorkModel
{
    public function getTextByAttachmentId($attachmentId)
    {
        $AttachmentL = new AttachmentLogic();
        return $AttachmentL->getTextById($attachmentId);
    }
}