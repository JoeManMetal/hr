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
die;
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

		if (!isset($this->request->get['address_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_edit_project'),
				'href' => $this->url->link('account/project/add', '', 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_edit_project'),
				'href' => $this->url->link('account/address/edit', 'address_id=' . $this->request->get['address_id'], 'SSL')
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
        $data['entry_project_'] = $this->language->get('entry_project_amount');


        $this->load->model('localisation/language');
        $data['languages'] = $this->model_localisation_language->getLanguages();


        if (isset($this->error['project_name'])) {
			$data['error_project_name'] = $this->error['project_name'];
		} else {
			$data['error_project_name'] = '';
		}

        if (isset($this->request->post['project_name'])) {
			$data['project_name'] = $this->request->post['project_name'];
		} elseif (!empty($address_info)) {
			$data['project_name'] = $address_info['project_name'];
		} else {
			$data['project_name'] = '';
		}


        if (isset($this->error['project_type'])) {
			$data['error_project_type'] = $this->error['project_type'];
		} else {
			$data['error_project_type'] = '';
		}

        if (isset($this->request->post['project_type'])) {
			$data['project_type'] = $this->request->post['project_type'];
		} elseif (!empty($address_info)) {
			$data['project_type'] = $address_info['project_type'];
		} else {
			$data['project_type'] = '';
		}


        if (isset($this->error['project_source'])) {
			$data['error_project_source'] = $this->error['project_source'];
		} else {
			$data['error_project_source'] = '';
		}

        if (isset($this->request->post['project_source'])) {
			$data['project_source'] = $this->request->post['project_source'];
		} elseif (!empty($address_info)) {
			$data['project_source'] = $address_info['project_source'];
		} else {
			$data['project_source'] = '';
		}


        if (isset($this->error['project_amount'])) {
			$data['error_project_amount'] = $this->error['project_amount'];
		} else {
			$data['error_project_amount'] = '';
		}

        if (isset($this->request->post['project_amount'])) {
			$data['project_amount'] = $this->request->post['project_amount'];
		} elseif (!empty($address_info)) {
			$data['project_amount'] = $address_info['project_amount'];
		} else {
			$data['project_amount'] = '';
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

        return !$this->error;
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

		$this->load->model('account/address');

    }

    protected function getList() {
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

        $data['projects'] = array();


        $results = $this->model_account_project->getProjects();
        //dump($results);
		foreach ($results as $result) {


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
