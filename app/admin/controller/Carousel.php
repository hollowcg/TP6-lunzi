<?php
/**
 * Desc:
 * User: 晨光
 * Contact: QQ:461718846
 */

namespace app\admin\controller;


use app\common\model\CarouselCate;
use think\facade\Request;

class Carousel extends Base
{
    /**
     * 轮播图分类
     * @return \think\Response|\think\response\View
     */
    public function cateList(){
        if (Request::isAjax()){
            $param = input();
            $data = CarouselCate::getList($param);
            return $this->resultTable($data['data'],$data['total']);
        }
        return view('cate_list');
    }

    public function cateForm(){
        $id = input('id');

        $data = CarouselCate::find($id);

        return view('cate_form',[
            'data'=>$data,
        ]);
    }

    public function cateSave(){
        $param = input();
        if (empty($param['id'])){
            return CarouselCate::addPost($param);
        }else{
            return CarouselCate::editPost($param,['id'=>$param['id']]);
        }
    }

    public function cateDel(){
        $id = input('id');
        return CarouselCate::del($id);
    }

    public function cateDels(){
        $id = input('id');
        return CarouselCate::selectDel($id);
    }

    /**
     * 轮播图分类
     * @return \think\Response|\think\response\View
     */

    /**
     * 轮播图
     */
    public function lst(){
        if (Request::isAjax()){
            $param = input();
            $data = \app\common\model\Carousel::getList($param);
            return $this->resultTable($data['data'],$data['total']);
        }
        return view();
    }
    public function lstForm(){
        $id = input('id');
        $data = \app\common\model\Carousel::find($id);

        $cate = CarouselCate::select();

        return view('lst_form',[
            'data'=>$data,
            'cate'=>$cate,
        ]);
    }
    public function lstSave(){
        $param = input('post.');
        try{
            if (empty($param['id'])){
                $carousel = new \app\common\model\Carousel();
                $carousel->save($param);
            }else{
                $carousel = \app\common\model\Carousel::find($param['id']);
                $carousel->save($param);
            }
            return $this->result();
        }catch (\Exception $e){
            return $this->result(1,$e->getMessage());
        }
    }
    public function lstDel(){
        $id = input('id');
        return \app\common\model\Carousel::del($id);
    }

    public function lstDels(){
        $id = input('id');
        return \app\common\model\Carousel::selectDel($id);
    }
    /**
     * 轮播图
     */
}