
<jsp:directive.include file="myheader.jsp" />

<script src="js/mylib.js"></script>
<script src="js/mytablelist.js"></script>

<!-- page content -->
<div role="main" class="pgcnt">
	<div class="row">
		<div class="col-md-12 col-sm-12 col-xs-12">
			<div class="x_panel">

				<div class="x_title">
					<h2>All Postings</h2>
					<ul class="nav navbar-right panel_toolbox">
						<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#">Settings 1</a>
								</li>
								<li><a href="#">Settings 2</a>
								</li>
							</ul>
						</li>
						<li><a class="close-link"><i class="fa fa-close"></i></a></li>
					</ul>
					<div class="clearfix"></div>
				</div>

				<!-- x_content -->
				<div class="x_content">
					<div class="all_posts">
						<ul>
							<li>
								<a href="#none">
									<dl>
										<dt><img src="images/picture.jpg" alt=""></dt>
										<dd>
											<h4>Name poster</h4>
											<p>Category</p>
											<p>Key Notice</p>
											<p>Price</p>
											<p>Discount</p>
											<p>Phone</p>
											<p>Address</p>
										</dd>
									</dl>
								</a>
								<a href="#none" class="btn_approve">Approve Now</a>
							</li>
							<li>
								<a href="#none">
									<dl>
										<dt><img src="images/picture.jpg" alt=""></dt>
										<dd>
											<h4>Name poster</h4>
											<p>Category</p>
											<p>Key Notice</p>
											<p>Price</p>
											<p>Discount</p>
											<p>Phone</p>
											<p>Address</p>
										</dd>
									</dl>
								</a>
								<a href="#none" class="btn_approve">Approve Now</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- //x_content -->
				
			</div>
		</div>
	</div>
</div>
<!-- /page content -->


<script>
$(document).ready(function() {
	$('.mytable').DataTable({
		responsive: true,
		"lengthMenu": [10,15,25,50,],
		"language": {
			 "search":"Search : "
		}
	});
});
</script>

<jsp:directive.include file="myfooter.jsp" />