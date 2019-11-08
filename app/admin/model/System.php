<?php


namespace app\admin\model;


class System extends Base
{
    public function systemGroup(){
        return $this->belongsTo('systemGroup');
    }

    public static function getList($where=[],$pageSize,$order=''){

        $order .= 'sort desc';

        $list = self::where($where)
            ->order($order)
            ->paginate($pageSize);

        foreach ($list as $k=>$v){
            $v['type_name']  = self::getType($v['type']);
            $v['group_name'] = $v->systemGroup->getData('name');
        }

        return $list;
    }

    // 字段类型
    public static function getType($type=''){
        $arr=[
            'text'      => '单行文本',
            'textarea'  => '多行文本',
            'editor'    => '编辑器',
            'select'    => '下拉列表',
            'radio'     => '单选按钮',
            'checkbox'  => '复选框',
            'image'     => '单张图片',
            'file'      => '文件上传',
            'datetime'  => '日期和时间',
            'template'  => '选择模板',
        ];
        if ($type) {
            return $arr[$type];
        } else {
            return $arr;
        }
    }
}