<?php
defined('BASEPATH') or exit('No direct script access allowed');

use chriskacerguis\RestServer\RestController;

class Coming_soon extends RestController
{
    public function __construct()
    {
        parent:: __construct();
        $this->load->model('Coming_soon_model','coming_soon');
    }

    public function index_get()
    {
        $id = $this->get('id');
        if ($id === null){
            $p = $this->get('page');
            $p = (empty($p) ? 1 : $p);
            $total_data = $this->coming_soon->count();
            $total_page = ceil($total_data / 5);
            $start = ($p - 1) * 5;
            $list = $this->coming_soon->get(null, 5, $start); 
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
            $data = $this->coming_soon->get('id');
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

          'judul' => $this->post('judul'),
          'poster' => $this->post('poster'),
          'trailer' => $this->post('trailer'),
          'sinopsis' => $this->post('sinopsis'),
          'pemeran' => $this->post('pemeran'),
          'genre' => $this->post('genre'),
          'tanggal_rilis' => $this->post('tanggal_rilis'),
          'durasi' => $this->post('durasi'),
          'negara' => $this->post('negara'),
      ];
      $simpan=$this->coming_soon->add($data);
      if($simpan['status']){
          $this->response(['status'=>true,'msg'=>$simpan['data']. 'Data Telah Ditambahkan'], RestController::HTTP_CREATED);
      }else{
          $this->response(['status'=>false,'msg'=>$simpan['msg']], RestController::HTTP_INTERNAL_ERROR);
      }
    }

    public function index_put()
    {
      $data = [

        'judul' => $this->put('judul'),
        'poster' => $this->put('poster'),
        'trailer' => $this->post('trailer'),
        'sinopsis' => $this->put('sinopsis'),
        'pemeran' => $this->put('pemeran'),
        'genre' => $this->put('genre'),
        'tahun_rilis' => $this->put('tahun_rilis'),
        'negara' => $this->post('negara'),
    ];
      $id = $this->put('id');
      if($id === null){
          $this->response(['status'=>false,'msg'=> 'Masukkan Data Yang Akan Dirubah'], RestController::HTTP_BAD_REQUEST);
      }
      $simpan=$this->coming_soon->update($id, $data);
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
        $delete=$this->coming_soon->delete($id);
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
