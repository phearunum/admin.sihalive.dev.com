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
				'f_id' =>$f_id,
				'action'	=>'insert'
			)
		);
		$this->smarty->display(__CLASS__.'/foodForm.tpl');
	}
	
	public function doEdit()
	{
		try
		{
			$post = $this->input->post();

			$row = $this->food->edit($post);
			
			if($row['afftected_rows'] == 0)
			{
				throw new Exception("update error");
			}
			
			$message ='update ok';
			
			
		}catch(Exception $e)
		{
			
			$message =  $e->getMessage();
		}
		
		$this->myfunc->gotoUrl('/Product', $message);	
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
			$config['file_name']       = sprintf("%d-%d-310x260", $post['ca_id'], $row['f_id']);

			$this->load->library('upload', $config);

			if ( ! $this->upload->do_upload('images'))
			{

			}
			else
			{
				$data = array('upload_data' => $this->upload->data());
				
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
		
		$this->smarty->display(__CLASS__.'/index.tpl');
	}
	
	public function editForm($f_id)
	{
		$this->smarty->assign(
			array(
				'f_id' 		=>$f_id,
				'action'	=>'edit'
			)
		);
		$this->smarty->display(__CLASS__.'/foodForm.tpl');
	}
	
	
}
