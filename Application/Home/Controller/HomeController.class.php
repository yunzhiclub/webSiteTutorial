<?php
namespace Home\Controller;

use Think\Controller;
use Cycle\Logic\CycleLogic; //周期
use Admin\Model\Admin\ConstructModel;    //后台构造函数类
use Menu\Logic\MenuLogic;               //菜单
use Student\Model\StudentModel;           // 学生

class HomeController extends Controller
{
    public function __construct()
    {   
        //判断用户是否登陆
        if (session('studentId') === null)
        {
            $this->redirect('Index/index',0);
            return;
        }
        else
        {
            session('studentId', session('studentId'));
        }
        parent::__construct();
    }

    //返回学生信息，超出session，则直接跳转至登陆页
    protected function getStudent()
    {
        $studentId = session("studentId");

        if ($studentId == null)
        {
            $this->redirect('Index/index',0);
            return;
        }
        else
        {
            $StudentM = new StudentModel();
            $map = array();
            $map['id'] = $studentId;
            $student = $StudentM->where($map)->find();
            return $student;
        }
    }
}