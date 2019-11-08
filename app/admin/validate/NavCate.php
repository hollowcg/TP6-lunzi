<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\validate;


use think\Validate;

class NavCate extends Validate
{
    protected $rule = [
        'name|名称' => [
            'require' => 'require',
            'unique'  => 'NavCate',
        ],
    ];
}