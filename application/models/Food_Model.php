<?php
	class Food_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();

		}
		
			
		public function UpdImage($post)
		{
			$sql ="UPDATE food SET f_img_310x260 = ? WHERE f_id =?";
			$bind = array(
				$post['310x260'],
				$post['f_id']
			);
			$this->db->query($sql, $bind);
		}
		
		
		public function edit($post)
		{
			$bind = array(
				$post['f_name'],
				$post['f_description'],
				$post['ca_id'],
				$post['f_status'],
				$post['f_large_price'],
				$post['f_medium_price'],
				$post['f_small_price'],
				$post['f_id']
			);
			$sql = "UPDATE food SET 
						f_name = ? ,
						f_description = ? ,
						ca_id = ? ,
						f_status = ? ,
						f_large_price = ? ,
						f_medium_price = ? ,
						f_small_price = ? 
					WHERE f_id =?";
			$query = $this->db->query($sql, $bind);
			
			$output = array(
				'afftected_rows' =>$this->db->affected_rows(),
			);
			return $output;
		}
		
		public function del($f_id)
		{
			$sql = "UPDATE `food` SET `f_is_del` = '1' WHERE `food`.`f_id` = ?;";
			$bind = array(
				$f_id
			);
			
			$query = $this->db->query($sql, $bind);
			
			$output = array(
				'afftected_rows' =>$this->db->affected_rows(),
			);
			return $output;
		}
		
		public function insert($post)
		{
			$bind =array(
				$post['f_name'],
				$post['f_description'],
				$post['ca_id'],
				$post['f_status'],
				$post['f_large_price'],
				$post['f_medium_price'],
				$post['f_small_price']
			);
			
			$sql ="	INSERT INTO `food` 
					(f_name ,f_description ,ca_id, f_status, f_large_price, f_medium_price, f_small_price)
					VALUES(?, ?, ?, ?, ?, ?, ?)";
			$query = $this->db->query($sql, $bind);
			$insert_id = $this->db->insert_id();
			
			$output = array(
				'f_id'			 =>$insert_id,
				'afftected_rows' =>$this->db->affected_rows()
			);
			return $output;
		}
		
		public function getFoodCategory()
		{
			$sql ="SELECT * FROM `category` ORDER BY ca_id ASC"; 
			$query = $this->db->query($sql, $bind);
			$rows =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
		public function getFoodForId($f_id)
		{
			$sql ="SELECT * FROM food WHERE  f_id = ?";
			$bind = array(
				$f_id
			);
			$query = $this->db->query($sql, $bind);
			$row  =  $query->row_array();
			$query->free_result();
			return $row;
		}
		
		public function getFoodFroList($where = array())
		{
			$where_str =" 1 = 1 AND f_is_del='0'";
			if(!empty($where) )
			{
				foreach($where as $key =>$vale)
				{
					$where_str.=sprintf(" AND %s = ?", $key);
					$bind[] = $value;
				}
			}
			$sql ="	SELECT * 
					FROM 
					food AS fd INNER JOIN category AS cy ON fd.ca_id = cy.ca_id
						WHERE".$where_str;
			$query = $this->db->query($sql, $bind);
			$rows  =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
	}
?>