<?php
return array(
	/* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__BOW__'       => __ROOT__ . '/Admin/bower_components',
        '__DIST__'      => __ROOT__ . '/Admin/dist',
        '__CSS__'       => __ROOT__ . '/Home/css',
        '__JS__'        => __ROOT__ . '/Home/js',
        '__IMG__'       => __ROOT__ . '/Home/image',
        '__SELECT2__'   => __ROOT__ . '/js/select2',
        '__UPLOADS__'    => __ROOT__ . '/uploads'
    ),

	'DATA_CACHE_PREFIX'    => 	'home', 	// 缓存前缀
	'MODULE_ALLOW_LIST'    =>  	array('Home'),			//允许访问模块
	'DEFAULT_MODULE'       =>   'Home',  				// 默认模块
	'SESSION_PREFIX'       =>  	'home', 	// session 前缀
	'COOKIE_PREFIX'        =>  	'home', 	// Cookie前缀 避免冲突
);
    
