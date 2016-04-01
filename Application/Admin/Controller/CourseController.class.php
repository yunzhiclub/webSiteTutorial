<?php
/**
 * 课程
 */
namespace Admin\Controller;

use Course\Logic\CourseLogic;   //课程

class CourseController extends AdminController
{
    public function indexAction()
    {
        $CourseL = new CourseLogic();
        $lists = $CourseL->getLists();

        $this->assign("lists", $lists);
        $this->display();
    }

    public function editAction()
    {
        $this->addAction();
    }

    public function addAction()
    {
        $CourseL = new CourseLogic();
        $course = $CourseL->getListById(I('get.id'));
        if ($course === false)
        {
            $course = array("id"=>null);
        }
        $this->assign('list', $course);
        $this->display('add');
    }

    public function saveAction()
    {
        $data = I('post.');
        $CourseL = new CourseLogic();
        if ($CourseL->saveList($data) === false)
        {
            $this->error("数据保存发生错误" . $CourseL->getError(), U('index', I('get.')));
        }
        else
        {
            $this->success("操作成功", U('index', I('get.')));
        }
    }


}