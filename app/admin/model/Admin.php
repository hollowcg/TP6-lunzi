<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\model;


use think\facade\Session;

class Admin extends Base
{
    public static function checkLogin($data){
        try{
            $admin = self::where('username',$data['username'])->find();
            trace($admin['password'],'notice');
            trace(encry_code('4356vpt38gMjfbNqUxqKU0vKEjStPtbaUZpATc6-vog','DECODE'),'notice');
            trace(123123,'notice');
            if (!empty($admin)){
                if ($data['password'] == encry_code($admin['password'],'DECODE')){
                    Session::set('admin',$admin->toArray());
                    return json(['code'=>0,'msg'=>'登陆成功','data'=>Session::get('admin')]);
                }else{
                    return json(['code'=>1,'msg'=>'密码错误']);
                }
            }else{
                return json(['code'=>1,'msg'=>'用户不存在']);
            }
        }catch (\Exception $e){
            return json(['code'=>1,'msg'=>$e->getMessage()]);
        }
    }

    public static function getList($param=[]){
        $where = [];

        if (!empty($param['name'])){
            $where[] = ['username|nickname','like','%'.$param['name'].'%'];
        }

        if (!empty($param['admin_role_id'])){
            $where[] = ['admin_role_id','=',$param['admin_role_id']];
        }

        $data = self::with(['adminRole'])->where($where)->order(['id'=>'desc'])->paginate($param['limit']);
        return $data->toArray();
    }

    public function adminRole(){
        return $this->belongsTo(AdminRole::class)->bind([
            'adminRoleName'=>'name'
        ]);
    }

    public function getNicknameAttr($value,$data){
        if (empty($value)){
            return $data['username'];
        }else{
            return $value;
        }
    }
}