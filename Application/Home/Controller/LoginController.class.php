<?php
namespace Home\Controller;

use ExpertView\Logic\ExpertViewLogic;   //专家视图
use Student\Logic\StudentLogic;

use Think\Controller;

class LoginController extends Controller
{
    //对用户名密码进行判断
    public function loginAction()
    {
    	$num = I('post.num');
        $password = I('post.password');

        $StudentL = new StudentLogic();
        $student = $StudentL->validate($num,$password);
        if ($student !== false)
        {
            session('studentId', $student['id']);
            $this->success("登陆成功", U('Index/home'));
        }
        else
        {
            $this->error("用户名或密码错误", U('Index/index'));
        }


    }

    //注销功能
    public function logoutAction()
    {
        session('studentId',null);
        $this->success('注销成功', U('Index/index'));
    }

    public function checkAjaxAction()
    {

        $return = array();
        $UserL = new UserModel();
        $username = trim(I('post.username'));
        $password = trim(I('post.password'));
        switch ($UserL->checkUser($username,$password)) 
        {
            case '1':
                //根据post的用户名取出用户信息，再将id与name存入session
                $list = $UserL->getUserInfoByName($username);
                session('user_id',$list['id']);
                session('user_name',$list['username']);

                //登录成功后跳转
                $return['state'] = "success";
                $this->ajaxReturn($return);
                break;

            case '0':
                $return['state'] = "error";
                $return['msg'] = "用户名密码错误" ;
                $this->ajaxReturn($return);
                break;

            case '2':
                $return['state'] = "error";
                $return['msg'] = "无此用户名" ;
                $this->ajaxReturn($return);
                break;
        }
    }

    public function indexAction()
    {
        $this->display();
    }

    public function submitAction()
    {
        $result = array("class"=>"", 'is_visitor'=>0);

        //获取angularjs post数据
        $postdata = file_get_contents("php://input");
        $post = json_decode($postdata, true);
        
        $data = array();
        $data['num'] = $post['num'];

        $StudentL = new StudentLogic();
        $student = $StudentL->where($data)->find();

        if ($student === null)
        {
            $result['is_visitor'] = 1;
        }
        else
        {
            if ($student['name'] == $post['name'] && $student['is_registered'] == 0)
            {

                $result['class'] = $student['class'];
            }
            else
            {
                $result['status'] = "ERROR";
                $result['message'] = "Information Error";
                $this->ajaxReturn($result);
            }
            
        }
        $result['status'] = "SUCCESS";
        $result['id'] = $student['id'];

        $this->ajaxReturn($result);
    }

    public function registerAction()
    {
        //接收angularjs post数据
        if ($_SERVER['REQUEST_METHOD'] == 'POST' && empty($_POST))
            $_POST = json_decode(file_get_contents('php://input'), true);
        
        $StudentL = new StudentLogic();
        
        $data = array();
        $student['id'] = I('post.id');
        $student['num'] = I('post.num');
        $student['name'] =I('post.name');
        $student['password'] = $StudentL->makePassword(I('password'));
        $student['is_visitor'] = I('post.is_visitor');
        $student['class'] = I('post.class');
        $student['is_registered'] = 1;

        
        if ($StudentL->saveList($student) === false)
        {
            $result['status'] = "ERROR";
            $result["message"] = $StudentL->getError();

        }
        else
        {
            $result['status'] = "SUCCESS";
        }

        $this->ajaxReturn($result);
    }
}