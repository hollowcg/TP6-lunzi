<?php
/**
 * Desc: 标签库
 * User: 晨光
 * Contact: QQ:461718846
 */

namespace app\common\taglib;


use app\admin\model\System;
use think\template\TagLib;

class Kitty extends TagLib
{
    protected $tags = [
        'system' => ['attr'=>'field','close'=>0],
    ];

    /**
     * 获取系统设置
     * @param $tag
     * @return mixed|string
     */
    public function tagSystem($tag){
        if (empty($tag)){return '';}
        return System::where('field','=',$tag['field'])->value('value');
    }
}