<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\controller;



use app\admin\model\AdminRole;
use app\admin\model\AuthRule;
use app\admin\model\Admin;
use think\exception\ValidateException;
use think\facade\Db;
use think\facade\Request;
use think\facade\Session;

class Auth extends Base
{

    #权限管理START

//    权限列表
    public function authList(){

        if (Request::isAjax()){
            $param = input();
            $data = Db::name('authRule')->order('sort asc,id asc')->select();
            $data = tree($data);
            return $this->resultTable($data,count($data));
        }
        return view('auth_list');
    }

//    权限表单
    public function authForm(){
        $id = input('id');
        $pid = input('pid');

//        菜单
        $menus = Db::name('authRule')->select();
//        数据
        $data = Db::name('authRule')->find($id);

        return view('auth_form',[
            'menu'=>tree($menus),
            'pid'=>$pid,
            'data'=>$data,
        ]);
    }

//    权限保存
    public function authSave(){
        $data = input();
        if (empty($data['id']) ){
            return AuthRule::addPost($data);
        }else{
            return AuthRule::editPost($data,['id'=>$data['id']]);
        }
    }

//    权限删除
    public function authDel(){
        $id = input('id');
//        判断当前删除菜单有没有子菜单
        $isZi = Db::name('authRule')->where('pid',$id)->count();
        if ($isZi){
            return $this->result(1,'该菜单下还有子菜单，请先删除子菜单');
        }

        return AuthRule::del($id);
    }

    #权限管理END

    #管理员管理START
    public function adminList(){

        if (Request::isAjax()){

            $param = input();
            $data = Admin::getList($param);

            return $this->resultTable($data['data'],$data['total']);
        }

        $adminRole = AdminRole::select();
        return view('admin_list',[
            'adminRole'=>$adminRole,
        ]);
    }

    public function adminForm(){
        $id = input('id');
        $data = Db::name('admin')->find($id);
        if (!empty($data)){
            $data['password'] = encry_code($data['password'],'DECODE');
        }

        $role = Db::name('adminRole')->select();

        return view('admin_form',[
            'data'=>$data,
            'role'=>$role,
            'admin_role_id'=>\session('admin.admin_role_id'),
        ]);
    }

    public function adminSave(){
        $data = input();

        try{

            validate(\app\admin\validate\Admin::class)->check($data);

            if (isset($data['file']))unset($data['file']);

            $data['password'] = encry_code($data['password']);
            if (empty($data['id'])){
                return Admin::addPost($data);
            }else{
                return Admin::editPost($data,['id'=>$data['id']]);
            }

        }catch (ValidateException $e){
            return $this->result(1,$e->getError());
        }
    }

    public function adminDel(){
        $id = input('id');
        return Admin::del($id);
    }

    public function adminDels(){
        $id = input('id');
        return Admin::selectDel($id);
    }
    public function adminStateSave(){
        $data = input();
        return Admin::editPost($data,['id'=>$data['id']]);
    }
    #管理员管理END

    #管理员角色START
    public function adminRoleList(){
        if (Request::isAjax()){
            $param = input();

            $where = [];

            if (!empty($param['name'])){
                $where[] = ['name','like','%'.$param['name'].'%'];
            }

            $data = Db::name('adminRole')->where($where)
                ->select();
            $count = Db::name('adminRole')->where($where)
                ->count();

            return $this->resultTable($data,$count);
        }
        return view('admin_role_list');
    }

    public function adminRoleForm(){
        $id = input('id');
        $data = Db::name('adminRole')->find($id);
        return view('admin_role_form',[
            'data'=>$data
        ]);
    }

    public function adminRoleSave(){
        $data = input();

        try{

            validate(\app\admin\validate\AdminRole::class)->check($data);

            if (empty($data['id'])){
                return AdminRole::addPost($data);
            }else{
                return AdminRole::editPost($data,['id'=>$data['id']]);
            }

        }catch (ValidateException $e){
            return $this->result(1,$e->getError());
        }


    }

    public function adminRoleDel(){
        $id = input('id');
        return AdminRole::del($id);
    }

//    角色权限页面
    public function adminRolePower(){
        $id = input('id');
        return view("admin_role_power",[
            'id'=>$id,
        ]);
    }

//    角色权限获取
    public function adminRolePowerZtree(){
        $id = input('id');
        $menus = Db::name('authRule')->field('id,name,pid as pId,pid')->select()->toArray();
        $menu_id = Db::name('adminRole')->where('id',$id)->value('menu_id');
        foreach ($menus as $k=>$v){
            $menus[$k]['open'] = true;
            if (in_array($v['id'],explode(',',$menu_id))){
                $menus[$k]['checked'] = true;
            }
        }
        $menus = tree($menus);
        return json($menus);
    }

//    角色权限保存
    public function adminRolePowerSave(){
        $data = input();
        return AdminRole::editPost($data,['id'=>$data['id']]);
    }
    #管理员角色END
}