<?php
/**
 * 对文件夹进行打包，并生成新的文件
 * 此文件参考 
 * http://stackoverflow.com/questions/1334613/how-to-recursively-zip-a-directory-in-php
 * 结合文章中提供的一个方法，进行了封装
 * panjie
 * 2016.02
 * 3792535@qq.com
 */
namespace Yunzhi\Logic;

class ZipLogic extends \ZipArchive
{
    private $error = '';

    public function setError($error)
    {
        $this->error = $error;
    }

    public function getError()
    {
        return $this->error;
    }

    /**
     * 对文件夹及子文件夹进行打包
     * @param  sting $source      需要打包的文件夹路径
     * @param  string $destination 打包后另存到服务器上的文件
     * @return true
     * samplecode
     * Zip('/path/to/maindirectory','/path/to/compressed.zip');
     */
    public function zip($source, $destination)
    {
        try
        {
            // 判断是否存在zip扩展
            if (!extension_loaded('zip')) 
            {
                $this->setError("ZipL error: Can find zip moudle in service ,pls use phpinfo() checked");
                return false;
            }

            // 判断压缩文件夹是否存在 
            if (!file_exists($source)) 
            {
                $this->setError("ZipL error: $source is not exists or do not have premission to read the $source");
                return false;
            }

            // 尝试创建(打开)目标文件
            if (!$this->open($destination, \ZIPARCHIVE::CREATE)) {
                $this->setError("ZipL error: can not open $destination, plz check the dir or premission");
                return false;
            }

            //将路径转换为安全路径
            $source = str_replace('\\', '/', realpath($source));

            //区别 文件 或 文件夹 分别进行打包
            if (is_dir($source) === true)
            {
                //利用PHP内置内，进行目录浏览前的初始化
                $files = new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator($source), \RecursiveIteratorIterator::SELF_FIRST);

                //遍历目录，打包
                foreach ($files as $file)
                {
                    $file = str_replace('\\', '/', $file);

                    // 排除 "." ".." 两个文件夹名称 Ignore "." and ".." folders
                    if( in_array(substr($file, strrpos($file, '/')+1), array('.', '..')) )
                        continue;

                    //获取绝对路径
                    $file = realpath($file);

                    //分别按文件夹或文件进行打包
                    if (is_dir($file) === true)
                    {
                        $this->addEmptyDir(str_replace($source . '/', '', $file . '/'));
                    }
                    else if (is_file($file) === true)
                    {
                        $this->addFromString(str_replace($source . '/', '', $file), file_get_contents($file));
                    }
                }
            }
            else if (is_file($source) === true)
            {
                $this->addFromString(basename($source), file_get_contents($source));
            }

            return $this->close();
        }
        catch(\Exception $e)
        {
            $this->setError("ZipL error:" . $e->getMessage());
            return false;
        }
        
    }
}