<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\validate;


use think\Validate;

class Admin extends Validate
{
    protected $rule = [
        'username|用户名' => [
            'require' => 'require',
            'max'     => '100',
            'unique'  => 'admin',
        ], 'password|密码' => [
            'require' => 'require',
        ],
    ];
}