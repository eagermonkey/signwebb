<?
class GetInTouch extends WaxModel{
  public $form_prefix = 'get_in_touch';
  public $form_tags = true;
  
  public function setup(){
    $this->define("name", "CharField", array('required'=>true));
    $this->define("email_address", "EmailField", array('required'=>true));
    $this->define("company_name", "CharField");
    $this->define("telephone_number", "CharField");
    $this->define("message", "TextField", array('required'=>true));
  }
  

}
?>