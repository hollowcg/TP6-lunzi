<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\api\middleware;


use think\facade\Session;

class Api
{
    public function handle($request, \Closure $next)
    {

        //中间件handle方法的返回值必须是一个Response对象。
        return $next($request);
    }

}