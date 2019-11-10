<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\middleware;


use think\facade\Session;
use think\facade\View;

class Admin
{
    public function handle($request, \Closure $next)
    {
        //获取当前用户
        $admin_id = Session::get('admin.id');

//        判断是否有session记录，如果没有输出数据，前台跳转
        if (empty($admin_id)) {
            View::assign('loginout',true);
        }else{
            View::assign('loginout',false);
        }


        //中间件handle方法的返回值必须是一个Response对象。
        return $next($request);
    }

}