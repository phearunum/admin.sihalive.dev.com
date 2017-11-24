<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends CI_Controller {
	
	
	public function __construct() 
	{
		parent::__construct();
		$this->load->model('Food_Model', 'food');	
    }
	
	public function insert()
	{
		$this->smarty->assign(
			array(
				'f_id' 			=>$f_id,
				'action'		=>'insert',
				'activeMenu'	=>'Product'
			)
		);
		$this->smarty->displayFrame(__CLASS__.'/foodForm.tpl');
	}
	
	public function category()
	{
		$this->smarty->assign(
			array(
				'activeMenu'	=>'Product'
			)
		);
		$this->smarty->display(__CLASS__.'/categoryForm.tpl');
	}
	
	public function doEdit()
	{
		try
		{
			$post = $this->input->post();

			
			$config['upload_path']      = APPPATH.'../../food.sihalive.com/images/food/';
			$config['allowed_types']    = 'png';
			$config['max_width']        = 310;
			$config['max_height']       = 260;
			$config['file_name']       = md5(time().$post['f_id'].rand(1,999));

			$this->load->library('upload', $config);

			if ( ! $this->upload->do_upload('images'))
			{
				// var_dump( $this->upload->display_errors());
			}
			else
			{
				$data = array('upload_data' => $this->upload->data());
				$post['310x260']= $data['upload_data']['orig_name'];
				$this->food->UpdImage($post);
				$imgupd = 1;
			}
			
			$row = $this->food->edit($post);
			

			$message ='update ok';
			
			
		}catch(Exception $e)
		{
			$message =  $e->getMessage();
		}
		
		// $this->myfunc->gotoUrl('/#!/food/', $message);	
	}
	
	public function delFood($f_id)
	{
		try
		{
			$row = $this->food->del($f_id);
			
			if($row['afftected_rows'] == 0)
			{
				throw new Exception("del error");
			}
			
			$message ='del ok';
			
			
		}catch(Exception $e)
		{
			
			$message =  $e->getMessage();
		}
		
		$this->myfunc->gotoUrl('/Product', $message);
	}
	
	public function doInsert()
	{
		try
		{
			$post = $this->input->post();
			$row = $this->food->insert($post);
			
			if($row['afftected_rows'] == 0)
			{
				throw new Exception("insert error");
			}
			
			$config['upload_path']      = APPPATH.'../../food.sihalive.com/images/food/';
			$config['allowed_types']    = 'png';
			$config['max_width']        = 310;
			$config['max_height']       = 260;
			$config['f_img_310x260']       =  md5(time().$row['f_id'].rand(1,999));

			$this->load->library('upload', $config);

			if ( ! $this->upload->do_upload('images'))
			{

			}
			else
			{
				$data = array('upload_data' => $this->upload->data());
				$post['310x260']= $data['upload_data']['orig_name'];
				$this->food->UpdImage($post);
				// var_dump($data);
			}
			
			
			$message ='insert ok';
			
			
		}catch(Exception $e)
		{
			
			$message =  $e->getMessage();
		}
		
		$this->myfunc->gotoUrl('/Product', $message);
	}
	
	public function index()
	{
		
		$this->smarty->displayFrame(__CLASS__.'/index.tpl');
	}
	
	public function editForm($f_id)
	{
		$this->smarty->assign(
			array(
				'f_id' 		=>$f_id,
				'action'	=>'edit',
				'activeMenu'	=>'Product'
			)
		);
		$this->smarty->displayFrame(__CLASS__.'/foodForm.tpl');
	}
	
	
}
