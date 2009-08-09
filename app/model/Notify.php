<?
class Notify extends WXEmail{
  
  public $from = "sales@signwebb.co.uk"; 
	public $from_name = "SignWebb"; 
	public $contact_to = "sales@signwebb.co.uk"; 
	public $dev_address = "marmoset@eagermonkey.com";
	
	public function contact_details($data){
	  $this->subject = "Sign Webb Contact Request";
	  $this->data = $data;
	  $this->add_to_address($this->contact_to);
	  $this->add_bcc_address($this->dev_address);	  
	}

}
?>