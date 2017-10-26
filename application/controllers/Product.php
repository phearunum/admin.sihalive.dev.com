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
	
	public function doInsert()
	{
		$post = $this->input->post();
		$this->food->insert($post);
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
