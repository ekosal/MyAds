	
<%@page import="myads.model.dao.PostingDao"%>
<%@page import="myads.model.dto.PostingListDto"%>
<jsp:directive.include file="ads_header.jsp" />
	<jsp:directive.include file="ads_help.jsp" />

	<script>
		function register(){
			frmregister.submit();
		}
	</script>

	<!-- body_section -->
	<div class="body_section">
		<!-- cnt_wrap -->
		<div class="cnt_wrap">
			<!-- body_cnt -->
			<div class="body_cnt">
				<!-- container -->
				<div class="container">
					
					<!-- mypost header -->
					<div class="mypost_header cboth">
						<div class="f_left cboth">
							<h1 class="f_left"><span style="color:#0174b3;">MyAds's</span> <span style="color:#f7153a;">Posting</span></h1>
						</div>
						<div class="f_right mypost_srch">
							<label><input type="text" placeholder="Find your posts...!" style="width:400px;"></label>
							<a href="#none" class="btn_create_acc btn_mypost">Search</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="lay_newposting.ads" class="btn_create_acc btn_mypost">Add New Post</a>
						</div>
					</div>
					<!-- //mypost header -->
					
					<!-- mypost content -->
					<div class="mypost_cnt mgt20">
						<ul>
							<%
							    PostingDao postingDao=new PostingDao();
								List<PostingListDto> postinglist=postingDao.getPostingList();
								for(int i=0;i<postinglist.size();i++){
							
							%>
							<li>
								<div class="img"><a href="#none"><img src="uploads/<%=postinglist.get(i).getImg() %>" alt=""></a></div>
								<dl>
									<dt>Product Name:<a href="#none"><%=postinglist.get(i).getProductName() %></a></dt>
									<dd>Category Type: <%=postinglist.get(i).getSubCateName() %></dd>
									<dd><strong>Price: <%=postinglist.get(i).getPrice() %></strong></dd>
									<dd><strong>Discount: <%=postinglist.get(i).getDiscount() %></strong></dd>
									<dd>Phone Number: <%=postinglist.get(i).getPhone() %></dd>
									<dd>Your Address: <%=postinglist.get(i).getAdr() %></dd>
								</dl>
								<div class="btn_wrap">
									<a href="#none" class="btn_post disable_post">Disable Post</a>
									<a href="#none" class="btn_post enabl_post">Enable Post</a>
									<a href="#none" class="btn_post edit_post">Edit Post</a>
								</div>
							</li>
							<%
								}
							%>
						</ul>
					</div>
					<!-- //mypost content -->

					<!-- Paging wrap -->
					<div class="paging_wrap mgt30">
						<!-- pagination -->
						<div class="paging"><!-- 비활성상태는 on class 제거 -->
							<a href="#none" class="btn_pag_cntr first"><span class="blind">first</span></a><a href="#none" class="btn_pag_cntr prev"><span class="blind">previous</span></a>
							<span class="pag_num">
								<a href="#none" class="on">1</a><a href="#none">2</a><a href="#none">3</a><a href="#none">4</a><a href="#none">5</a><a href="#none">6</a><a href="#none">7</a><a href="#none">8</a><a href="#none">9</a><a href="#none">10</a>
							</span>
							<a href="#none" class="btn_pag_cntr next on"><span class="blind">next</span></a><a href="#none" class="btn_pag_cntr last on"><span class="blind">last</span></a>
						</div> 
						<!-- //pagination -->
						
					</div>
					<!-- //Paging wrap -->
					
					
				</div>
				<!-- //container -->
			</div>
			<!-- //body_cnt -->
		</div>
		<!-- //cnt_wraps -->
	</div>
	<!-- //body_section -->

	<jsp:directive.include file="ads_footer.jsp" />
