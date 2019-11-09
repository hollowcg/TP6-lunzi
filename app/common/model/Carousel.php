<?php
/**
 * Desc:
 * User: 晨光
 * Contact: QQ:461718846
 */

namespace app\common\model;


class Carousel extends Base
{
    public static function getList($param=[]){
        $where = [];

        if (!empty($param['name'])){
            $where[] = ['name','like','%'.$param['name'].'%'];
        }

        $data = self::where($where)->order(['id'=>'desc'])->paginate($param['limit']);
        return $data->toArray();
    }
}