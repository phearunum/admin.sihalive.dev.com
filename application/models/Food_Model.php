<?php
	class Food_Model extends CI_Model 
	{
		function __construct()
		{
			
			parent::__construct();
			$this->load->database();

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
		
		public function getFoodFroList()
		{
			$sql ="SELECT * FROM food AS fd INNER JOIN category AS cy ON fd.ca_id = cy.ca_id";
			$query = $this->db->query($sql, $bind);
			$rows  =  $query->result_array();
			$query->free_result();
			return $rows;
		}
		
	}
?>