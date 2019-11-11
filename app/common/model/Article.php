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
    public static function getList($param=[],$is_delete='',$datetime_format=''){
//        设定查询出的数据默认时间格式
        if (!empty($datetime_format)){
            Config::set(['datetime_format'=>$datetime_format],'database');
        }

        $where = [];
        $limit = empty($param['limit'])?10:$param['limit'];
//            标题
        if (!empty($param['title'])){
            $where[] = ['a.title','like','%'.$param['title'].'%'];
        }

//            分类
        if (!empty($param['article_cate_id'])){
            $where[] = ['a.article_cate_id',$param['article_cate_id']];
        }

//            时间
        if (!empty($param['datetime'])){
            $time = explode(' ~ ',$param['datetime']);
            $where[] = ['a.create_time','between time',$time];
        }

//            排序
        if (!empty($param['type']) && $param['type'] == 'order' && !empty($param['order'])){
            $field = input('field');
            $order = input('order');
            $orderArr[$field] = $order;
        }else{
            $orderArr['is_top'] = "desc";
            $orderArr['is_show'] = "desc";
            $orderArr['sort'] = "desc";
            $orderArr['id'] = "desc";
        }

//        只查询软删除数据
        if ($is_delete){
            $data = self::onlyTrashed()->where($where)
                ->order($orderArr)
                ->paginate($limit);
        }else{
//            未删除数据
            $data = self::where($where)
                ->order($orderArr)
                ->paginate($limit);
        }

        foreach ($data as $k=>&$v){

            if ($v->ArticleCate){
                $v['cateName'] = $v->ArticleCate->getData('name');
            }

            $v['tags_data'] = ArticleTags::where('id','in',$v['tags'])->select();

            $data[$k] = $v;
        }

        return $data;
    }

//    一对一获取文章栏目
    public function ArticleCate(){
        return $this->belongsTo('ArticleCate');
    }

    public static function getListApi($param){

    }
}