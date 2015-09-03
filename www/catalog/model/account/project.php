<?php
class ModelAccountProject extends Model {

    public function addProject($data) {

    }

    public function getProject($project_id) {

    }

    public function getProjects() {
        

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "project");

        return $query->rows;

    }

}
