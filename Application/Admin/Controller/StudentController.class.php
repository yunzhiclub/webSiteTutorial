<?php
namespace Admin\Controller;

use Student\Logic\StudentLogic;
use Yunzhi\Logic\AttachmentLogic;
use Yunzhi\Logic\PHPExcelLogic;

class StudentController extends AdminController
{
    //用户列表显示
    public function indexAction()
    {
        //获取列表
        $UserL = new StudentLogic();
        $users = $UserL->getLists();
        //dump($users);

        //传入列表
        $this -> assign('users',$users);

        //调用v层
        $this -> display();
    }

    public function uploadExcelAction()
    {
        //上传附件
        $AttachmentL = new AttachmentLogic();
        $attachment = $AttachmentL->upload();
        if ($attachment === fasle)
        {
            $result = array("status"=>"ERROR", "message"=>$PHPExcelL->getError());
            $this->ajaxReturn($result);
            return;
        }

        //读取附件
        $filePath = I('server.DOCUMENT_ROOT') . $attachment['url'];
        $PHPExcelL = new PHPExcelLogic();
        $students = $PHPExcelL->ReadFile($filePath);
        if ($students === false)
        {
            $result = array("status"=>"ERROR", "message"=>$PHPExcelL->getError());
            $this->ajaxReturn($result);
            return;
        }

        $StudentL = new StudentLogic();
        foreach($students as $student)
        {
            $data = array();
            $data['num'] = $student[1];
            $data['name'] = $student[2];
            $data['class'] = $student[3];
            if ($StudentL->saveList($data) === false)
            {
                $result = array("status"=>"ERROR", "message"=>"data save error:" . $StudentL->getError());
                $this->ajaxReturn($result);
                return;
            }
        }

        //删除附件
        $this->ajaxReturn($data);
    }


    public function saveAction()
    {
        // dump(I('post.'));
        // exit();
        //取用户信息
        $user = I('post.');

        //添加add()
        $UserL = new UserLogic();
        $UserL -> saveList($user);
        //echo $this->getlastsql();

        //判断异常
        if(count($errors = $UserL->getErrors())!==0)
        {
            //dump($errors);
            //exit();
            //数组变字符串
            $error = implode('<br/>',$errors);

            //显示错误
            $this -> error("添加失败，原因：".$error,U('Admin/User/index?p ='.I('get.p')));
        }
        else
        {
            $this -> success("操作成功",U('Admin/User/index?p ='.I('get.p')));
        }
    }

    public function editAction()
    {
        //获取用户ID
        $userId = I('get.id');

        //取用户信息getListById()
        $UserL = new UserLogic();
        $user = $UserL->getListById($userId);

        //传给前台
        $this -> assign('user',$user);

        //显示display('add')
        $this -> display('add');
    }

    public function deleteAction()
    {
        //取id
        $userId= I('get.id');

        //删除deleteInfo($Id)
        $UserL = new UserLogic();
        $status = $UserL->deleteInfo($userId);

        //判断是否删除成功
        if($status!==false)
        {
            $this -> success("删除成功",U('Admin/User/index?p='.I('get.p')));
        }
        else
        {
            $this -> error("删除失败",U('Admin/User/index?p='.I('get.p')));
        }
    }

    public function resetPasswordAction()
    {
        $userId = I('get.id');
        $userL = new UserLogic();
        $status = $userL -> resetPassword($userId);
        if($status!==false)
        {
            $this ->success('您的密码已重置，新密码为:'.C(DEFAULT_PASSWORD),U('Admin/User/index?p='.I('get.p')));
        }
        else
        {
            $this -> error("重置失败",U('Admin/User/index?p='.I('get.p')));
        }
    }
}

