
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
								<h4>Poster's Name</h4>
								<dl>
									<dt><img src="images/picture.jpg" alt="" style="width:230px;height:240px;"></dt>
									<dd>
										<h4>Product title</h4>
										<p>Category</p>
										<p>Key Notice</p>
										<p><strong>100 $</strong>/Price</p>
										<p>Discount</p>
										<p>Phone</p>
										<p>Address</p>
									</dd>
								</dl>
								<a href="#none" class="btn_moreimg on">See All Photos</a>
								<a href="#none" class="btn_approve">Approve Now</a>
								<!-- layer all images -->
								<div class="layer cboth" style="display:block;">
									<ul>
										<li><img src="images/picture.jpg" alt="" style="width:250px;height:240px;"></li>
										<li><img src="images/picture.jpg" alt="" style="width:250px;height:240px;"></li>
										<li><img src="images/picture.jpg" alt="" style="width:250px;height:240px;"></li>
										<li><img src="images/picture.jpg" alt="" style="width:250px;height:240px;"></li>
									</ul>
								</div>
								<!-- //layer all images -->
							</li>
							<li>
								<h4>Poster's Name</h4>
								<dl>
									<dt><img src="images/picture.jpg" alt="" style="width:230px;height:240px;"></dt>
									<dd>
										<h4>Product Title</h4>
										<p>Category</p>
										<p>Key Notice</p>
										<p><strong>120 $</strong>/Price</p>
										<p>Discount</p>
										<p>Phone</p>
										<p>Address</p>
									</dd>
								</dl>
								<a href="#none" class="btn_moreimg">See All Photos</a>
								<a href="#none" class="btn_approve">Approve Now</a>
								<!-- layer all images -->
								<div class="layer cboth" style="display:none;">
									<ul>
										<li><img src="images/picture.jpg" alt="" style="width:250px;height:240px;"></li>
										<li><img src="images/picture.jpg" alt="" style="width:250px;height:240px;"></li>
										<li><img src="images/picture.jpg" alt="" style="width:250px;height:240px;"></li>
										<li><img src="images/picture.jpg" alt="" style="width:250px;height:240px;"></li>
									</ul>
								</div>
								<!-- //layer all images -->
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