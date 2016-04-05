<?php
namespace Home\Controller;

use Think\controller;

use Yunzhi\Logic\HttpLogic;

class IndexController extends Controller
{
    public function indexAction()
    {  
        $this->display();
    }

    public function registerAction()
    {
        $this->display();
    }
}