<?php
return array(
	/* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__IMG__'    	=> __ROOT__ . '/Yunzhi/img',
        '__CSS__'    	=> __ROOT__ . '/Yunzhi/css',
        '__JS__'     	=> __ROOT__ . '/Yunzhi/js',
    ),

	'DATA_CACHE_PREFIX'    => 	'yunzhi_ethan_Yunzhi', 	// 缓存前缀
	'MODULE_ALLOW_LIST'    =>  	array('Yunzhi'),			//允许访问模块
	'DEFAULT_MODULE'       =>   'Yunzhi',  				// 默认模块
	'SESSION_PREFIX'       =>  	'yunzhi_ethan_Yunzhi', 	// session 前缀
	'COOKIE_PREFIX'        =>  	'yunzhi_ethan_Yunzhi', 	// Cookie前缀 避免冲突
);
    
