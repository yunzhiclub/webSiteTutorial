<?php
namespace Home\Controller;

use Yunzhi\Logic\HttpLogic;

class IndexController extends HomeController
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