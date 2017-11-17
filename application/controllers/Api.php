<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Api extends CI_Controller {
	
	private $request = array();
	
	public function __construct() 
	{
		parent::__construct();	
		$this->request = json_decode(trim(file_get_contents('php://input'), 'r'), true);
		$this->load->model('Food_Model', 'food');
		$this->load->model('Order_Model', 'order');
		$this->load->library('pagination');
    }
	
	
	public function ordersCount()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='get Order Count';
		try 
		{
			$rows= $this->order->getOrdersCount();
			if(!empty($rows))
			{
				foreach($rows as $value)
				{
					$orders_count[$value['o_status']] = $value;
				}
			}
			$output['body']['orders_count'] = $orders_count;
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function orderDetailList($o_id)
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='get Detail list';
		try 
		{
			$ary = array(
				'od.o_id'	=>$o_id
			);
			$output['body']['details'] = $this->order->getDetailList($ary);
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function updateOrderStatus()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='Update Order Status';
		$ary = $this->input->get();
		try 
		{
			$row = $this->order->updOrderStatus($ary);
			if($row['afftected_rows'] <=0)
			{
				$status ='000';
				throw new Exception("update error");
			}
			$rows = $this->order->getOrdersCount();
			if(!empty($rows))
			{
				foreach($rows as $value)
				{
					$orders_count[$value['o_status']] = $value;
				}
			}
			$output['body']['orders_count'] = $orders_count;
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
	}
	
	public function orderList()
	{
		$output['status'] = 100;
		$output['body'] =array();
		$output['title'] ='get order list';
		try 
		{
			$ary = $this->input->get();
			$data =  $this->order->getOrderList($ary);
			$output['body']['orders'] = $data['rows'];
			$output['body']['total'] = $data['total'];
			
			$page_numbers = $output['body']['total']/$ary['recods'] ;
			for($i=1;$i<=$page_numbers;$i++)
			{
				$pages[] = array('p'=>$i);
			}
			$output['body']['pages'] = $pages ;
			$output['body']['p'] = $ary['p'];
			$output['body']['prev'] = abs($ary['p']-1);
			$output['body']['next'] = $ary['p']+1;
			if(!empty($output['body']['orders']) )
			{
				foreach($output['body']['orders'] as $value)
				{
					$o_id[] = $value['o_id'];
				}
				$rows = $this->order->getDetailListByOid($o_id);
				if(!empty($rows))
				{
					foreach($rows as $value)
					{
						$details[$value['o_id']][] = $value;
					}
				}
				
				foreach($output['body']['orders'] as &$value)
				{
					$value['details'] = $details[$value['o_id']];
				}
			}
			
			$output['body']['order_status'] = $this->order->getOrderStatus();
			
		}catch(Exception $e)
		{
			$output['status'] = $status ;
			$output['message'] = $e->getMessage();
		}
		
		$this->response($output);
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
			$output['body']['row']['category_list'] = $this->food->getFoodCategory();
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
