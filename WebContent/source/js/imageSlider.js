/** Uses Slick Slider by Ken Wheeler
		 https://kenwheeler.github.io/slick/
 * 
 */
		(function($) {
			setTimeout(function() {
				$('.slider-images-container').slick({
					slidesToShow : 4,
					slidesToScroll : 1,
					dots : true,
					responsive : [ {
						breakpoint : 480,
						settings : {
							slidesToShow : 1,
							slidesToScroll : 1,
							dots : false
						}
					} ]
				});
			}, 1000);
		}(jQuery));	
