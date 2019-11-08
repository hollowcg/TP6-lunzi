<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\common\model;


class ArticleCate extends Base
{
//    一对多获取文章
    public function article(){
        return $this->hasMany('Article');
    }
}