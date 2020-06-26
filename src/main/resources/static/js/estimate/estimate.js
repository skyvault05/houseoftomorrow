(function($) {

	$( ".expert-reset-button").click(function () {
		$( ".expert-calculate" ).each( function () {
		    this.reset();
		});
		$('.btn-group :radio').prop('checked', false);
	    $('.btn-group .active').removeClass('active');
	});
})(jQuery);