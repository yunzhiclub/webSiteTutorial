<?php
namespace Admin\Controller;


use Think\Controller;
use Yunzhi\Logic\PHPExcelLogic;     //phpexcel
use Yunzhi\Logic\ZipLogic;          //zip打包
use PhpOffice\PhpWord\PhpWord;      //phpword

class UnitTestController extends Controller {
    
    public function __construct()
    {
        if (APP_DEBUG === false)
        {
            die("Error, not debug mode");
        }
        parent::__construct();
    }

    public function indexAction()
    {
        $this->display();
    }

    /**
     * 读取excel，并将excel数据作为数组返回示例
     * 
     */
    public function readExcelAction()
    {
        //读取execl文件，并将结果做为数组返回
        $filePath = "/Applications/XAMPP/htdocs/paper_approving/Application/Test/yunzhi.xlsx";
        $ReadL = new PHPExcelLogic;
        if (!$data = $ReadL->ReadFile($filePath))
        {
            dump($ReadL->getError());
        }
        else
        {
            dump($data);
        }
    }

    public function writeExcelAction()
    {
        $ReadL = new PHPExcelLogic;
        // 将数组中的值写入EXCEL，供用户下载
        $ReadL->arrayToExcel();
    }



    public function ueditorAction()
    {
        $this->display();
    }

    public function ueditorSaveAction()
    {
        dump($_POST);
    }
    public function zipAction(){
        //zip打包文件测试
        $ZipL = new ZipLogic();
        $ZipL->zip("/Applications/XAMPP/xamppfiles/htdocs/paper_approving/Public/uploads/image",
            "/Applications/XAMPP/xamppfiles/htdocs/paper_approving/Public/uploads/image.zip"
            );
    }

    public function phpWordAction()
    {
        // 
        $phpWord = new PhpWord();
        dump($phpWord);
    }

    public function uploadifyAction()
    {
        dump($_POST);
        $this->display();
    }
}
