<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\common\model;


class ArticleTags extends Base
{
    public static function getList(){
        $data = self::where([
            ['num','>',0]
        ])->select();
        return $data;
    }
}