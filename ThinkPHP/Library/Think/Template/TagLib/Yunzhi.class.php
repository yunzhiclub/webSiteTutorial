<?php
namespace Think\Template\TagLib;
use Think\Template\TagLib;
use Think\Page;
/**
 * CX标签库解析类
 */
class Yunzhi extends TagLib {

    // 标签定义
    protected $tags   =  array(
        'page'      =>  array('attr'=>'style, totalCount, class, id', 'close'=>0),
        'test'      =>  array()
    );

    public function _test($tag, $content)
    {
         $parseStr = "hello" . $content;
         return $parseStr;
    }
    
    /**
     * page标签解析
     * 格式： <html:page id="" class="" totalCount=""/>
     * id
     * @access public
     * @param array $tag 标签属性
     * @return string|void
     */
    public function _page($tag){
        $id         =   !empty($tag['id']) ? $tag['id'] : '_page';
        $class      =   !empty($tag['class']) ? $tag['class'] : '';
        $totalCount =   !empty($tag['totalcount']) ? '$' . $tag['totalcount'] :
                        (C("YUNZHI_TOTAL_COUNT") ? C("YUNZHI_TOTAL_COUNT") : 0);
        $pageSize   =   C('YUNZHI_PAGE_SIZE') ? C('YUNZHI_PAGE_SIZE') : 20;

        $parseStr   =   "<?php ";
        $parseStr   .=  '$page = new Think\Page('. $totalCount .',' . $pageSize . ');';

        $parseStr   .=  'echo $page->show();';
        $parseStr   .=  " ?>";
        return  $parseStr;
    }
}