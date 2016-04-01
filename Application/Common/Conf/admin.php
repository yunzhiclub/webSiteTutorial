<?php
return array(
	/* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__BOW__'    	=> __ROOT__ . '/Admin/bower_components',
        '__DIST__'      => __ROOT__ . '/Admin/dist',
        '__CSS__'    	=> __ROOT__ . '/Admin/css',
        '__JS__'     	=> __ROOT__ . '/Admin/js',
        '__UPLOADS__'   => __ROOT__ . '/uploads'
    ),
    'YUNZHI_USER_id'        => '1',                     //测试用户ID
	'DATA_CACHE_PREFIX'    => 	'admin', 	 // 缓存前缀
	'MODULE_ALLOW_LIST'    =>  	array('Admin'),			 //允许访问模块
	'DEFAULT_MODULE'       =>   'Admin',  				 // 默认模块
	'SESSION_PREFIX'       =>  	'admin', 	             // session 前缀
	'COOKIE_PREFIX'        =>  	'admin', 	             // Cookie前缀 避免冲突
);

