<?php
/**
 * Created by PhpStorm.
 * User: gaoxu
 * Date: 2016/2/20
 * Time: 20:48
 */

class UserInfoMDL extends CI_Model {
    public function __construct(){
        parent::__construct();
    }
    public function isLogin($email){

    }
    public function login($email,$passwd){

    }
    public function register($eamil,$passwd,$conPasswd){
        $return =array();
        if($this->common->strIsEmail($eamil)){
            if($passwd==$conPasswd){
                if(5<strlen($passwd)&&strlen($passwd)<30){
                    $return['status']=true;
                }else{
                    $return['error_mess']='密码长度需大于5小于30';
                    $return=false;
                }
            }else{
                $return['error_mess']='两次密码输入不一样';
                $return['status']=false;
            }
        }else{
            $return['error_mess']='邮箱格式不正确';
            $return['status']=false;
        }

    }
    public function loginOut($eamil){

    }
    public function updateInfo($userinfo){

    }
}