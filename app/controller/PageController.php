<?php

class PageController extends ApplicationController {
  
  public $per_page = 16;
  
  public function controller_global(){
    $this->cms();
    $this->contact_form = new WaxForm(new GetInTouch);
    if($data = $this->contact_form->save()){
      $notify = new Notify;
      $notify->send_contact_details($data->row);
      $this->redirect_to("/thanks/contact");
    }
  }
  
  public function index(){}
  public function thanks(){}
  
  public function sitemap(){
		$this->base_url = 'http://'.$_SERVER['HTTP_HOST'];
		$section = new CmsSection();
		$this->sections = $section->all();		
		$content = new CmsContent("published");
		$this->pages = $content->all();		
		if($this->use_format == "xml") $this->use_layout = false;
	}
  
  /** PARTIALS **/
  public function _latest_news(){
    $this->_list(NEWS_SECTION, 10);
  }
  public function _our_strategy(){}
  public function _current_projects(){
    $this->_list(PROJECTS_SECTION, 2);
  }
  public function _testimonials(){
    $this->_list(TESTIMONIALS_SECTION, 10);
  }
  public function _project_list(){
    $this->_list(PROJECTS_SECTION, 10);
  }
  public function _our_services(){
    $this->section = new CmsSection(SERVICES_SECTION);
    $model = new CmsContent("published");
    $this->items = $this->section->default_page;
    $this->services = $model->filter("cms_section_id", SERVICES_SECTION)->filter("id", $this->items->primval, "!=")->limit(5)->all();
  }
  
  private function _list($section, $limit){
    $this->section = new CmsSection($section);
    $model = new CmsContent("published");
    $this->items = $model->filter("cms_section_id", $section)->limit($limit)->all();
    if(!$this->items->count()) $this->items = array();
  }
}
?>