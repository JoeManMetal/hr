<?php
class ModelAccountProject extends Model {

    public function addProject($data) {

        $data['project_status'] = 1;
        $data['remarks'] = '';

        $this->db->query("INSERT INTO " . DB_PREFIX . "project SET customer_id = '" . (int)$this->customer->getId() . "', project_type = '" .  $this->db->escape($data['project_type']) . "', project_source = '" . $this->db->escape($data['project_type']) . "', project_amount = '" . (float)$data['project_amount'] . "', project_status = '" . (int)$data['project_status']  . "', remarks = '" . $this->db->escape($data['remarks']) . "', date_added = NOW()");

		$project_id = $this->db->getLastId();

        foreach ($data['project_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "project_description SET project_id = '" . (int)project_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
    }

    public function getProject($project_id) {

    }

    public function getProjects() {


        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "project");

        return $query->rows;

    }

}
