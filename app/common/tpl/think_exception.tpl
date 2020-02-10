<?php
    if(!function_exists('parse_padding')){
        function parse_padding($source)
        {
            $length  = strlen(strval(count($source['source']) + $source['first']));
            return 40 + ($length - 1) * 8;
        }
    }

    if(!function_exists('parse_class')){
        function parse_class($name)
        {
            $names = explode('\\', $name);
            return '<abbr title="'.$name.'">'.end($names).'</abbr>';
}
}

if(!function_exists('parse_file')){
function parse_file($file, $line)
{
return '<a class="toggle" title="'."{$file} line {$line}".'">'.basename($file)." line {$line}".'</a>';
}
}

if(!function_exists('parse_args')){
function parse_args($args)
{
$result = [];

foreach ($args as $key => $item) {
switch (true) {
case is_object($item):
$value = sprintf('<em>object</em>(%s)', parse_class(get_class($item)));
break;
case is_array($item):
if(count($item) > 3){
$value = sprintf('[%s, ...]', parse_args(array_slice($item, 0, 3)));
} else {
$value = sprintf('[%s]', parse_args($item));
}
break;
case is_string($item):
if(strlen($item) > 20){
$value = sprintf(
'\'<a class="toggle" title="%s">%s...</a>\'',
htmlentities($item),
htmlentities(substr($item, 0, 20))
);
} else {
$value = sprintf("'%s'", htmlentities($item));
}
break;
case is_int($item):
case is_float($item):
$value = $item;
break;
case is_null($item):
$value = '<em>null</em>';
break;
case is_bool($item):
$value = '<em>' . ($item ? 'true' : 'false') . '</em>';
break;
case is_resource($item):
$value = '<em>resource</em>';
break;
default:
$value = htmlentities(str_replace("\n", '', var_export(strval($item), true)));
break;
}

$result[] = is_int($key) ? $value : "'{$key}' => {$value}";
}

return implode(', ', $result);
}
}
?>

<!DOCTYPE HTML>
<html>
<head>
    <title>系统发生错误</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <style type="text/css">
        body{
            font-family: 'Love Ya Like A Sister', cursive;
        }
        body{
            background:#eaeaea;
        }
        .wrap{
            margin:0 auto;
            width:1000px;
        }
        .logo{
            text-align:center;
            margin-top:150px;
        }
        .logo img{
            width:350px;
        }
        .logo p{
            color:#272727;
            font-size:40px;
            margin-top:1px;
        }
        .logo p span{
            color:lightgreen;
        }
        .sub a{
            color:#fff;
            background:#272727;
            text-decoration:none;
            padding:10px 20px;
            font-size:13px;
            font-family: arial, serif;
            font-weight:bold;
            -webkit-border-radius:.5em;
            -moz-border-radius:.5em;
            -border-radius:.5em;
        }


        .footer{
            color:black;
            position:absolute;
            right:10px;
            bottom:10px;
        }
        .footer a{
            color:rgb(114, 173, 38);
        }
    </style>
</head>


<body>

<div class="wrap">
    <div class="logo">
        <p><?php echo nl2br(htmlentities($message)); ?></p>
        <img src="/static/img/404.png"/>
        <div class="sub"><p><a href="javascript:history.back(-1);">返回 </a></p></div>
    </div>
</div>



</body>
</html>
