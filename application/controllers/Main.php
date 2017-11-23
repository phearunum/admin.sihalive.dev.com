<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller {
	
	
	public function __construct() 
	{
		parent::__construct();
		$this->load->model('Food_Model', 'food');	
    }
	
	public function index()
	{
		
		$this->smarty->displayFrame();
	}
	
}
