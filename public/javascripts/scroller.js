/**
  scroller Plugin
  - swaps between 'item' passed in using fade effect
**/
(function($) {

	$.fn.scroller=function(options){
		return this.each(function(){			
			if(this._sw) return; //if already a scroller return
			else this._sw = plugin_counter; //otherwise add the index
      var params = $.extend(true, {}, $.fn.scroller.defaults, options);
			H[plugin_counter] = {container:this, params:params,item_switch_countdown:false, items:[],active:0, counter:0};
		  $.scroller.setup(plugin_counter);
			plugin_counter ++;
		});
	};
	
	//the default config vars
	$.fn.scroller.defaults = {after_function:false, item:'.item', pagination:false, speed:"slow"};
	//the over riden stuff
	$.scroller = {
		hash:{}, //the hash used to store all the configs & targets
		/*
		 loop over all items in the container and add new class and also push them to the internal array - this 
		 is then used for rotate / pagination etc
		*/
		setup:function(index){
		  /*position of the container*/
		  if(ie6 || ie7) H[index].container._margin_left = 1;
		  else H[index].container._margin_left = jQ(H[index].container).eq(0).offset().left - jQ(H[index].container).parent().eq(0).offset().left;
		  if(ie6) H[index].container._margin_top = 0;
		  else H[index].container._margin_top = jQ(H[index].container).eq(0).offset().top - jQ(H[index].container).parent().eq(0).offset().top;
		  H[index].container._width = jQ(H[index].container).outerWidth();
		  H[index].container._height = jQ(H[index].container).parent().outerHeight();
		  jQ(H[index].container).css({'position':'absolute', 'margin-left':H[index].container._margin_left+'px', 'margin-top':H[index].container._margin_top+'px', 'height':H[index].container._height+'px'});
		  /*move each item over by width*/
		  jQ(H[index].container).find(H[index].params.item).each(function(){		  
		    this._left = H[index].counter * H[index].container._width;
		    this._width = jQ(this).outerWidth();
		    H[index].items.push(this);
		    jQ(this).css({'position':'absolute','left':this._left+'px'});
		    H[index].counter++;
		  });
		  if(H[index].params.pagination) $.scroller.pagination_trigger(index);
	  },
	  hide_show:function(index, inbound){
	    for(var div in H[index].items){
        var difference = div - inbound;
        var moveto = difference * H[index].items[div]._width;
        jQ(H[index].items[div]).animate({'left':moveto+'px'}, H[index].params.speed);	      
	    }
	    var next = inbound+1;
	    var previous = inbound-1;
	    	    
	    jQ(H[index].params.pagination).each(function(){
	      if(this.id == "next"){
          if(next > H[index].items.length-1) jQ(this).find('a').addClass('disabled').attr('rel', '');
          else jQ(this).find('a').removeClass('disabled').attr('rel', 'scroll_item_'+next);
	      }else if(this.id == "previous"){
	        if(previous < 0) jQ(this).find('a').addClass('disabled').attr('rel', '');
          else jQ(this).find('a').removeClass('disabled').attr('rel', 'scroll_item_'+previous);
	      }
	    });
	  },
	  pagination_trigger:function(index){
      jQ(H[index].params.pagination).find('a').unbind("click");
      jQ(H[index].params.pagination).find('a').click(function(){
        var outbound = parseInt(this.rel.replace("scroll_item_", ""));
        if(outbound >= 0){
          $.scroller.hide_show(index, outbound);
        }
        return false;
      });
	  }
	};
	var H=$.scroller.hash,	jQ = jQuery; ie6=$.browser.msie&&($.browser.version == "6.0"),ie7=$.browser.msie&&($.browser.version == "7.0"), plugin_counter=0;
})(jQuery);
