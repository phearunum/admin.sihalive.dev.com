<?php
	class Order_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();

		}
		
		
		public function getOrdersCount()
		{
			$sql ="SELECT 
					o_status,
					os_name,
					COUNT(*) as total 
					FROM `order_list` AS ol
						INNER JOIN user AS u ON ol.u_id = u.u_id
						INNER JOIN order_status AS os ON os.os_id = ol.o_status
				    GROUP BY ol.o_status 
					ORDER BY o_status ASC";
			$query = $this->db->query($sql, $bind);
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function getOrderStatus()
		{
			$sql ="SELECT * FROM `order_status` ORDER BY `os_id` ASC";
			$query = $this->db->query($sql, $bind);
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function updOrderStatus($ary)
		{
			$sql = "UPDATE order_list SET o_status = ?  WHERE o_id =?";
			$bind = array(
				$ary['o_status'],
				$ary['o_id'],
			);
			$query = $this->db->query($sql, $bind);
			$output = array(
				'afftected_rows' =>$this->db->affected_rows(),
			);
			return $output;
		}
		
		public function getOrderList($ary = array())
		{
			$where =" WHERE 1 = 1";
			if(!empty($ary))
			{
				foreach($ary   as $key =>$value)
				{
					if($key =="recods" || $key=="p")
					{
						continue;
					}
					
					if($value !="" && $value!="all")
					{
						$where.=sprintf(" AND %s = ?", $key);
						$bind[] = $value;
					}
				}
			}
			$sql ="	SELECT 
						ol.*,
						os.*,
						u.u_name,
						u.u_email,
						u.fb_u_id,
						(SELECT SUM(od_price) FROM order_detail AS t1 WHERE t1.o_id = ol.o_id) AS ol_total , 
						false AS detailShow
					FROM 
						order_list AS ol 
							INNER JOIN user AS u ON u.u_id = ol.u_id
							INNER JOIN order_status AS os ON os.os_id = ol.o_status
					".$where."
					ORDER BY o_id DESC , ol.o_status ASC
					";
			// echo $sql;
			$limit = sprintf(" LIMIT %d ,%d ", abs($ary['p']-1)*$ary['recods'], $ary['recods']);
			$search_sql =$sql.$limit ;
			$query = $this->db->query($search_sql, $bind);
			$rows =  $query->result_array();
			
			
			$count_sql = "SELECT COUNT(t.o_id) AS total FROM (".$sql.") AS t";
			$query = $this->db->query($count_sql, $bind);
			$total =  $query->row_array();
			$query->free_result();
		
			$output = array(
				'rows'	=>$rows,
				'total'	=>$total['total']
			);
			return $output;			
		}
		
		public function getDetailListByOid($o_id = array())
		{
			$where = " 1 = 1 ";
			$in = join("','" , $o_id);
			$where.=" AND od.o_id IN('".$in."')";
			
			$sql ="	SELECT * 
					FROM 
						order_list AS ol 
							INNER JOIN order_detail AS od ON ol.o_id = od.o_id
							INNER JOIN food AS f ON f.f_id = od.f_id
						
					WHERE ".$where;
			$query = $this->db->query($sql, $bind);
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
	}
?>