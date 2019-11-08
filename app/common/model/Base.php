<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\common\model;


use think\Model;

class Base extends Model
{
    // 开启自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';


    // 通用修改数据
    public static function edit($id){
        $info = self::find($id);
        return $info;
    }

    // 通用修改保存
    public static function editPost($data,$where)
    {
        $result = self::where($where)
            ->update($data);
        if ($result !== false) {
            return json(['code' => 0, 'msg' => '修改成功']);
        } else {
            return json(['code' => 1, 'msg' => '修改失败']);
        }
    }

    // 通用添加保存
    public static function addPost($data){
        if (isset($data['id']))unset($data['id']);
        $result = self::create($data);
        if ($result) {
            return json(['code' => 0, 'msg' => '添加成功']);
        } else {
            return json(['code' => 1, 'msg' => '添加失败']);
        }
    }

    // 删除
    public static function del($id,$is_delete=''){

        self::destroy($id);
        return json(['code'=>0,'msg'=>'删除成功!']);
    }

    // 批量删除
    public static function selectDel($id,$is_delete=''){
        if ($id) {
            $ids = explode(',',$id);
            self::destroy($ids);
            return json(['code'=>0, 'msg'=>'删除成功!']);
        }else{
            return json(['code' => 1, 'msg' => '删除失败']);
        }
    }

    // 排序修改
    public static function sort($data){
        $info = self::find($data['id']);
        $info -> sort = $data['sort'];
        $info -> save();
        return json(['code'=>0, 'msg'=>'修改成功!']);
    }

    // 状态修改
    public static function state($id){
        $info = self::find($id);
        $info-> status = $info['status'] == 1 ? 0 : 1;
        $info -> save();
        return json(['code'=>0, 'msg'=>'修改成功!']);
    }
}