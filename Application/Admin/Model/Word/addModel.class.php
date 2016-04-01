<?php
namespace Admin\Model\Word;

use Word\Logic\WordLogic;       //单词
use Course\Logic\CourseLogic;   //课程

class addModel
{
    public $course;     //课程

    public function getCourseByCourseId($courseId)
    {
        $CourseL = new CourseLogic();
        $this->course = $CourseL->getListById($courseId);
    }
    
    public function getList()
    {
        if (I('get.courseid') !== "")
        {
            $result = array();
            $result["id"]               = "";
            $result["title"]            = "";
            $result["attachment_id"]    = 0;
            $result['course_id']        = I('get.courseid');
            $result["url"]              = "";
            $result["translation"]      = "";
            $result["us_phonetic"]      = "";
            $result["uk_phonetic"]      = "";
            $result["explains"]         = array("");
            $result["synonyms"]         = array("");
            $result["antonyms"]         = array("");
            $result["variants"]         = array("");
            $result["extends"]          = array("");
            return $result;
        }
    }
}