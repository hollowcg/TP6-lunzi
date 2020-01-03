<?php
/**
 * Desc:
 * User: hollowcg
 * Contact: QQ:3511691138
 */

namespace app\admin\controller;


class Index extends Base
{
    public function tpltheme(){
        return view('tpl-theme');
    }
    public function tplnote(){
        return view('tpl-note');
    }
}