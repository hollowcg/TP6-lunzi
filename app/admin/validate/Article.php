<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\validate;


use think\Validate;

class Article extends Validate
{
    protected $rule = [
        'title|标题' => [
            'require' => 'require',
            'unique'  => 'Article',
        ],
    ];
}