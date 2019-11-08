<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\middleware;


use think\facade\Session;

class Admin
{
    public function handle($request, \Closure $next)
    {
        //获取当前用户
        $admin_id = Session::get('admin.id');
        if (empty($admin_id)) {
            return redirect('admin/Login/index');
        }


        //中间件handle方法的返回值必须是一个Response对象。
        return $next($request);
    }

}