<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\model;


use think\facade\Session;

class Base extends \app\common\model\Base
{
// 获取左侧主菜单
    public static function getMenus()
    {
        $adminId = \session('admin.id');
        $roleId = Admin::where('id','=',$adminId)->value('admin_role_id');
        $menuid = AdminRole::where('id','=',$roleId)->value('menu_id');

        $authRule = AuthRule::where('is_show', 1)
            ->where('id','in',$menuid)
            ->order('sort asc')
            ->select()
            ->toArray();
        if (empty($authRule)){
            return [];
        }
        $menus = array2tree($authRule);
        return $menus;
    }
}