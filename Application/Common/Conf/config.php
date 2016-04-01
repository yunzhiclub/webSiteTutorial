<?php

return array(
    /* 模板相关配置 */
    'TMPL_PARSE_STRING' => array(
        '__UPLOADS__'    => __ROOT__ . '/uploads'
    ),

    'YUNZHI_PAGE_SIZE'      => 10,          //默认分页大小

    'TMPL_TEMPLATE_SUFFIX'  => '.tpl',     // 默认模板文件后缀
    'ACTION_SUFFIX'         => 'Action',//设置ACTION前缀为action
    'TAGLIB_PRE_LOAD'       => 'Yunzhi,Html',   // 需要额外加载的标签库(须指定标签库名称)，多个以逗号分隔 
    'DEFAULT_PASSWORD'      => 'yunzhi.club',

    /* 数据缓存设置 */
    'DATA_CACHE_TYPE'       =>  'File', // 数据缓存类型


    'DB_TYPE'               =>  'mysqli',     // 数据库类型
    'DB_HOST'               =>  'localhost',    // 服务器地址
    'DB_NAME'               =>  'websitecrouse',          // 数据库名
    'DB_USER'               =>  'root',      // 用户名
    'DB_PWD'                =>  '',          // 密码
    'DB_PORT'               =>  '3306',             // 端口
    'DB_PREFIX'             =>  'mengyunzhi_',           // 数据库表前缀


    'URL_MODEL'             =>  1, // URL访问模式,可选参数0、1、2、3,代表以下四种模式：

    //开启令牌验证
    'TOKEN_ON'              =>    false,            // 是否开启令牌验证 默认关闭
    'TOKEN_NAME'            =>    '__hash__',       // 令牌验证的表单隐藏字段名称，默认为__hash__
    'TOKEN_TYPE'            =>    'md5',            //令牌哈希验证规则 默认为MD5
    'TOKEN_RESET'           =>    true,             //令牌验证出错后是否重置令牌 默认为true
);
