/**** Add application wide javascripts below this point  ******/
$(document).ready(function(){
  gallery();
  googlemap();
});

function gallery(){
  if($('#scroller').length){
		$('#image_list').scroller({item:'.carousel_item', pagination:'#next, #previous'});
	}
}
function googlemap(){
  if($('#googlemap').length && GBrowserIsCompatible() ){
    var g_map = new google.maps.Map2(document.getElementById('googlemap'));
    g_map.enableScrollWheelZoom();
		g_map.setUIToDefault();
		var local_search = new google.search.LocalSearch();
		local_search.setSearchCompleteCallback(null, function(){		  
		  if(local_search.results[0]){
		    var resultLat = local_search.results[0].lat, resultLng = local_search.results[0].lng;
		    var latLng = new GLatLng(resultLat, resultLng);
        g_map.setCenter(latLng, 15);
        var gicon = new GIcon(G_DEFAULT_ICON);
	      var marker = new GMarker(latLng, {icon:gicon, title:'Sign Webb'});		      
        g_map.addOverlay(marker);
		  }
		});
		local_search.execute($('#secondary_content address span.postcode').html().replace("<br />", ",")+', UK');
  }
}