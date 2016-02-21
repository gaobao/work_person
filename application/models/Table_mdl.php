<?php
/**
 * Created by PhpStorm.
 * User: gaoxu
 * Date: 2016/2/21
 * Time: 17:28
 */

class Table_mdl extends CI_Model {
    public function __construct(){
        parent::__construct();
    }
    /**
     * 表名称
     * @var
     */
    public $table;
    public function add($data){

    }
    public function delete($where){

    }
    public function update($where,$data){

    }
    public function get($where,$limit=1000,$offset=10,$order_by='id',$sort='desc'){

    }
    public function getRecordNum(){

    }

}