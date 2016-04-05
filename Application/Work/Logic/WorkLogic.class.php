<?php
/**
 * 作业
 */
namespace Work\Logic;

use Work\Model\WorkModel;

class WorkLogic extends WorkModel
{
    /**
     * 通过索引号及学生ID获取数据
     * @param  int $index     索引号
     * @param  int $studentId 学生ID
     * @return list  
     * panjie
     * 2016.04          
     */
    public function getListByIndexStudentId($index, $studentId)
    {
        try
        {
            $map['index'] = (int)$index;
            $map['student_id'] = (int)$studentId;
            return $this->where($map)->find();
        }
        catch(\Think\Exception $e)
        {
            $this->setError($e->getMessage());
            return false;
        }
        
    }

    /**
     * 按条件更新数据信息，有则更新，无则插入
     * @param  array $data 要更新的数据
     * @param  array $map  查询条件
     * @return 
     * panjie
     * 2016.04     
     */
    public function updateListByMap($data, $map)
    {
        try
        {
            $list = $this->where($map)->find();

            //依据记录是否存在，进而进行数据的重新组织
            if ($list === null)
            {
                $data = array_merge($map, $data);
            }
            else
            {
                $data = array_merge($list, $data);
            }

            //调用yunzhimodel的save方法
            return $this->saveList($data);
        }
        catch(\Think\Exception $e)
        {
            $this->setError("Error:" . $e->getMessage());
            return false;
        }
    }
}