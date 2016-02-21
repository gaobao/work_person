<?php
/**
 * Created by PhpStorm.
 * User: gaoxu
 * Date: 2016/2/20
 * Time: 20:51
 */

class FileLIB {
    public function upload($file,$file_path='./file/',$alowExt=array('jpg','png','jpeg','wbmp')){
        $return=array();
        $filename=$file['name'];
        $type=$file['type'];
        $size=$file['size'];
        $error=$file['error'];
        $tmp_name=$file['tmp_name'];
        $ext=$this->getExt($filename);
        $final_file_name=$this->getUniName().'.'.$this->getExt($filename);
        if($error==UPLOAD_ERR_OK){
            if(in_array($ext,$alowExt)){
                if(is_uploaded_file($tmp_name)){
                    if(move_uploaded_file($tmp_name,$file_path.DIRECTORY_SEPARATOR.$final_file_name)){
                        $return['error_mess']='文件上传成功';
                        $return['status']=true;
                        $return['final_filename']=$final_file_name;
                        $return['filename']=$filename;
                    }else{
                        $return['error_mess']='文件移动失败';
                        $return['status']=false;
                    }
                }else{
                    $return['error_mess']='文件不是通过http上传而来';
                    $return['status']=false;
                }
            }else{
                $return['error_mess']='该文件类型不允许上传';
                $return['status']=false;
            }

        }else{
            $return['status']=false;
            switch($error){
                case 1:
                    $return['error_mess']='超过配置文件上传大小'; //UPLOAD_ERR_INI_SIZE
                    break;
                case 2:
                    $return['errror_mess']='超过表单上传大小';//UPLOAD_ERR_FORM_SIZE
                break;
                case 3:
                    $return['error_mess']='文件部分被上传';//UPLOAD_ERR_PARTIAL
                break;
                case 4:
                    $return['error_mess']='没有文件被上传';//UPLOAD_ERR_NO_FILE
                break;
                case 6:
                    $return['error_mess']='没有找到临时目录';//UPLOAD_ERR_NO_TMP_DIR
                break;
                case 7:
                    $return['error_mess']='文件不可写';//UPLOAD_ERR_CANT_WRITE
                break;
                case 8:
                    $return['error_mess']='扩展程序终止了上传';//UPLOAD_ERR_EXTENSION
                break;
                default:
                    $return['error_mess']='未知原因';
            }
        }
        return $return;
    }

    /**
     * 生成唯一字符串
     * @return string
     */
    public function getUniName(){
        return md5(uniqid(microtime(true),true));
    }

    /**
     * 获取文件扩展名
     * @param $filename
     * @return string
     */
    public function getExt($filename){
        return strtolower(end(explode('.',$filename)));
    }
}