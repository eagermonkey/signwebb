<?php

class ApplicationController extends CMSApplicationController{
  
  
  public function __construct(){
	  parent::__construct();
	  $this->server = "http://".$_SERVER['HTTP_HOST'];
	  $google = Config::get('google_maps');
	  $this->google_maps_key = $google[$_SERVER['HTTP_HOST']];
	}
	
  /**
   * run the normal cms check and then follow
   * it up by finding specific items in the section
   * tree
   */
  public function cms(){
    parent::cms(); 
    $this->primary_section = $this->section(0);
    $this->secondary_section = $this->section(1);
  }
  
  /** SECTIONS **/
  private function section($index){
    if($this->cms_section && $this->cms_section->primval && $this->section_stack[$index]){
      $section = new CmsSection;
      return $section->filter("url", $this->section_stack[$index])->first();
    }else return false;
  }
  
}

?>