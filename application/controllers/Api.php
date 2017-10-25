<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Api extends CI_Controller {
	
	private $request = array();
	
	public function __construct() 
	{
		parent::__construct();	
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->load->model('Food_Model', 'food');
    }
	
	public function index()
	{
		
	}
	
	public function foodForIdApi()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='get food edit';
		try 
		{
			
			if(empty($this->request))
			{
				$status ='000';
				throw new Exception("request is empty");
			}
			
			$f_id =$this->request['f_id'];
			$output['body']['row'] = $this->food->getFoodForId($f_id);
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function foodListApi()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='get food list';
		try 
		{
			$output['body']['list'] = $this->food->getFoodFroList();
			if(empty($this->request))
			{
				$status ='000';
				throw new Exception("request is empty");
			}
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	private function response($output)
	{
		
		$output = array(
			'body'		=>$output['body'],
			'title'		=>$output['title'],
			'status'	=>$output['status'],
			'message'	=>$output['message']
		);
		
		header('Content-Type: application/json');
		echo json_encode($output , true);
	}
}
