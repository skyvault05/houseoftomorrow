(function($) {

	$( ".expert-reset-button").click(function () {
		$( ".expert-calculate" ).each( function () {
		    this.reset();
		});
		$('.btn-group :radio').prop('checked', false);
	    $('.btn-group .active').removeClass('active');
	});


	$('#category-list > li > button').click(function() {
		$('#category-list > li > button').each(function(){
			$(this).removeClass('active');
		});
		$(this).addClass("active");

		let val = $(this).val().trim();
		$('body > section > form > div > div > section > div.estimate-wrap').each(function(){
			$(this).addClass('hide-contents');
		});
		$(val).removeClass("hide-contents");
		$(val).addClass('show-contents');
		//console.log(val);
		
	});


})(jQuery);