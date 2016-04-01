<?php
/**
 * 单词管理
 */
namespace Admin\Controller;

use Admin\Model\Word\addModel;
use Admin\Model\Word\indexModel;
use Word\Logic\WordLogic;                   //单词
use WordExtend\Logic\WordExtendLogic;       //单词扩展信息
use Course\Logic\CourseLogic;               //课程信息

class WordController extends AdminController
{
    public function indexAction()
    {  
        $M = new indexModel();

        //获取课程信息
        $courseId = (int)I('get.courseid');
        $WordL = new WordLogic();
        if ($courseId !== 0)
        {
            $map = array();
            $map['course_id'] = (int)$courseId;
            $WordL->addMaps($map);
        }

        //获取单词信息
        $lists = $WordL->getLists();

        $this->assign("M", $M);
        $this->assign("lists", $lists);
        $this->display();
    }

    /**
     * 删除单词信息
     * 1.删除本单词信息 word
     * 2.删除本单词扩展信息 word_extend
     * @return  
     * panjie
     * 2016.03
     */
    public function deleteAction()
    {
        $id = (int)I('get.id');

        //删除单词信息
        $WordL = new WordLogic();
        if ($WordL->deleteList($id) === false)
        {
            $this->error("系统错误-删除单词基本信息出错：" . $WordL->getError());
        }

        //删除单词扩展信息
        $WordExtendL = new WordExtendLogic();
        if ($WordExtendL->deleteListByWordId($id) === false)
        {
            $this->error("系统错误-删除单词扩展信息出错：" . $WordExtendL->getError());
        }

        //更新课程单词数
        $WordL->updateCourseCount(I('get.courseid'));
        
        $this->success("操作成功", U('index?id=', I('get.')));
    }

    /**
     * 保存单词。
     * 1.先取当前课程，查看是否存在，不存在，报错。
     * 2.存基本信息至word表
     * 3.存扩展信息至word_extend表
     * @return  
     * panjie
     * 2016.03
     */
    public function saveAction()
    {
        $data = I('post.');

        //查找是否存在当前课程信息
        $CourseL = new CourseLogic();
        if ($CourseL->getListById($data['course_id']) === false)
        {
            $this->error("传入的课程信息有误", U("index", I('get.')));
        }

        //保存基本信息
        $WordL = new WordLogic();
        $data['id'] = $WordL->saveList($data);
        if ($data['id'] === false)
        {
            $this->error("数据保存过程出错，错误信息: " . $WordL->getError(), U("index", I('get.')));
        }

        //保存扩展信息
        $WordExtendL = new WordExtendLogic();
        if ($WordExtendL->saveLists($data) === false)
        {
            die("extends error");
            $this->error("数据扩展保存过程出错，错误信息: " . $WordExtendL->getError(), U("index", I('get.')));
        }
        
        //如果为课程添加单词界面，则跳转至继续添加
        $courseId = I('get.course_id');
        if ($courseId !== "")
        {
            $this->success("操作成功", U('add', I('get.')));
        }
        //如果为编辑单词界面，则跳转至index
        else
        {
            $this->success("操作成功", U('index?id=', I('get.')));
        }
        
    }

    public function addAction()
    {        
        //查询是否存在传入课程
        $courseId = (int)I('get.courseid');
        $CourseL = new CourseLogic();

        $course = $CourseL->getListById($courseId);
        if ($course === false)
        {
            $this->error("未获取到课程信息，或您要操作的课程已删除", U('index', I('get.')));
        }

        $M = new addModel();
        $M->getCourseByCourseId($courseId);

        $this->assign("M", $M);
        $this->display();
    }

    /**
     * 抓取单词的基本信息
     * @return json 
     */
    public function queryWordAjaxAction()
    {
        $word = I('get.word');
        $url = "http://fanyi.youdao.com/openapi.do?keyfrom=sfdfsdfsd&key=1559675985&type=data&doctype=json&version=1.1&q=" . $word;
        $ch = curl_init();
        curl_setopt($ch,CURLOPT_URL,$url);                          //设置URL
        curl_setopt($ch,CURLOPT_TIMEOUT, 60);                       //设置过期时间
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);               //设置传输方式？
        $temp = curl_exec($ch);   
        echo $temp;
    }
}