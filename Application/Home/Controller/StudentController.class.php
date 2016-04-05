<?php
/**
 * 学生管理
 */
namespace Home\Controller;

use Student\Logic\StudentLogic;         //学生表
use Home\Model\Student\personalCenterModel; //小对象

class StudentController extends HomeController
{
    public function personalCenterAction()
    {
        $student = session("student");
        $M = new personalCenterModel();

        $this->assign("M", $M);
        $this->assign("student", $student);
        $this->display();
    }


    public function saveAction()
    {
        $post = I('post.');
        $student = $this->getStudent();
        $StudentL = new StudentLogic();

        $data = array();
        $data['id'] = $student['id'];
        $data['attachment_id'] = $post['attachment_id'];

        //如果传入的密码不为空，但传入的密码错误，则报错。
        if ($post['password'] !== "" && ($StudentL->checkUser($student['name'], $post['password']) === false))
        {
            $this->error("原密码错误", U('personalCenter'));
            return;
        }

        //如果传入的密码不为空
        if ($post['password'] !== "")
        {
            $data['password'] = $StudentL->makePassword($post['newpassword']);
        }
        
        if ($StudentL->saveList($data) === false)
        {
            $this->error("数据更新发生错误.错误信息" . $StudentL->getError(), U('personalCenter'),100);
            return;
        }

        $student = $StudentL->getListById($student['id']);
        session('student', $student);
        $this->success("操作成功", U('personalCenter'));
    }

    public function workAction()
    {
        $this->display();
    }
}