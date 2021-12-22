<?php

class Movie_model extends CI_model{

    public function __construct()
    {
        parent::__construct();
    }

    public function get($id=null, $limit = 5, $ofsite = 0)
    {
        if ($id === null) {
          return $this->db->get('tb_movie')->result();
        }else{
            return $this->db->get_where('tb_movie',['nama' => $id])->result_array();
        }
    }

    public function count(){
        return $this->db->get('tb_movie')->num_rows();
        
    }

    public function add($data){
        try{
            $this->db->insert('tb_movie',$data);
            $error=$this->db->error();
            if(!empty($error['code'])){
                throw new Exception('Terjadi Kesalahan: '.$error['message']);
                return false;
            }
            return ['status' => true, 'data' => $this->db->affected_rows()];
        } catch (Exception $ex){
            return ['status' => false, 'msg' => $ex->getMessage()];
        }
    }
    
    public function update($id, $data){
        try{
            $this->db->update('tb_movie',$data, ['id' => $id]);
            $error=$this->db->error();
            if(!empty($error['code'])){
                throw new Exception('Terjadi Kesalahan: '.$error['message']);
                return false;
            }
            return ['status' => true, 'data' => $this->db->affected_rows()];
        } catch (Exception $ex){
            return ['status' => false, 'msg' => $ex->getMessage()];
        }
    }

    public function delete($id){
        try{
            $this->db->delete('tb_movie', ['id' => $id]);
            $error=$this->db->error();
            if(!empty($error['code'])){
                throw new Exception('Terjadi Kesalahan: '.$error['message']);
                return false;
            }
            return ['status' => true, 'data' => $this->db->affected_rows()];
        } catch (Exception $ex){
            return ['status' => false, 'msg' => $ex->getMessage()];
        }
    }
}