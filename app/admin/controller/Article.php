<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\controller;


use app\common\model\ArticleCate;
use app\common\model\ArticleTags;
use think\exception\ValidateException;
use think\facade\Config;
use think\facade\Db;
use think\facade\Request;

class Article extends Base
{
    #栏目管理START

//    栏目列表
    public function cateList(){

        if (Request::isAjax()){
            $param = input();
            $data = Db::name('ArticleCate')->order('sort desc')->select();
            $data = tree($data);
            return $this->resultTable($data,count($data));
        }
        return view('cate_list');
    }

//    栏目表单
    public function cateForm(){
        $id = input('id');
        $pid = input('pid');

//        菜单
        $menus = Db::name('ArticleCate')->select();
//        数据
        $data = Db::name('ArticleCate')->find($id);

        return view('cate_form',[
            'menu'=>tree($menus),
            'pid'=>$pid,
            'data'=>$data,
        ]);
    }

//    栏目保存
    public function cateSave(){
        $data = input();
        try{

            validate(\app\admin\validate\ArticleCate::class)->check($data);

            if (empty($data['id']) ){
                unset($data['id']);
                return ArticleCate::addPost($data);
            }else{
                return ArticleCate::editPost($data,['id'=>$data['id']]);
            }
        }catch (ValidateException $e){
            Db::rollback();
            return $this->result(1,$e->getError());

        }catch (\Exception $e){
            Db::rollback();
            return $this->result(1,$e->getMessage());
        }
    }

//    栏目删除
    public function cateDel(){
        $id = input('id');
//        判断当前删除菜单有没有子菜单
        $isZi = Db::name('ArticleCate')->where('pid',$id)->count();
        if ($isZi){
            return $this->result(1,'该菜单下还有子菜单，请先删除子菜单');
        }

        return ArticleCate::del($id);
    }

    #栏目管理END


    #文章管理START
//    文章列表
    public function articleList(){
        if (Request::isAjax()){
            $param = input();

            $where = [];
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

            $data = \app\common\model\Article::getList($where,$orderArr,$param['limit'],isset($param['is_delete'])?$param['is_delete']:'');

            return $this->resultTable($data->toArray()['data'],$data->total());
        }

        //        栏目内容
        $cate = Db::name('articleCate')->select()->toArray();
        return view('article_list',[
            'cate'=>tree($cate),
        ]);
    }
//    回收站
    public function articleDeleteList(){
        $cate = Db::name('articleCate')->select()->toArray();
        return view('article_delete_list',[
            'cate'=>$cate,
        ]);
    }
//    文章表单
    public function articleForm(){
        $id = input('id');
//        文章内容
        $data = Db::name('article')->find($id);
//        栏目内容
        $cate = Db::name('articleCate')->select()->toArray();
//        标签内容
        $tags = implode(',',Db::name('articleTags')->where('id','in',$data['tags'])->column('name'));

        return view('article_form',[
            'data'=>$data,
            'cate'=>tree($cate),
            'tags'=>$tags,
        ]);
    }
//    文章保存
    public function articleSave(){
        $data = input();
        Db::startTrans();
        try{
            validate(\app\admin\validate\Article::class)->check($data);

//            如果文章有标签，先判断标签是否存在标签表
            $tags = '';
            if (!empty($data['tags'])){
                $tagsArr = explode(',',$data['tags']);
                $data['tags'] = '';
                foreach ($tagsArr as $tag) {
                    $isInTag = ArticleTags::where('name',$tag)->find();
//                    如果标签已经存在，那么直接使用
                    if (!empty($isInTag)){
                        $data['tags'] .= $isInTag['id'].',';
                    }else{
//                        如果标签不存在，新建标签
                        $tagModule = ArticleTags::create(['name'=>$tag]);
                        $data['tags'] .= $tagModule->id.',';
                    }
                }
                $data['tags'] = rtrim($data['tags'],',');
                $tags = $data['tags'];
            }

            if ($data){

                $data['add_user_id'] = session('admin.id');

                empty($data['create_time'])?$data['create_time']=date('Y-m-d H:i:s'):'';

//                删除多余字段
                if (isset($data['file']))
                    unset($data['file']);

//                新增，保存文章数据，增加标签文章数量
                if (empty($data['id'])){
                    unset($data['id']);
                    \app\common\model\Article::addPost($data);
                    ArticleTags::where('id','in',$tags)->inc('num')->update();
                }else{
//                    更新，更新文章数据，先减少旧标签文章数量，再增加
//                    减少标签文章数量
                    $tagsOld = Db::name('article')->where('id',$data['id'])->value('tags');
                    ArticleTags::where('id','in',$tagsOld)->dec('num')->update();
//                    标签文章数量+1
                    ArticleTags::where('id','in',$tags)->inc('num')->update();
//                    更新文章
                    \app\common\model\Article::editPost($data,['id'=>$data['id']]);
                }

            }

            Db::commit();
        }catch (ValidateException $e){
            Db::rollback();
            return $this->result(1,$e->getError());

        }catch (\Exception $e){
            Db::rollback();
            return $this->result(1,$e->getMessage());
        }

        return $this->result(0,'操作成功');
    }
//    文章状态修改
    public function articleStateSave(){
        $data = input();
        return \app\common\model\Article::editPost($data,['id'=>$data['id']]);
    }
//    文章删除
    public function articleDel(){
        $id = input('id');
        $is_delete = input('is_delete');
        if ($is_delete){
            try{
                Db::name('article')->where('id',$id)->delete();
            }catch (\Exception $e){
                return json(['code'=>1,'msg'=>$e->getMessage()]);
            }
            return json(['code'=>0,'msg'=>'删除成功!']);
        }else{
            return \app\common\model\Article::del($id);
        }
    }
//    文章多选删除
    public function articleDels(){
        $id = input('id');
        $is_delete = input('is_delete');
        if ($is_delete){
            try{
                Db::name('article')->where('id','in',$id)->delete();
            }catch (\Exception $e){
                return json(['code'=>1,'msg'=>$e->getMessage()]);
            }
            return json(['code'=>0,'msg'=>'删除成功!']);
        }else{
            return \app\common\model\Article::selectDel($id);
        }

    }
//    文章删除恢复
    public function articleRestore(){
        $id = input('id');
        try{
            Db::name('article')->where('id','in',$id)->update(['delete_time'=>Config::get('app.defaultDeleteTime')]);
        }catch (\Exception $e){
            return $this->result(1,$e->getMessage());
        }
        return $this->result();

    }
    #文章管理END
    #文章标签管理START

//    自动补全标签
    public function autocompleteTags(){
        $name = input('name');
        $data = Db::name('articleTags')->where('name','like',"%$name%")->column('name','id');
        return $this->result('200','success',array_values($data));
    }

    #文章标签管理END
}