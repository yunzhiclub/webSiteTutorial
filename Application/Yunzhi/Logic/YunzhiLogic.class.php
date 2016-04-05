<?php
/**
 * 公共类
 */
namespace Yunzhi\Logic;

class YunzhiLogic
{
    protected $error = "";
    public function setError($error)
    {
        $this->error = $error;
    }

    public function getError($error)
    {
        return $this->error;
    }
}