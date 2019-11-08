<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\controller;


use app\admin\model\Admin;
use think\facade\Request;
use think\facade\Session;

class Login
{
    public function index(){
        if (Request::isAjax()){
            $data = input('post.');
//            校验token
            $tokenRes = formCheckToken($data['__token__']);
            if ($tokenRes){
                return Admin::checkLogin($data);
            }else{
                return $tokenRes;
            }
        }
        return view('',[
            'domain'=>Request::instance()->domain()
        ]);
    }

    // 退出登录
    public function logout(){
        Session::delete('admin');
        return redirect('/admin/login/index');
    }
}