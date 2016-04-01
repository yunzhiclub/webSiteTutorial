<?php
namespace Admin\Controller;

use Think\Controller;
use User\Logic\UserLogic;

class LoginController extends Controller{
    
    public function indexAction(){
        $this->display();
    }

    //对用户名密码进行判断
    public function loginAction(){
        $user = I('post.');

        //验证用户名密码
    	$UserL = new UserLogic;
    	if ($UserL->checkUser($user['username'], $user['password']) === true) {
            //根据post的用户名取出用户信息，再将id与name存入session
            $list = $UserL->getUserInfoByName($user['username']);
            session('userId',$list['id']);

            //登录成功后跳转
            redirect_url(U('Index/home'));
        }
        else 
        {
            $this->error('用户名密码错误',U('Index/index'));
        }
    }

    //注销功能
    public function cancelAction(){
        session('user_id',null);
        session('user_name',null);
        $this->success('注销成功',U('Admin/index'));
    }

    //直接登录
    public function loginDirectAction(){
       //开发模式开启后直接跳转到后台首页 
        if(APP_DEBUG)
        {
            session('userId',C("yunzhi_user_id"));
            redirect_url(U('Index/home'));
        }else{
            exit();
        }
    }

    public function checkAjaxAction(){
        //检测是否勾选记住密码，传入cookie信息
        if(I('post.remember') == 'true'){
            cookie('password',I('post.password'),30*24*60*60);
            cookie('username',I('post.username'),30*24*60*60);
            cookie('remember',true,30*24*60*60);
        }
        else{
            cookie('password',null);
            cookie('username',null);
            cookie('remember',null);
        }

        $return = array();
        $UserL = new UserModel();
        $username = trim(I('post.username'));
        $password = trim(I('post.password'));
        switch ($UserL->checkUser($username,$password)) {
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
}
