	<header id="top-head">
		<div class="naviclass navbar-collapse role=navigation navbar-fixed-top" id="navidiv">
			 <h1 class="logo">TravelMaker</h1> 
			<nav id="main-nav">
				<ul>
					<li><a href="#">Plans</a></li>
					<li><a href="#">Schedules</a></li>
					<li><a href="#">Logo</a></li>
					<li><a href="#">Review</a></li>
					<li><a href="#">Board</a></li>
				</ul>
			</nav>
		</div>
	</header>
	
		<script>
		(function($) {
			$(function() {
				var $header = $('#top-head');
				$(window).scroll(function() {
					if ($(window).scrollTop() > 50) {
						$header.addClass('fixed');
					} else {
						$header.removeClass('fixed');
					}
				});
			});
		})(jQuery);
	</script>