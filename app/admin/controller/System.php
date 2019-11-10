<?php


namespace app\admin\controller;


use app\admin\model\Admin;
use app\admin\model\SystemGroup;
use app\admin\validate\NavCate;
use app\common\model\Nav;
use Qiniu\Config;
use Qiniu\Storage\BucketManager;
use think\Exception;
use think\exception\ValidateException;
use think\facade\Cache;
use think\facade\Db;
use think\facade\Request;

class System extends Base
{

    # 系统设置  START
    public function systemSave(){
        $data = input();

        try{

            foreach ($data as $k=>$v){
                $data[$k] = [
                    'field'=>$k,
                    'value'=>$v,
                ];
            }
            $data = array_values($data);

            foreach ($data as $k=>$v){
                $system = \app\admin\model\System::where(['field'=>$v['field']])->find();
                if (empty($system)){
                    $system = new \app\admin\model\System();
                }
                $system->field = $v['field'];
                $system->value = $v['value'];
                $system->save();
            }

//            删除缓存
            deleteDir(app()->getRuntimePath().'/temp');

            return $this->result(0,'保存成功');

        }catch (Exception $e){
            return $this->result(1,$e->getMessage());
        }
    }
    public function uploads(){
        $file = $_FILES;
        $upload_type = langSite('upload_type');
        if ($upload_type == 'localhost'){
            return $this->uploadsFiles($file);
        }elseif ($upload_type == 'qiniuyun'){
            return $this->uploadsFilesByQiniu($file);
        }

    }
    # 系统设置  END

    #七牛云 START
//    获取七牛云文件列表
    public function qiniuyunList(){
        $auth = new \Qiniu\Auth(langSite('qiniuyun_ak'),langSite('qiniuyun_sk'));
        $bucketManager = new BucketManager($auth);

        // 要列取文件的公共前缀
        $prefix = '';
        // 上次列举返回的位置标记，作为本次列举的起点信息。
        $marker = '';
        // 本次列举的条目数
        $limit = 30;
        $delimiter = '/';

        list($ret,$err) = $bucketManager->listFiles(langSite('qiniuyun_bucket'),$prefix,$marker,$limit,$delimiter);
        if ($err !== null){
            $this->result(1,$err);
        }else{
            $data = [];
            foreach ($ret['items'] as $k=>$v){
                $data[$k]['name'] = $v['key'];
                $data[$k]['url'] = langSite('qiniuyun_domain').'/'.$v['key'];
                $data[$k]['type'] = getPostfix($v['key']);
                $data[$k]['updateTime'] = substr($v['putTime'],0,10);
                $data[$k]['isDir'] = false;
            }
            $this->result(0,'抓取成功',$data);
        }
    }
//    删除七牛云文件
    public function qiniuyunDel(){
        $key = input('name');
        $auth = new \Qiniu\Auth(langSite('qiniuyun_ak'),langSite('qiniuyun_sk'));
        $config = new Config();
        $bucketManager = new BucketManager($auth,$config);
        $err = $bucketManager->delete(langSite('qiniuyun_bucket'),$key);
        if ($err === null){
            return $this->result(0,'删除成功');
        }else{
            return $this->result(1,$err);
        }
    }
//    查询文件在数据库中是否使用
    public function qiniuyunFileUse(){
        $url = input('url');
//        获取当前数据库所有的数据表
        $tables = Db::query('show tables');

        foreach ($tables as $k=>$v){
            $fields = Db::table($v['Tables_in_myblog'])->getFields();
            foreach ($fields as $kf=>$vf){
                $tables[$k]['fields'][] = $kf;
            }
        }

        dump($tables);
        $useTables = [];
        foreach ($tables as $k=>$v){

        }

    }
    #七牛云 END

    #本地文件管理  START
    public function localhostFile(){

    }
    #本地文件管理  END

    #前台导航分类  START
    public function navCateList(){
        if (Request::isAjax()){
            $param = input();
            $data = Db::name('navCate')->select();
            return $this->resultTable($data);
        }
        return view('nav_cate_list');
    }
    public function navCateForm(){
        $id = input('id');
        $data = Db::name('navCate')->find($id);
        return view('nav_cate_form',[
            'data'=>$data,
        ]);
    }
    public function navCateSave(){
        $data = input();
        try{
            validate(\app\admin\validate\NavCate::class)->check($data);

            if (empty($data['id'])){
                return \app\common\model\NavCate::addPost($data);
            }else{
                return \app\common\model\NavCate::editPost($data,['id'=>$data['id']]);
            }

        }catch (ValidateException $e){
            return $this->result(1,$e->getError());
        }
    }
    public function navCateDel(){
        $id = input('id');
        return \app\common\model\NavCate::del($id);
    }

    public function navCateDels(){
        $id = input('id');
        return \app\common\model\NavCate::selectDel($id);
    }
    #前台导航分类  END


    #前台导航  START
    public function navList(){
        if (Request::isAjax()){
            $param = input();
            $data = Db::name('nav')->order('sort asc,id asc')->select();
            $data = tree($data);
            return $this->resultTable($data,count($data));
        }
        return view('nav_list');
    }
    public function navForm(){
        $id = input('id');
        $pid = input('pid');

//        菜单
        $menus = Db::name('nav')->select();
//        数据
        $data = Db::name('nav')->find($id);

        $articleCate = Db::name('articleCate')->select();

        return view('nav_form',[
            'menu'=>tree($menus),
            'pid'=>$pid,
            'data'=>$data,
            'articleCate'=>tree($articleCate),
        ]);
    }
//    导航保存
    public function navSave(){
        $data = input();
        if (empty($data['id']) ){
            return Nav::addPost($data);
        }else{
            return Nav::editPost($data,['id'=>$data['id']]);
        }
    }

//    导航删除
    public function navDel(){
        $id = input('id');
//        判断当前删除菜单有没有子菜单
        $isZi = Db::name('nav')->where('pid',$id)->count();
        if ($isZi){
            return $this->result(1,'该菜单下还有子菜单，请先删除子菜单');
        }

        return Nav::del($id);
    }
    #前台导航  END
}