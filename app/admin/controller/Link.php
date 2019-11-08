<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\controller;


use think\exception\ValidateException;
use think\facade\Db;
use think\facade\Request;

class Link extends Base
{
    public function linkList(){
        $cat = input('cat');
        if (Request::isAjax()){
            $param = input('','','trim');
            $where = [];

            if (!empty($param['name'])){
                $where[] = ['name','like','%'.$param['name'].'%'];
            }

            if (!empty($param['cat'])){
                $where[] = ['cat','=',$param['cat']];
            }


            $data = Db::name('link')->where($where)->paginate($param['limit']);
            return $this->resultTable($data->toArray()['data'],$data->total());
        }
        return view('link_list',[
            'cat'=>$cat,
        ]);
    }

    public function linkForm(){
        $id = input('id');
        $cat = input('cat');
        $data = Db::name('link')->find($id);
        return view('link_form',[
            'data'=>$data,
            'cat'=>$cat,
        ]);
    }

    public function linkSave(){
        $data = input();

        try{

            validate(\app\admin\validate\Link::class)->check($data);

            if (isset($data['file']))unset($data['file']);
            if (empty($data['id'])){
                return \app\common\model\Link::addPost($data);
            }else{
                return \app\common\model\Link::editPost($data,['id'=>$data['id']]);
            }

        }catch (ValidateException $e){
            return $this->result(1,$e->getError());
        }
    }

    public function linkDel(){
        $id = input('id');
        return \app\common\model\Link::del($id);
    }
}