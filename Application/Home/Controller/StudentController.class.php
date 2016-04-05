<?php
/**
 * 学生管理
 */
namespace Home\Controller;

use Student\Logic\StudentLogic;         //学生表
use Home\Model\Student\personalCenterModel; //小对象
use Home\Model\Student\workModel;           //作业小对象
use Yunzhi\Logic\AttachmentLogic;           //附件
use Work\Logic\WorkLogic;                   //作业

class StudentController extends HomeController
{
    private $index = '1';
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

    /**
     * 作业提交action
     * @return [type] [description]
     */
    public function workAction()
    {
        $WorkL = new WorkLogic();
        $student = $this->getStudent();
        $studentId = $student['id'];
        $work = $WorkL->getListByIndexStudentId($this->index, $studentId);

        $M = new workModel();
        $this->assign("M", $M);
        $this->assign("work", $work);
        $this->display();
    }

    //通过附件ID，获取文件的内容
    public function getTextByAttachmentIdAction()
    {
        $attahmentId = I('get.id');
        $AttachmentL = new AttachmentLogic();
        $attachmentText = $AttachmentL->getTextById($attahmentId);
        if ($attachmentText == false)
        {
            $result['status'] = "ERROR";
            $result['message'] = $AttachmentL->getError();
        }
        else
        {
            $result['status'] = "SUCCESS";
            $result['data'] = $attachmentText;
        }

        $this->ajaxReturn($result);
    }

    /**
     * 提交代码文件后，进行提交。
     * @return
     */
    public function workSubmitAction()
    {
        $student = $this->getStudent();
        $WorkL = new WorkLogic();

        $data['attachment_id'] = I('post.attachment_id');
        $map['student_id'] = $student['id'];
        $map['index'] = $this->index;

        if ($WorkL->updateListByMap($data, $map) !== false)
        {
            $this->success("操作成功", U('work'));
            return;
        }
        else
        {
            $this->error("操作失败,错误代码：" . $WorkL->getError(), U('work'));
            return;
        }

        
    }
}