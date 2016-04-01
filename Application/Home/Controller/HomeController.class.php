<?php
namespace Home\Controller;

use Think\Controller;
use Cycle\Logic\CycleLogic; //周期
use Admin\Model\Admin\ConstructModel;    //后台构造函数类
use Menu\Logic\MenuLogic;               //菜单

class HomeController extends Controller
{
    public function __construct()
    {   
        //TODO：登陆模块完成后，将本行删除
        session('user', array());

        //判断用户是否登陆
        if (session('user') === null)
        {
            $this->redirect('Index/index',0);
            return;
        }
        else
        {
            session('user', session('user'));
        }
        parent::__construct();
    }
}