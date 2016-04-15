$( document ).ready(function() {
	$('.product').each(function(){
		$(this).on({
		  mouseover: function () {
		    var container =  $(this).find(".container-details")
		    container.addClass('active');
		    var leftOffset = container.offset().left;
		    if(leftOffset > screenWidth / 2){
		    	$(container).css('left', '-' + container.width() + 'px');	
		    }
		  },
		  mouseout: function () {
		    $(this).find(".container-details").removeClass('active');
		  }
		});
	});
});
