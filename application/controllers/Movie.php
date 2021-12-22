<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Movie extends RestController
{
    public function __construct()
    {
        parent:: __construct();
        $this->load->model('Movie_model','movie');
    }

    public function index_get()
    {
        $id = $this->get('id');
        if ($id === null){
            $p = $this->get('page');
            $p = (empty($p) ? 1 : $p);
            $total_data = $this->movie->count();
            $total_page = ceil($total_data / 5);
            $start = ($p - 1) * 5;
            $list = $this->movie->get(null, 5, $start); 
            if ($list){
            $data = [
                'status' => true,
                'page' => $p,
                'total_data' => $total_data,
                'total_page' => $total_page,
                'data' => $list
            ];
            }else{
            $data = [
                'status' => false,
                'msg' => 'Data Tidak Ditemukan'
            ];
            }
            $this->response($data,RestController::HTTP_OK);
        }else{
            $data = $this->movie->get('id');
            if ($data){
            $this->response(['status'=>true,'data'=> $data],RestController::HTTP_OK);
            }else{
            $this->response(['status'=>false,'msg'=> $id .'Data Tidak Ditemukan'],RestController::HTTP_NOT_FOUND);   
            }
        }
    }

    public function index_post()
    {
      $data = [

          'judul' => $this->post('judul',true),
          'poster' => $this->post('poster',true),
          'trailer' => $this->post('trailer',true),
          'sinopsis' => $this->post('sinopsis',true),
          'pemeran' => $this->post('pemeran',true),
          'genre' => $this->post('genre',true),
          'tahun_rilis' => $this->post('tahun_rilis',true),
          'durasi' => $this->post('durasi',true),
          'negara' => $this->post('negara',true),
      ];
      $simpan=$this->movie->add($data);
      if($simpan['status']){
          $this->response(['status'=>true,'msg'=>$simpan['data']. 'Data Telah Ditambahkan'], RestController::HTTP_CREATED);
      }else{
          $this->response(['status'=>false,'msg'=>$simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
      }
    }

    public function index_put()
    {
      $data = [

        'judul' => $this->put('judul',true),
        'poster' => $this->put('poster',true),
        'trailer' => $this->post('trailer',true),
        'sinopsis' => $this->put('sinopsis',true),
        'pemeran' => $this->put('pemeran',true),
        'genre' => $this->put('genre',true),
        'tahun_rilis' => $this->put('tahun_rilis',true),
        'negara' => $this->post('negara',true),
    ];
      $id = $this->put('id');
      if($id === null){
          $this->response(['status'=>false,'msg'=> 'Masukkan Data Yang Akan Dirubah'], RestController::HTTP_BAD_REQUEST);
      }
      $simpan=$this->movie->update($id, $data);
      if($simpan['status']){
          $status=(int)$simpan['data'];
      if($status > 0)
          $this->response(['status'=>true,'msg'=>$simpan['data']. 'Data Telah Diubah'], RestController::HTTP_OK);
      else
          $this->response(['status'=>false,'msg'=>'Tidak Ada Data Yang Diubah'], RestController::HTTP_BAD_REQUEST);
      }else{
          $this->response(['status'=>false,'msg'=>$simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
      }
    }

    public function index_delete()
    {
        $id = $this->delete('id');
        if($id === null){
            $this->response(['status'=>false,'msg'=> 'Masukakan Data Yang Akan Dihapus'], RestController::HTTP_BAD_REQUEST);
        }
        $delete=$this->movie->delete($id);
        if($delete['status']){
            $status=(int)$delete['data'];
        if($status > 0)
            $this->response(['status'=>true,'msg'=>'Id'.$id . ' Data Telah Dihapus'], RestController::HTTP_OK);
        else
            $this->response(['status'=>false,'msg'=>'Tidak Ada Data Yang Dihapus'], RestController::HTTP_BAD_REQUEST);
        }else{
            $this->response(['status'=>false,'msg'=>$delete['msg']], RestController::HTTP_INTERNAL_ERROR);
        }
    }
}
