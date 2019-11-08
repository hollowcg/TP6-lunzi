<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\common\model;


use think\facade\Config;
use think\model\concern\SoftDelete;

class Article extends Base
{
    use SoftDelete;
    protected $deteleTime = 'delete_time';
    protected $defaultSoftDelete = '0000-01-01 00:00:00';

    /**
     * 查询文章内容，
     * @param array $where
     * @param array $order
     * @param int $limit
     * @param string $is_delete 软删除使用
     * @param string $datetime_format 默认时间格式，默认是配置文件的格式
     * @return \think\Paginator
     * @throws \think\exception\DbException
     */
    public static function getList($where=[],$order=[],$limit=10,$is_delete='',$datetime_format=''){
//        设定查询出的数据默认时间格式
        if (!empty($datetime_format)){
            Config::set(['datetime_format'=>$datetime_format],'database');
        }
//        只查询软删除数据
        if ($is_delete){
            $data = self::onlyTrashed()->where($where)
                ->order($order)
                ->paginate($limit);
        }else{
//            未删除数据
            $data = self::where($where)
                ->order($order)
                ->paginate($limit);
        }

        foreach ($data as $k=>$v){

            if ($v->ArticleCate){
                $v['cateName'] = $v->ArticleCate->getData('name');
            }
        }

        return $data;
    }

//    一对一获取文章栏目
    public function ArticleCate(){
        return $this->belongsTo('ArticleCate');
    }

}