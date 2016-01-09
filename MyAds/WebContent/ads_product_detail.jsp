<!-- saved from url=(0014)about:internet -->
<!doctype html>
    <%@page import="myads.model.dto.PostingDto"%>
<%@page import="myads.model.util.AESCrypt"%>
<%@include file="ads_header.jsp" %>
    <%@include file="ads_help2.jsp" %>
    <%
    	List<MainCategoryDto> listSubCategory=(List<MainCategoryDto>) request.getSession().getAttribute("CategoryList1");
   		PostingDto postingDto=(PostingDto)request.getSession().getAttribute("productDto");
   		
    %>
	<!-- body_section -->
	<div class="body_section">
		<!-- cnt_wrap -->
		<div class="cnt_wrap">
			<!-- body_cnt -->
			<div class="body_cnt">
				<div class="tit_detail">
					<!-- title -->
					<div class="title f_left">
						<h2>BETTER SHOPPING</h2>
						<p class="space"><strong>Store <span>No. 1315520</span></strong></p>
					</div>
					<!-- //title -->

					<!-- advertise -->
					<div class="adv f_right">
						<a href="#none"><img src="img/adv/metfone.gif" alt="metfone"></a>
					</div>
					<!-- //advertise -->
				</div>

				<!-- container -->
				<div class="container">
					<div class="step">
						<span><a href="#none">Home</a> > </span>
						<span><a href="#none">Store Home</a> > </span>
						<span><a href="#none">Products</a> > </span>
						<span><a href="#none">May</a></span>
					</div>
					<!-- cnt -->
					<div class="cnt cboth" style="padding-left:220px;padding-right:0;">

						<!-- lbn_cnt -->
						<div class="lbn_cnt">
								<!-- navigation -->
							<div class="nav">
								<h3 class="storecate">Store Categories
									<!--<a href="#none" class="allcate on"><span class="blind">all categories</span></a>-->
									<a href="#none" class="allcate"><span class="blind">all categories</span></a>
									<div class="lbn">
										<dl>
											<dt><strong>CATEGORIES</strong>&nbsp;See all ></dt>
											<%
													/* List<MainCategoryDto> rst=CategoryDao.getCategory();
												    List<SubCategoryDto> rst1=CategoryDao.getSubCategory(); */
													for(int j=0;j<rst.size();j++){
												%>
													<dd><a href="mycategory.ads?id=<%=AESCrypt.encrypt(String.valueOf(rst.get(j).getId())) %>" class="<%= rst.get(j).getIco_cls_name() %>"><%= rst.get(j).getName() %></a>
														<div class="more">
															<ul>
																<%
												                	for(int i=0;i<rst1.size();i++)  {  
												                		if (rst.get(j).getId()==rst1.get(i).getId()){
																%>
																	<li><a href="mycategory.ads?id=<%=AESCrypt.encrypt(String.valueOf(rst.get(j).getId())) %>&subid=<%=AESCrypt.encrypt(String.valueOf(rst1.get(i).getId())) %>" target="_blank"><%= rst1.get(i).getName() %></a></li>
																<%
																     }
												                	}
																 %>
															</ul>
														</div>
													</dd>
												<%
													}
												%>        
										</dl>
									</div>
								</h3>
								<div class="item">
									<dl>
										<dt><a href="./mycategory.ads?id=<%=AESCrypt.encrypt(String.valueOf(listSubCategory.get(0).getId())) %>" role="<%=listSubCategory.get(0).getId() %>">
											<%=listSubCategory.get(0).getName() %>
											
										</a></dt>
										<dd>
											<ul>
												<%
													for(int i=0;i<listSubCategory.size();i++){
												%>
													<li><a href="./mycategory.ads?id=<%=AESCrypt.encrypt(String.valueOf(listSubCategory.get(0).getId())) %>&subid=<%=AESCrypt.encrypt(String.valueOf(listSubCategory.get(i).getSubcategory().getId())) %>" role="<%=listSubCategory.get(i).getSubcategory().getId()%>"><%=listSubCategory.get(i).getSubcategory().getName() %></a></li>
												<%
													}
												%>
											</ul>
										</dd>
									</dl>
								</div>
							</div>
							<!-- //navigation -->

							<!-- adv -->
							<div class="adv mgt20">
								<img src="img/adv/adv_detail01.png" alt="">
							</div>
							<!--// adv -->
						</div>
						<!-- lbn_cnt -->

						<!-- ccnt_cnt -->
						<div class="cbn_cnt">
							<!-- ccnt_sec3 -->
							<div class="ccnt_sec3">
								<div class="sub_rbn1">
									<!-- sub_rbn1 -->
									<div class="sub_rbn_cnt">
										<form>
											<legend>Order Form</legend>
											<div class="frm_order">
												<table summary="">
													<caption></caption>
													<colgroup>
													<col style="width:100px;">
													<col>
													</colgroup>
													<tbody>
														<tr>
															<th><div>Price</div></th>
															<td><div><strong>US $ 99.58</strong>/price</div></td>
														</tr>
														<tr>
															<th><div>Sallers</div></th>
															<td><div>Sreng Bunthorn</div></td>
														</tr>
														<tr>
															<th><div>Contact</div></th>
															<td><div><a href="070372639">070 37 26 39</a></div></td>
														</tr>
														<tr>
															<th><div>Email</div></th>
															<td><div>srengbunthorn@gmail.com</div></td>
														</tr>
														<tr>
															<th><div>Address</div></th>
															<td><div>Phnom Penh</div></td>
														</tr>
														<tr>
															<th><div>Quanlity</div></th>
															<td><div>Depends on the product properties you select</div></td>
														</tr>
														<tr>
															<th><div>Total Price</div></th>
															<td><div><strong>US $ 99.58</strong>/price</div></td>
														</tr>
													</tbody>
												</table>
											</div>
										</form>
									</div>
									<!-- //sub_rbn1 -->

									<!-- sub_cnt -->
									<div class="sub_cnt">
										<p class="dsc"><%=postingDto.getTitle() %></p>
										<!-- <p>
											<span class="fav"s><a href="#none"></a><a href="#none"></a><a href="#none"></a><a href="#none"></a><a href="#none"></a></span>
											<span><strong>100.0%</strong> of buyers enjoyed this products (2 votes) &nbsp;&nbsp; | &nbsp;&nbsp; <strong>50</strong> orders</span>
										</p> -->

										<div class="mode">
											<!-- <h2>Key notice</h2> -->
											<div id="cxslide_fade" class="cxslide_fade">
												<div class="box">
													<ul class="list">
													    <%
													        out.print("Image size : "+postingDto.getImageList().size());
													    
													    	for(int i=0;i<postingDto.getImageList().size();i++){													    	
													    %>
														<li>
														   <%=postingDto.getImageList().get(i).getImage() %>
															<a href="#none">
																<img src="uploads/<%=postingDto.getImageList().get(i).getImage() %>">
																
																<!-- <div class="txt">
																	<h4>玩转早春自驾游</h4>
																	<p>春暖花开，万物复苏；</p>
																	<p>到处洋溢着花香的气息；</p>
																	<p>连上七天班的心蠢蠢欲动；</p>
																	<p>不如趁着清明小长假，来次放松心情的自驾游吧！</p>
																</div> -->
																
															</a>
														</li>
														<%
													    	}
														%>
													</ul>
												</div>
											
												<ul class="btn clearfix">
												     <%
													    	for(int i=0;i<postingDto.getImageList().size();i++){													    	
													    %>
													<li>
														<a href="#none">
															<img src="uploads/<%=postingDto.getImageList().get(i).getImage() %>" width="79" height="42">
														</a>
													</li>
													<%
													    	}
													%>
												</ul>
											</div>
											<script>
												$('#cxslide_x').cxSlide({
													plus:true,
													minus:true
												});
											
												$('#cxslide_y').cxSlide({
													type:'y'
												});
											
												$('#cxslide_fade').cxSlide({
													events:'mouseover',
													type:'fade',
													speed:300
												});
											</script>
										</div>
									</div>
									<!-- //sub_cnt -->
								</div>
							</div>
							<!-- //ccnt_sec3 -->

							<!-- share_box -->
							<div class="share_box mgt10">
								<div class="share">
									<h4>Share To</h4>
									<p>
										<a href="#none"><img src="img/share/share01.png" alt=""></a>
										<a href="#none"><img src="img/share/share01.png" alt=""></a>
										<a href="#none"><img src="img/share/share01.png" alt=""></a>
										<a href="#none"><img src="img/share/share01.png" alt=""></a>
									</p>
									<p>Please shar everything here to you friends to get closely life ................</p>
								</div>
								<div class="adv">
									<img src="img/adv/adv07.png" alt="">
								</div>
							</div>
							<!-- //share_box -->

							<div class="tit_wrap mgt10">
								<h3>Products Description</h3>
							</div>

							<!-- description_cnt -->
							<div class="dsc_cnt">
								<!-- rbn_adv -->
								<div class="rbn_adv" style="border:1px solid;">
									<img src="img/adv/adv_right01.png" width="230" alt="">
								</div>
								<!-- //rbn_adv -->

								<!-- product_description -->
								<div class="pro_dsc">
									<p>text1 text1 text1 text1 text1 text1 text1v text1 text1v text1 text1v</p>
									<p>text1 text1 text1 text1 text1 text1 text1v text1 text1v text1 text1v</p>
									<p>text1 text1 text1 text1 text1 text1 text1v text1 text1v text1 text1v</p>
									<div class="img"><img src="img/mode/mode_clothe01.png" alt=""></div>
									<div class="mgt10">
										<dl>
											<dt>Shipping</dt>
											<dd>text skfsldfslfksl</dd>
											<dd>text skfsldfslfksl</dd>
											<dt>Shipping</dt>
											<dd>text skfsldfslfksl</dd>
										</dl>
									</div>
									<div class="adv mgt30">
										<img src="img/adv/adv08.png" alt="">
									</div>
								</div>
								<!-- //product_description -->
							</div>
							<!-- //description_cnt -->

							<!-- related_products -->
							<div class="related_pro mgt30" style="padding:0 20px;">
								<script	type="text/javascript">
									jQuery(document).ready(
									function()
									{
										//-----------------------------------------
										$("#slider-carousel").carousel({activate: function(){},	timerAnimSlide:400,	infinite:true, resizeItem:{width:100}, responsive:{minWidth:645}});
										$("#slider-carousel-2").carousel({activate:	function(){}, timerAnimSlide:400, infinite:true, resizeItem:{width:50},	responsive:{minWidth:645}});
										
										//-----------------------------------------
									});
								</script>
								<h3>Related Products</h3>
								<div class="center">
									<div class="wrapper-center">
										<div id="slider-carousel-2">
											<div class="wrapper-setas">
												<a href="#"	class="seta-dir	setaDir"><em class="sprite seta-pag-dir-md"></em></a>
												<a href="#"	class="seta-esq	setaEsq"><em class="sprite seta-pag-esq-md"></em></a>
												
												<div class="clear"></div>
											</div>
											<div id="container-slider-carousel-2" class="container">
												<div id="content-silder-carousel-2"	class="content">
													<div class="wrapper-itens">
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/lorempixel.jpg" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/lorempixel-1.jpg" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/lorempixel-2.jpg" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/lorempixel-3.jpg" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/com_pro3.png" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
														<div class="item_related">
															<a href="#none">
																<span><img src="img/com/com_pro3.png" alt="" class="img-responsive"></span>
																<dl>
																	<dt>Saling</dt>
																	<dd>10$</dd>
																	<dd>Dresses Office Wear Women Work Outfits Women Work Outfits</dd>
																</dl>
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- //related_products -->

						</div>
						<!-- ccnt_cnt -->
					</div>
					<!-- //cnt -->
					<a href="#none" class="btn_gotop"><span class="blind">gotop</span></a>
				</div>
				<!-- //container -->
			</div>
			<!-- //body_cnt -->
		</div>
		<!-- //cnt_wraps -->
	</div>
	<!-- //body_section -->

	<!-- footer_section -->
	<div class="footer_section">
		<div class="footer_cnt cboth">
			<p class="f_left">Cambodia Added Years 20016</p>
			<p class="f_right">
				<a href="#none">Recently Viewed</a>
				<ul class="blind">
					<li><a href="#none">1</a></li>
					<li><a href="#none">1</a></li>
					<li><a href="#none">1</a></li>
				</ul>
			</p>
		</div>
	</div>
	<!-- //footer_section -->

</div>
<!-- //wrap -->

</body>
</html>
