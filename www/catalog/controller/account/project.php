<?php
class ControllerAccountProject extends Controller {
    private $error = array();

	public function index() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/project', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/project');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('account/project');

		$this->getList();
	}

    public function add() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/prjoect', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}


		$this->load->language('account/project');

		$this->document->setTitle($this->language->get('heading_title'));

        $this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

        $this->load->model('account/project');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			$this->model_account_project->addProject($this->request->post);

			$this->session->data['success'] = $this->language->get('text_add');

			// Add to activity log
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			);

			$this->model_account_activity->addActivity('address_add', $activity_data);

			$this->response->redirect($this->url->link('account/project', '', 'SSL'));
		}

		$this->getForm();


    }

    public function edit() {
		if (!$this->customer->isLogged()) {
			$this->session->data['redirect'] = $this->url->link('account/project', '', 'SSL');

			$this->response->redirect($this->url->link('account/login', '', 'SSL'));
		}

		$this->load->language('account/project');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		$this->load->model('account/project');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_account_project->editProject($this->request->get['project_id'], $this->request->post);
 
			$this->session->data['success'] = $this->language->get('text_edit');

			// Add to activity log
			$this->load->model('account/activity');

			$activity_data = array(
				'customer_id' => $this->customer->getId(),
				'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName()
			);

			$this->model_account_activity->addActivity('project_edit', $activity_data);

			$this->response->redirect($this->url->link('account/project', '', 'SSL'));
		}

		$this->getForm();

    }


    protected function getForm() {
        $data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/project', '', 'SSL')
		);

		if (!isset($this->request->get['project_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_edit_project'),
				'href' => $this->url->link('account/project/add', '', 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_edit_project'),
				'href' => $this->url->link('account/project/edit', 'project_id=' . $this->request->get['project_id'], 'SSL')
			);
		}



		$data['heading_title'] = $this->language->get('heading_title');
        $data['text_project'] = $this->language->get('text_project');
        $data['button_continue'] = $this->language->get('button_continue');
		$data['button_back'] = $this->language->get('button_back');

        $data['entry_project_name'] = $this->language->get('entry_project_name');
        $data['entry_description'] = $this->language->get('entry_description');
        $data['entry_project_type'] = $this->language->get('entry_project_type');
        $data['entry_project_source'] = $this->language->get('entry_project_source');
        $data['entry_project_amount'] = $this->language->get('entry_project_amount');
        $data['entry_project_remark'] = $this->language->get('entry_project_remark');


        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();

        $project_info = array();
        if (isset($this->request->get['project_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$project_info = $this->model_account_project->getProject($this->request->get['project_id']);
		}

        if (isset($this->request->post['project_description'])) {
			$data['project_description'] = $this->request->post['project_description'];
		} elseif (isset($this->request->get['project_id'])) {
			$data['project_description'] = $this->model_account_project->getProjectDescriptions($this->request->get['project_id']);
		} else {
			$data['project_description'] = array();
		}

        if (isset($this->request->post['project_amount'])) {
			$data['project_amount'] = $this->request->post['project_amount'];
		} elseif (!empty($project_info)) {
			$data['project_amount'] = $project_info['project_amount'];
		} else {
			$data['project_amount'] = '';
		}



        if (isset($this->error['project_name'])) {
			$data['error_project_name'] = $this->error['project_name'];
		} else {
			$data['error_project_name'] = '';
		}

        if (isset($this->error['project_type'])) {
			$data['error_project_type'] = $this->error['project_type'];
		} else {
			$data['error_project_type'] = '';
		}

        if (isset($this->error['project_source'])) {
			$data['error_project_source'] = $this->error['project_source'];
		} else {
			$data['error_project_source'] = '';
		}

        if (isset($this->error['project_amount'])) {
			$data['error_project_amount'] = $this->error['project_amount'];
		} else {
			$data['error_project_amount'] = '';
		}




        if (!isset($this->request->get['project_id'])) {
			$data['action'] = $this->url->link('account/project/add', '', 'SSL');
		} else {
			$data['action'] = $this->url->link('account/project/edit', 'project_id=' . $this->request->get['project_id'], 'SSL');
		}


        $data['back'] = $this->url->link('account/project', '', 'SSL');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/project_form.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/project_form.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/project_form.tpl', $data));
		}

    }


    protected function validateForm() {

        foreach ($this->request->post['project_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 1) || (utf8_strlen($value['name']) > 255)) {
				$this->error['project_name'][$language_id] = $this->language->get('error_project_name');
			}

			if ((utf8_strlen($value['project_type']) < 1) || (utf8_strlen($value['project_type']) > 255)) {
				$this->error['project_type'][$language_id] = $this->language->get('error_project_type');
			}

            if ((utf8_strlen($value['project_source']) < 1) || (utf8_strlen($value['project_source']) > 255)) {
				$this->error['project_source'][$language_id] = $this->language->get('error_project_source');
			}
		}



        if( empty($this->request->post['project_amount']) || ($this->request->post['project_amount'] <= 0 ) ) {
            $this->error['project_amount'] = $this->language->get('error_project_amount');
        }

        return !$this->error;
    }


    protected function getList() {

        $this->load->language('account/project');

        if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_account'),
			'href' => $this->url->link('account/account', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/address', '', 'SSL')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_address_book'] = $this->language->get('text_address_book');
		$data['text_empty'] = $this->language->get('text_empty');

		$data['button_new_project'] = $this->language->get('button_new_project');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_back'] = $this->language->get('button_back');


        $data['column_project_id'] =  $this->language->get('column_project_id');
        $data['column_project_name'] =  $this->language->get('column_project_name');
        $data['column_project_type'] =  $this->language->get('column_project_type');
        $data['column_project_source'] =  $this->language->get('column_project_source');
        $data['column_project_amount'] =  $this->language->get('column_project_amount');
        $data['column_date_added'] =  $this->language->get('column_date_added');

        $data['projects'] = array();

        $project_total = $this->model_account_project->getTotalProjects();

		$results = $this->model_account_project->getProjects(($page - 1) * 10, 10);

        //dump($results);
		foreach ($results as $result) {

            $data['projects'][] = array(
				'project_id'   => $result['project_id'],
				'name'       => $result['name'],
                'project_type'       => $result['project_type'],
                'project_source'       => $result['project_source'],
                'project_remark'       => $result['project_remark'],
				'project_status'     => $result['project_status'],
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'project_amount'      => $this->currency->format($result['project_amount']),
				'href'       => $this->url->link('account/project/edit', 'project_id=' . $result['project_id'], 'SSL'),
			);

        }



        $pagination = new Pagination();
		$pagination->total = $project_total;
		$pagination->page = $page;
		$pagination->limit = 10;
		$pagination->url = $this->url->link('account/project', 'page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($project_total) ? (($page - 1) * 10) + 1 : 0, ((($page - 1) * 10) > ($project_total - 10)) ? $project_total : ((($page - 1) * 10) + 10), $project_total, ceil($project_total / 10));


        if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

        if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

        $data['add'] = $this->url->link('account/project/add', '', 'SSL');
		$data['back'] = $this->url->link('account/project', '', 'SSL');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');


        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/project_list.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/account/project_list.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/account/project_list.tpl', $data));
		}


    }

}
