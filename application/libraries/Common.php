<?php
/**
 * Created by PhpStorm.
 * User: gaoxu
 * Date: 2016/2/21
 * Time: 16:31
 */

/**
 * 常用函数类
 * Class Common
 */
class Common {
    public function strIsEmail($email){
        return preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/",$email);
    }
}