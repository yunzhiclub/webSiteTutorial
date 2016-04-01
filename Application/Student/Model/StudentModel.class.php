<?php

namespace Student\Model;

use Yunzhi\Model\YunzhiModel;

class StudentModel extends YunzhiModel
{
    protected $orderBys     = array("name"=>"asc"); //排序字段方式
    protected $keywords     = "I('get.keywords')"; //查询关键字
    protected $field        = "name"; //查询字段
}