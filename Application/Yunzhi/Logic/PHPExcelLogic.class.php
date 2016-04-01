<?php
/**
 * 引用PHPExcel库.
 * 
 * phpexcle由于未采用命名空间，为了避免在全名上产生的冲突。
 * 放弃使用composer进行安装，而采用thinkphp内置的vendor方法进行引入。
 *
 * Vendor方法简介如下：
 * thinkphp导入外置非namespace包时
 * 先将需要导入的库放至Thinkphp\Library\Vendor下。
 * 然后：直接用Vendor()方法进行引用。
 * 使用时，要在引用的类前加 \
 * 注意new的类名，并不是文件名，应该是引用文件中的类名。
 * panjie
 * 2016.02
 * 3792535@qq.com
 */
namespace Yunzhi\Logic;

Vendor('PHPExcel.PHPExcel.IOFactory');
Vendor('PHPExcel.PHPExcel.Cell');
Vendor('PHPExcel.PHPExcel');

class PHPExcelLogic
{
    private $error = "";
    public function setError($error)
    {
        $this->error = $error;
    }

    public function getError()
    {
        return $this->error;
    }

    /**
     * 读取XLS(xlsx)文件，将第一行，做为数据的键值。自第二行始，做为数据项
     * @param string $filePath  文件在服务器上的具体位置，需要保证有读取权限
     * @return array 二维数组
     */
    public function ReadFile($filePath)
    {
        try
        {
            if (!file_exists($filePath))
            {
                $this->setError("ReadL: file not exists");
                return false;
            }

            $type = strtolower( pathinfo($filePath, PATHINFO_EXTENSION) );
            if ($type == 'xlsx' || $type == 'xls')
            {
                $objPHPExcel = \PHPExcel_IOFactory::load($filePath);
            }
            else
            {
                $this->setError('ReadL: file type is ' . $type . ', but not support');
                return false;
            }

            $sheet = $objPHPExcel->getSheet(0);

            //获取行数与列数,注意列数需要转换
            $highestRowNum = $sheet->getHighestRow();
            $highestColumn = $sheet->getHighestColumn();
            $highestColumnNum = \PHPExcel_Cell::columnIndexFromString($highestColumn);
             
            //取得字段，第一行 为数据的字段，因此先取出用来作后面数组的键名
            // $filed = array();
            // for($i=0; $i<$highestColumnNum; $i++){
            //     $cellName = \PHPExcel_Cell::stringFromColumnIndex($i).'1';
            //     $cellVal = $sheet->getCell($cellName)->getValue();//取得列内容
            //     $filed []= $cellVal;
            // }
             
            //开始从第二行开始取出数据并存入数组
            $data = array();
            for ($i = 1; $i <= $highestRowNum; $i++){
                $row = array();
                for ($j = 0; $j < $highestColumnNum; $j++){
                  $cellName = \PHPExcel_Cell::stringFromColumnIndex($j).$i;
                  $cellVal = $sheet->getCell($cellName)->getValue();
                  $row[] = $cellVal;
                }
                $data []= $row;
            }
            return $data;
        }
        catch(\Exception $e)
        {
            $this->setError("ReadL: exceptions " . $e->getMessage());
            return false;
        }
    }


    /**
     * 本程序给出使用PHPExcel将数组中的数据转化为EXCEL文件的示例
     * 程序的目的在于展示 使用PHPExcel将数组变成excel 的方法。
     * 起到示例代码的作用
     * @return file 
     */
    public function arrayToExcel()
    {
        //未例数据
        $data = array(
            array('name' => 'NAME', 'mail' => 'EMAIL', 'age' => 'age'),
            array('name' => 'A', 'mail' => 'a@gmail.com', 'age' => 43),
            array('name' => 'C', 'mail' => 'c@gmail.com', 'age' => 24),
            array('name' => 'B', 'mail' => 'b@gmail.com', 'age' => 35),
            array('name' => 'G', 'mail' => 'f@gmail.com', 'age' => 22),
            array('name' => 'F', 'mail' => 'd@gmail.com', 'age' => 52),
            array('name' => 'D', 'mail' => 'g@gmail.com', 'age' => 32),
            array('name' => 'E', 'mail' => 'e@gmail.com', 'age' => 34),
            array('name' => 'K', 'mail' => 'j@gmail.com', 'age' => 18),
            array('name' => 'L', 'mail' => 'h@gmail.com', 'age' => 25),
            array('name' => 'H', 'mail' => 'i@gmail.com', 'age' => 28),
            array('name' => 'J', 'mail' => 'j@gmail.com', 'age' => 53),
            array('name' => 'I', 'mail' => 'l@gmail.com', 'age' => 26),
        );

        //实例化对像，注意，在NEW之前，在确定已经在文件头部进行了 
        //Vendor('PHPExcel.PHPExcel');
        //实例化时，要在类前加一个 \
        $objPHPExcel = new \PHPExcel();
        
        // 使用内类的方法，从A1开始，将数组中的数据今次添加至工作表
        $objPHPExcel->getActiveSheet()->fromArray($data, null, 'A1');
        
        // 重新命名工作表
        $objPHPExcel->getActiveSheet()->setTitle('云智PHPExcel填充示例');
        
        // 将A，B两列宽度设置为自动
        $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setAutoSize(true);
        $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setAutoSize(true);
        $this->_download($objPHPExcel);
    }

    private function _save($objPHPExcel)
    {   
        //文件路径可以为绝对路径，也可以为相对路径。相对路径，请注意自己的当前入口位置
        $filePath = '/Applications/XAMPP/xamppfiles/htdocs/paper_approving/Public/download/';
        $fileName = '云智-数组存为EXCEL' . date("Ymdhis") . '.xls';

        // 设置文件格式为Excel2007或excel2003。
        // 同样，在使用phpexcel内置内时，需要注意两点：
        // 1.vender了该类所在的文件
        // 2.使用时，在类前面加入 \ 
        // （由于createWriter为PHPExcel_IOFactory的静态方法，所以可以不必实例化而直接使用）
        // $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');

        //以下为存为2003及以前的格式
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');

        //存入指定路径
        $objWriter->save($filePath . $fileName);
        
    }

    private function _download($objPHPExcel)
    {   
        $fileName = '云智-数组存为EXCEL' . date("Ymdhis") . '.xls';
        /*引导用户直接下载需要进行两步操作,注意一点。
        * 1.重写header信息，告知浏览器用户将要下载的文件类型，默认的文件名等信息
        * 2.调用phpexcel供用户下载方法
        * 注意1点：由于在这里重写了header信息，所以，在下载的页面，是不宜继承我们的其它的模板的，否则可以会导致重写header引发的错误.
        * */
        // excel2007 content-type
        // header('Content-type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

        //excel 2003 content-type
        // Redirect output to a client’s web browser (Excel5)
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="'. $fileName . '"');
        header('Cache-Control: max-age=0');

        //以下存为2007格式
        // $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');

        //以下为存为2003及以前的格式
        $objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
        
        // 引导用户下载
        $objWriter->save('php://output');
    }
}