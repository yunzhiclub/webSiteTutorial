<?php
namespace Admin\Model\Paper;

use Expert\Logic\ExpertLogic;       //专家信息

class indexModel
{
    private $error = "";

    public function setError($error)
    {
        $this->error = $error;
    }

    public function getError()
    {
        return $this->error;
    }

    /**
     * 通过学生ID获取专家信息
     * @param  int $studentId 学生ID
     * @return lists            学生ID对应的所有专家信息
     */
    public function getExpertsByStudentId($studentId)
    {
        $ExpertL = new ExpertLogic();
        $experts = $ExpertL->getListsByStudentId($studentId);
        if ($experts === false)
        {
            $this->setError("indexModel getExpertsByStudentId error: " . $ExpertL->getError());
            return false;
        }
        
        return $experts;
    } 
}