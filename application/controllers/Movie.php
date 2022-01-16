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
            $movie = $this->movie->get();
        }else{
            $movie = $this->movie->get($id);
        }

        if ($movie){
            $this->response([
                'status' => true,
                'data' => $movie
            ], RestController::HTTP_OK);
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
          'negara' => $this->post('negara',true)
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
        'trailer' => $this->put('trailer',true),
        'sinopsis' => $this->put('sinopsis',true),
        'pemeran' => $this->put('pemeran',true),
        'genre' => $this->put('genre',true),
        'tahun_rilis' => $this->put('tahun_rilis',true),
        'durasi' => $this->put('durasi',true),
        'negara' => $this->put('negara',true),
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
