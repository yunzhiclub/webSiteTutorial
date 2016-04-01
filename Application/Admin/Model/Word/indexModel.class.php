<?php
namespace Admin\Model\Word;

use Course\Logic\CourseLogic;   //课程
use Word\Logic\WordLogic;       //单词

class indexModel
{   
    /**
     * 获取所有课程信息
     * @return 二维数据 
     */
    public function getAllCourseLists()
    {
        $CourseL = new CourseLogic();
        $lists = $CourseL->getAllLists();
        return $lists;
    }

}