<?php
class ModelAccountProject extends Model {

    public function addProject($data) {

    }

    public function getProject($project_id) {

    }

    public function getProjects() {
        $project_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "project");

        foreach ($query->rows as $result) {

        }
    }

}
