<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Order extends CI_Controller {
	public function index()
	{
		$this->smarty->displayFrame(__CLASS__.'/index.tpl');
	}
	
	public function users()
	{
		$this->smarty->display(__CLASS__.'/users.tpl');
	}
	
	public function detail($o_id)
	{
		$this->smarty->assign(array(
			'o_id'	=>$o_id
		));
		$this->smarty->displayFrame(__CLASS__.'/detail.tpl');
	}
}
