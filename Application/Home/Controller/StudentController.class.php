<?php
/**
 * 学生管理
 */
namespace Home\Controller;
use Think\Controller;

use Student\Logic\StudentLogic;

class StudentController extends Controller
{
    public function submitAction()
    {
        $result = array("class"=>"", 'is_visitor'=>0);

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
        if ($_SERVER['REQUEST_METHOD'] == 'POST' && empty($_POST))
            $_POST = json_decode(file_get_contents('php://input'), true);

        $data = array();
        $student['id'] = I('post.id');
        $student['num'] = I('post.num');
        $student['name'] =I('post.name');
        $student['password'] = sha1(I('password'));
        $student['is_visitor'] = I('post.is_visitor');
        $student['class'] = I('post.class');
        $student['is_registered'] = 1;

        $StudentL = new StudentLogic();
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