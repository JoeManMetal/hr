<?php
class ModelAccountProject extends Model {

    public function addProject($data) {

        $data['project_status'] = 1;

        $this->db->query("INSERT INTO " . DB_PREFIX . "project SET customer_id = '" . (int)$this->customer->getId() . "', project_amount = '" . (float)$data['project_amount'] . "', project_status = '" . (int)$data['project_status']  . "',  date_added = NOW()");

		$project_id = $this->db->getLastId();

        foreach ($data['project_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "project_description SET project_id = '" . (int)$project_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', project_type = '" . $this->db->escape($value['project_type']) . "', project_source = '" . $this->db->escape($value['project_source']) . "', project_remark = '" . $this->db->escape($value['project_remark']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}
    }

    public function getProject($project_id) {

    }

    public function getTotalProjects() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "project` p WHERE  p.project_status > '0' ");

		return $query->row['total'];
    }

    public function getProjects($start = 0, $limit = 20) {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 1;
		}

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "project p LEFT JOIN " . DB_PREFIX . "project_description pd ON (p.project_id = pd.project_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'  AND p.project_status = '1' ORDER BY LCASE(pd.name) LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;


	}

}
