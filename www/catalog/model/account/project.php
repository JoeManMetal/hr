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

    public function editProject($project_id, $data) {

        $data['project_status'] = 1;

        $this->db->query("UPDATE " . DB_PREFIX . "project SET  project_amount = '" . (int)$data['project_amount'] . "', project_status = '" . (int)$data['project_status'] . "', date_modified = NOW() WHERE project_id = '" . (int)$project_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "project_description WHERE project_id = '" . (int)$project_id . "'");

        foreach ($data['project_description'] as $language_id => $value) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "project_description SET project_id = '" . (int)$project_id . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', project_type = '" . $this->db->escape($value['project_type']) . "', project_source = '" . $this->db->escape($value['project_source']) . "', project_remark = '" . $this->db->escape($value['project_remark']) . "', description = '" . $this->db->escape($value['description']) . "'");
		}

    }


    public function getProject($project_id) {
        $project_query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "project p LEFT JOIN " . DB_PREFIX . "project_description pd ON (p.project_id = pd.project_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "'  AND p.project_status = '1' AND p.project_id = '". (int)$project_id ."'" );

        if ($project_query->num_rows) {

			$project_data = array(
				'project_id'     => $project_query->row['project_id'],
				'name'      => $project_query->row['name'],
				'description'       => $project_query->row['description'],
				'project_type'        => $project_query->row['project_type'],
				'project_source'      => $project_query->row['project_source'],
				'project_amount'      => $project_query->row['project_amount'],
				'project_remark'       => $project_query->row['project_remark']

			);

			return $project_data;
		} else {
			return false;
		}
    }

    public function getProjectDescriptions($project_id) {

        $project_description_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "project_description WHERE project_id = '" . (int)$project_id . "'");

		foreach ($query->rows as $result) {
			$project_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'       => $result['description'],
				'project_type' => $result['project_type'],
				'project_source'     => $result['project_source'],
				'project_remark'      => $result['project_remark']
			);
		}

		return $project_description_data;
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
