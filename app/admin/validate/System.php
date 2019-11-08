<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\validate;


use think\Validate;

class System extends Validate
{
    protected $rule = [
        'field|字段' => [
            'require' => 'require',
            'unique'  => 'System',
        ],
    ];
}