<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {
	
	public function __construct() 
	{
		parent::__construct();
		
    }
	
	public function index()
	{
		$shopList = array(
			array(
			),			
			array(
			),			
			array(
			),			
			array(
			),			
			array(
			),
		);
	
		
		$foodTypeClass = array(
			array(
			),
			array(
			),
			array(
			),
		);
		
		$this->smarty->assign(array(
			'shopList'			=>$shopList,
			'foodTypeClass'	=>$foodTypeClass
		));
		$this->smarty->display(__CLASS__.'/index.tpl');
	}
	
	public function menu()
	{
		$foodList = array(
			array(
			),
			array(
			),
			array(
			),
			array(
			),
			array(
			),
			array(
			),
			array(
			),
		);
		
		$this->smarty->assign(array(
			'foodList'			=>$foodList
		));
		$this->smarty->display(__CLASS__.'/menu.tpl');
	}
	
	
	public function shopInfo()
	{
		
		$shopImageList = array(
			array(
			),
			array(
			),
			array(
			),
			array(
			),
		);
		
		$this->smarty->assign(array(
			'shopImageList'			=>$shopImageList
		));
		$this->smarty->display(__CLASS__.'/shopInfo.tpl');
	}
	
	
}
