<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2019 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
declare (strict_types = 1);

namespace app\api\controller;

use Qiniu\Storage\UploadManager;
use think\App;
use think\Db;
use think\exception\HttpResponseException;
use think\exception\ValidateException;
use think\facade\Config;
use think\facade\Request;
use think\facade\View;
use think\Response;
use think\facade\Session;
use think\Validate;

/**
 * 控制器基础类
 */
abstract class Base
{
    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;

    /**
     * 是否批量验证
     * @var bool
     */
    protected $batchValidate = false;

    /**
     * 控制器中间件
     * @var array
     */
    protected $middleware = [
        'app\api\middleware\Admin',
    ];

    /**
     * 构造方法
     * @access public
     * @param  App  $app  应用对象
     */
    public function __construct(App $app)
    {
        $this->app     = $app;
        $this->request = $this->app->request;

        // 控制器初始化
        $this->initialize();
    }

    // 初始化
    protected function initialize(){

    }

    /**
     * 验证数据
     * @access protected
     * @param  array        $data     数据
     * @param  string|array $validate 验证器名或者验证规则数组
     * @param  array        $message  提示信息
     * @param  bool         $batch    是否批量验证
     * @return array|string|true
     * @throws ValidateException
     */
    protected function validate(array $data, $validate, array $message = [], bool $batch = false)
    {
        if (is_array($validate)) {
            $v = new Validate();
            $v->rule($validate);
        } else {
            if (strpos($validate, '.')) {
                // 支持场景
                list($validate, $scene) = explode('.', $validate);
            }
            $class = false !== strpos($validate, '\\') ? $validate : $this->app->parseClass('validate', $validate);
            $v     = new $class();
            if (!empty($scene)) {
                $v->scene($scene);
            }
        }

        $v->message($message);

        // 是否批量验证
        if ($batch || $this->batchValidate) {
            $v->batch(true);
        }

        return $v->failException(true)->check($data);
    }

    public function __call($method, $args)
    {
        return view($method);
    }

    /**
     * 返回封装后的API数据到客户端
     * @param  mixed   $data 要返回的数据
     * @param  integer $code 返回的code
     * @param  mixed   $msg 提示信息
     * @param  string  $type 返回数据格式
     * @param  array   $header 发送的Header信息
     * @return Response
     */
    protected function result(int $code = 0, $msg = '操作成功',array $data=[], string $type = '', array $header = []): Response
    {
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'time' => time(),
            'data' => $data,
        ];
//        $type     = $type ?: 'json';
//        $response = Response::create($result, $type)->header($header);
//
//        throw new HttpResponseException($response);\
        return  json($result);
    }

    /**
     * 返回封装后的API数据到表格
     * @param  mixed   $data 要返回的数据
     * @param  mixed   $count 总数据条数
     * @param  integer $code 返回的code
     * @param  mixed   $msg 提示信息
     * @param  string  $type 返回数据格式
     * @param  array   $header 发送的Header信息
     * @return Response
     */
    protected function resultTable($data=[],$count=0, int $code = 0, $msg = '', string $type = '', array $header = []): Response
    {
        $result = [
            'code' => $code,
            'msg'  => $msg,
            'time' => time(),
            'data' => $data,
            'count' => $count,
        ];

        $type     = $type ?: 'json';
        $response = Response::create($result, $type)->header($header);

        throw new HttpResponseException($response);
    }

    /**
     * 七牛云上传
     * @param $files
     * @return Response
     * @throws \Exception
     */
    protected function uploadsFilesByQiniu($files){

        $fileName = time().'.'.getPostfix($files['file']['name']);

//        构建对象
        $auth = new \Qiniu\Auth(langSite('qiniuyun_ak'),langSite('qiniuyun_sk'));
//        生成token
        $token = $auth->uploadToken(langSite('qiniuyun_bucket'));
//        初始化upload对象，上传
        $uploadMgr = new UploadManager();
        list($ret, $err) = $uploadMgr->putFile($token,$fileName,$files['file']['tmp_name']);
        if ($err !== null){
            return $this->result(1,$err);
        }else{
            return $this->result(0,$ret,['src'=>langSite('qiniuyun_domain').'/'.$fileName]);
        }
    }

    /**
     * 上传文件到本地服务器
     * @param $files
     * @return bool|string
     */
    protected function uploadsFiles($files){
        $file = request()->file('file');
        // 上传到本地服务器
        $savename = \think\facade\Filesystem::putFile('uploads',$file);
        return  $this->result(0,'上传成功',['src'=>'/'.$savename]);

    }
}
