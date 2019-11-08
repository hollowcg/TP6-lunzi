<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\validate;


use think\Validate;

class AdminRole extends Validate
{
    protected $rule = [
        'name|角色名称' => [
            'require' => 'require',
            'max'     => '100',
            'unique'  => 'admin_role',
        ]
    ];
}