<?php

$result=httpcopy('http://dict.youdao.com/dictvoice?audio=hello&type=2');

echo '<pre>';print_r($result);

function httpcopy($url,$file='test.mp3',$timeout=60){
    $file=empty($file)?pathinfo($url,PATHINFO_BASENAME):$file;

    $dir=pathinfo($file,PATHINFO_DIRNAME);
    !is_dir($dir)&&@mkdir($dir,0755,true);
    $url=str_replace(' ',"%20",$url);
    $result=array('fileName'=>'','way'=>'','size'=>0,'spendTime'=>0);
    $startTime=explode(' ',microtime());
    $startTime=(float)$startTime[0]+(float)$startTime[1];
    if(function_exists('curl_init')){
        $ch=curl_init();
        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_TIMEOUT,$timeout);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,TRUE);
        $temp=curl_exec($ch);
        if(@file_put_contents($file,$temp)&&!curl_error($ch)){
            $result['fileName']= "test.mp3";
            $result['way']='curl';
            $result['size']=sprintf('%.3f',strlen($temp)/1024);
        }
    }else{
        $opts=array(
            'http'=>array(
            'method'=>'GET',
            'header'=>'',
            'timeout'=>$timeout
            )
        );
        $context=stream_context_create($opts);
        if(@copy($url,$file,$context)){
            $result['fileName']="test.mp3";
            $result['way']='copy';
            $result['size']=sprintf('%.3f',strlen($context)/1024);
        }
    }
    $endTime=explode(' ',microtime());
    $endTime=(float)$endTime[0]+(float)$endTime[1];
    $result['spendTime']=round($endTime-$startTime)*1000;//单位：毫秒
    return $result;
}