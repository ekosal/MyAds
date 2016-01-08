
<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<jsp:directive.include file="ads_header.jsp" />

	<!-- body_section -->
	<div class="body_section">
		<!-- cnt_wrap -->
		<div class="cnt_wrap" style="position:relative;">
			
			<% if(session.getAttribute("membername") == null ){ %>
			 	<p class="logged" style="display:none;">
					<a href="#none">
						<img src="img/com/com01.png" alt="" style="text-align:center;">
						<%= session.getAttribute("membername") %>
					</a>
				</p>
			 <% } else {%>
			 	<p class="logged" style="display:block;">
					<a href="lay_myadsprofile.ads">
						<img src="img/com/com01.png" alt="" style="text-align:center;">
						<%= session.getAttribute("membername") %>
					</a>
				</p>
			 <%} %>

			<!-- banner_wrap -->
			<div class="banner_wrap">
				<!-- banner_cnt -->
				<div class="banner_cnt cboth">
					<!-- lbn -->
					<div class="lbn">

						<%
							try{
								String url="jdbc:mysql://localhost:3306/ads_db";
								String user="root";
								String password="";
								Class.forName("com.mysql.jdbc.Driver");
								Connection con=DriverManager.getConnection(url, user, password);
						
						%>
						<dl>
							<dt><strong>CATEGORIES</strong>&nbsp;See all ></dt>
								<%
						        	
						             String query1 = "select *  from tbl_category";
						             Statement st1 = con.createStatement();
						             ResultSet rs1 = st1.executeQuery(query1);
						
						             while (rs1.next()) {
						                //for(rs1.size)
						                 //out.println(rs1.size());
								%>
								<dd><a href="mycategory.ads?id=<%= rs1.getString(1)%>" class="<%= rs1.getString(2)%>"><%= rs1.getString(3)%></a>
									<div class="more">
										<ul>
											<%
							                     String query2 = "select * from tbl_sub_category where CateId='" + rs1.getString(1) + "'";
							                     Statement st2 = con.createStatement();
							                     ResultSet rs2 = st2.executeQuery(query2);
							                     while (rs2.next()) {
											%>
											<li><a href="#none"><%= rs2.getString(3) %></a></li>
											<%
											     }
											 %>
										</ul>
									</div>
								</dd>
								<%
								     }
								%>
						</dl>
						<%
						      } catch (Exception e1) {
						      
						      }
						 %>

					</div>
					<!-- //lbn -->

					<!-- cnt_wrap -->
					<div class="cnt_wrap">
						<!-- cnt -->
						<div class="cnt cboth">
							<!-- slide_case -->
							<div class="slide_case">
								<div class="slide_cnt">
									<!-- slides_case -->
									<div class="slides_case" style="position:relative;width:716px;height:420px;margin:0 auto;">
										<!-- slide_container-->
										<div id="slider1_container" style="position:absolute;width:716px;height:420px;">
											<!-- Slides Container -->
											<div u="slides" style="cursor:move;position:relative;top:0px;width:716px;height:420px;overflow:hidden;">
												<!-- slide1 -->
												<div>
													<!-- main slide -->
													<img u="image" src="img/bg/bg_banner/red.png"/>
													<!-- //main slide -->

													<!-- sub_slide1 -->
													<div u="caption" t="NO" t3="RTT|2" r3="137.5%" du3="3000" d3="500" style="position:absolute;width:445px;height:300px;top:20px;left:280px;z-index:9999;">
														<img src="img/bg/bg_sub_banner/c-phone.png" style="position:absolute;width:445px;height:300px;top:0px;left:0px;"/>
														<img u="caption" t="CLIP|LR" du="4000" t2="NO" src="img/bg/bg_sub_banner/abc.png" style="position:absolute;width:102px;height:78px;top:70px;left:130px;"/>
														<img u="caption" t="ZMF|10" t2="NO" src="img/bg/bg_sub_banner/text.png" style="position:absolute;width:80px;height:53px;top:153px;left:163px;"/>
														<img u="caption" t="RTT|10" t2="NO" src="img/bg/bg_sub_banner/fruit.png" style="position:absolute;width:140px;height:90px;top:60px;left:220px;"/>
														<img u="caption" t="T" du="3000" t2="NO" src="img/bg/bg_sub_banner/rolling1.png" style="position:absolute;width:200px;height:155px;top:57px;left:121px;"/>
													</div>
													<!-- sub_slide1 -->

													<!-- sub_slide2 -->
													<div u="caption" t="RTT|2" r="-75%" du="1600" d="2500" t2="NO" style="position:absolute;width:470px;height:220px;top:40px;left:220px;z-index:9999;">
														<img src="img/bg/bg_sub_banner/c-phone-horizontal.png" style="position:absolute;width:470px;height:220px;top:0px;left:0px;"/>
														<img u="caption" t3="MCLIP|L" du3="2000" src="img/bg/bg_sub_banner/c-slide-1.jpg" style="position:absolute;width:379px;height:213px;top:4px;left:45px;"/>
														<img u="caption" t="MCLIP|R" du="2000" t2="NO" src="img/bg/bg_sub_banner/c-slide-3.jpg" style="position:absolute;width:379px;height:213px;top:4px; left:45px;"/>
														<img u="caption" t="RTTL|BR" x="500%" y="500%" du="1000" d="-3000" r="-30%"] t3="L" x3="70%" du3="1600" src="img/bg/bg_sub_banner/finger.png" style="position:absolute;width:257px;height:300px;top:80px;left:200px;"/>
														<img src="img/bg/bg_sub_banner/rolling2.png" style="position:absolute;width:379px;height:213px;top:4px;left:45px;"/>
													</div>
													<!-- sub_slide2 -->

													<h2 class="title_case1">First-One</h2>
													<div class="detail_case1">
														<p>Detail</p>
														<p>Detail</p>
														<p>Detail</p>
														<a href="#none">Try it now</a>
													</div>
												</div>
												<!-- //slide1 -->

												<!-- slide2 -->
												<div>
													<img u="image" src="img/bg/bg_banner/purple.jpg"/>
													<h2 class="title_case1">Second-Two</h2>
													<div class="detail_case1">
														<p>Detail</p>
														<a href="#none">Try it now</a>
													</div>
												</div>
												<!-- //slide2 -->

												<!-- slide3 -->
												<div>
													<img u="image" src="img/bg/bg_banner/blue.jpg"/>
													<h2 class="title_case1">Third-Three</h2>
													<div class="detail_case1">
														<p>Detail</p>
														<a href="#none">Try it now</a>
													</div>
												</div>
												<!-- //slide3 -->

												<!-- slide4 -->
												<div>
													<img u="image" src="img/bg/bg_banner/blue.jpg"/>
													<h2 class="title_case1">Third-Three</h2>
													<div class="detail_case1">
														<p>Detail</p>
														<a href="#none">Try it now</a>
													</div>
												</div>
												<!-- //slide4 -->

												<!-- slide5 -->
												<div>
													<img u="image" src="img/bg/bg_banner/blue.jpg"/>
													<h2 class="title_case1">Third-Three</h2>
													<div class="detail_case1">
														<p>Detail</p>
														<a href="#none">Try it now</a>
													</div>
												</div>
												<!-- //slide5 -->
											</div>
											<!-- //Slides Container -->

											<!-- bullet_navigator_container -->
											<div u="navigator" class="jssorb21" style="bottom:-30px;right:6px;">
												<div u="prototype"></div>
											</div>
											<!-- //bullet_navigator_container -->

											<!-- arrow_left -->
											<span u="arrowleft" class="jssora21l"></span>
											<!-- //arrow_left -->

											<!-- arrow_right -->
											<span u="arrowright" class="jssora21r"></span>
											<!-- //arrow_right -->
										</div>
										<!-- slide_container -->
									</div>
									<!-- //slides_case -->
								</div>
							</div>
							<!-- //slide_case -->

							<!-- banner_ads -->
							<div class="banner_ads">
								<div class="adv"><a href="#none"><img src="img/bg/bg_adv1.png" alt=""><span class=""></span></a></div>
								<div class="adv"><a href="#none"><img src="img/bg/bg_adv2.png" alt=""><span class=""></span></a></div>
							</div>
							<!-- //banner_ads -->
						</div>
						<!-- //cnt -->
					</div>
					<!-- //cnt_wrap -->
				</div>
				<!-- //banner_cnt -->
			</div>
			<!-- banner_wrap -->

			<!-- body_cnt -->
			<div class="body_cnt">
				<!-- container -->
				<div class="container">
					<!-- cnt -->
					<div class="cnt cboth">
						<!--<div class="case_show">
							<div class="slider-wrapper">
								<div class="slider-box"><img src="img/slider/slide-1.jpg" alt="" /></div>
								<div class="slider-box"><img src="img/slider/slide-2.jpg" alt="" /></div>
								<div class="slider-box"><img src="img/slider/slide-3.jpg" alt="" /></div>
							</div>
						</div>-->

						<!-- tbl_myproducts_wrap -->
						<div class="tbl_myproducts_wrap">
							<!-- tbl_popular -->
							<div class="tbl_popular">
								<h2 class="poplar"><span class="txt_r">We-Care</span> Popular Products<a href="#none" class="btn_view_more"><span class="count_items"><span class="txt_r"><strong>550</strong></span> items</span></a></h2>
								<table summary="">
									<colgroup>
									<col>
									<col>
									<col>
									<col>
									<col>
									</colgroup>
									<tbody>
										<tr>
											<td rowspan="2">
												<div>
													<a href="#none"><img src="img/popular/cover/1.png" width="188" height="270" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/1.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/2.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/3.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/4.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/6.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
										</tr>
										<tr>
											<td>
												<div>
													<a href="#none"><img src="img/popular/7.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/8.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/9.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/1.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
											<td>
												<div>
													<a href="#none"><img src="img/popular/1.png" width="189" height="110" alt="">
														<p>Feeature Brand</p>
													</a>
												</div>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- //tbl_popular -->

							<!-- tbl_allcollection -->
							<div class="tbl_allcollection mgt30">
								<!-- last post -->
								<div class="last_post">
									<h2 class="today_post"><span class="txt_r">Today's</span> Last Posts <a href="#none" class="btn_view_more"><span class="count_items"><span class="txt_r"><strong>125</strong></span> items</span></a></h2>
									<div class="img">
										<h4><span class="txt_r">2:25</span> minutes ago</h4>
										<a href="#none"><img src="img/last_post/1.png" width="220" height="220" alt=""></a>
										<dl>
											<dt>$ 2,333.62</dt>
											<dd>$ 4,487.73/ piece</dd>
										</dl>
									</div>
								</div>
								<!-- //last post -->

								<!-- content collection -->
								<div class="tbl_cnt_collection">
									<h2 class="title"><span class="txt_r">We-Care</span> Collections</h2>
									<table summary="">
										<colgroup>
										<col style="width:520px;">
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2"><div><a href="#none"><img src="img/last_post/cover/1.png" width="520" height="332" alt=""></a></div></td>
												<td><div><a href="#none"><img src="img/last_post/2.png" width="173" height="165" alt=""></a></div></td>
												<td><div><a href="#none"><img src="img/last_post/3.png" width="174" height="165" alt=""></a></div></td>
											</tr>
											<tr>
												<td><div><a href="#none"><img src="img/last_post/4.png" width="173" height="165" alt=""></a></div></td>
												<td><div><a href="#none"><img src="img/last_post/5.png" width="174" height="165" alt=""></a></div></td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //content collection -->
							</div>
							<!-- //tbl_allcollection -->
							
							<%
								try{
									String url="jdbc:mysql://localhost:3306/ads_db";
									String user="root";
									String password="";
									Class.forName("com.mysql.jdbc.Driver");
									Connection con=DriverManager.getConnection(url, user, password);
							
							%>

							<%
					        	
					             String query1 = "select *  from tbl_category";
					             Statement st1 = con.createStatement();
					             ResultSet rs1 = st1.executeQuery(query1);
					
					             while (rs1.next()) {
					                //for(rs1.size)
					                 //out.println(rs1.size());
							%>
							<!-- tbl_myproducts -->
							<div class="tbl_myproducts <%= rs1.getString(2)%> mgt30">
								<!-- category closthes -->
								<div class="womenclothes">
									<h2 class="title"><a href="#none"><%= rs1.getString(3)%></a></h2>
							
									<div class="sub_cat">
										<ul>
											<%
							                     String query2 = "select * from tbl_sub_category where CateId='" + rs1.getString(1) + "'";
							                     Statement st2 = con.createStatement();
							                     ResultSet rs2 = st2.executeQuery(query2);
							                     while (rs2.next()) {
											%>
											<li><a href="#none"><%= rs2.getString(3) %></a></li>
											<%
											     }
											 %>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/1.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/6.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

								
							<%
							     }
							%>
							
							<%
							      } catch (Exception e1) {
							      
							      }
							 %>

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts womenclothes mgt30">
								<!-- category closthes -->
								<div class="womenclothes">
									<h2 class="title"><a href="#none">Clothes</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="femal">Men's Clothes</a></li>
											<li><a href="#none" class="men">Femal's Clothes</a></li>
											<li><a href="#none" class="baby">Baby's Clothes</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/1.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/6.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts computeroffice">
								<!-- category closthes -->
								<div class="computeroffice">
									<h2 class="title"><a href="#none">Computer & Office</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="labtop">Laptops</a></li>
											<li><a href="#none" class="desktop">Desktops</a></li>
											<li><a href="#none" class="accessary">Accessary & Parts</a></li>
											<li><a href="#none" class="storage">Storage Devices</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/8.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts telephone">
								<!-- category closthes -->
								<div class="telephone">
									<h2 class="title"><a href="#none">Phone & Accessaries</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="mobile">Mobile Phones</a></li>
											<li><a href="#none" class="tablet">Tablets</a></li>
											<li><a href="#none" class="phone_acc">Phone Accessaries & Partes</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/1.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/3.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts consummerelectronic">
								<!-- category closthes -->
								<div class="consummerelectronic">
									<h2 class="title"><a href="#none">Electronics</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="office_elec">Office Electronics</a></li>
											<li><a href="#none" class="accessary_elec">Accessaries & Parts</a></li>
											<li><a href="#none" class="camera">Camera & Photos</a></li>
											<li><a href="#none" class="music_dev">Music Devices & Instruments</a></li>
											<li><a href="#none" class="hom_sec">Home & Security</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/4.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td rowspan="2">
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="458" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts jewelery">
								<!-- category closthes -->
								<div class="jewelery">
									<h2 class="title"><a href="#none">Jewelries & Watches</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="jewelry">Jewelries</a></li>
											<li><a href="#none" class="watch">Watches</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/1.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td rowspan="2">
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="408" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts bagsandshoes">
								<!-- category closthes -->
								<div class="bagsandshoes">
									<h2 class="title"><a href="#none">Bags & Shoes</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="women_bag">Women Lugages & Bags</a></li>
											<li><a href="#none" class="men_bag">Men Lugages & Bags</a></li>
											<li><a href="#none" class="school_bag">School & Travel Bags</a></li>
											<li><a href="#none" class="women_shoes">Women's Shoes</a></li>
											<li><a href="#none" class="men_shoes">Men's Shoes</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/1.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/6.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts healthbeauty">
								<!-- category closthes -->
								<div class="healthbeauty">
									<h2 class="title"><a href="#none">Health & Beauty</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="makeup">Make Up</a></li>
											<li><a href="#none" class="hair_acc">Hair & Accessaries</a></li>
											<li><a href="#none" class="skin_care">Skin Care</a></li>
											<li><a href="#none" class="nail_tool">Nails & Tools</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/7.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts toykidbaby">
								<!-- category closthes -->
								<div class="toykidbaby">
									<h2 class="title"><a href="#none">Toys, Kid & Babies</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="toy_boy">Toys & Hobies</a></li>
											<li><a href="#none" class="toy_girl">Baby Girl Care</a></li>
											<li><a href="#none" class="baby_care">Baby Boy Cares</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/7.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts sportoudoor">
								<!-- sports & outdoor -->
								<div class="sportoudoor">
									<h2 class="title"><a href="#none">Sports & Outdoors</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="sport_clothes">Sports' Clothes & Shoes</a></li>
											<li><a href="#none" class="outdoor_sport">Outdoor Sports</a></li>
											<li><a href="#none" class="sport_care">Sport Cares</a></li>
										</ul>
									</div>
								</div>
								<!-- //sports & outdoor -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/7.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts homeimproment">
								<!-- category closthes -->
								<div class="homeimproment">
									<h2 class="title"><a href="#none">Home & Equipments</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="hom_suplier">Home Decore & Suppliers</a></li>
											<li><a href="#none" class="lighting">Lighting</a></li>
											<li><a href="#none" class="sec_protection">Security Protections</a></li>
											<li><a href="#none" class="equipment">Equipments</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/7.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts automobile">
								<!-- category closthes -->
								<div class="automobile">
									<h2 class="title"><a href="#none">Cars, Motobiks & Bycycles</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="car">Cares for Sale & Rent</a></li>
											<li><a href="#none" class="motor">Motobiks for Sale</a></li>
											<li><a href="#none" class="bike">Bycycle for Sale</a></li>
											<li><a href="#none" class="tools">Tools, Parts, & Maintainances</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/7.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->

							<!-- tbl_myproducts -->
							<div class="tbl_myproducts realestates">
								<!-- category closthes -->
								<div class="realestates">
									<h2 class="title"><a href="#none">Real Eastates</a></h2>
									<div class="sub_cat">
										<ul>
											<li><a href="#none" class="office">Offices for Sale & Rent</a></li>
											<li><a href="#none" class="appartment">Appartments for Sale</a></li>
											<li><a href="#none" class="condo">Condos for Sale & Rent</a></li>
											<li><a href="#none" class="villas">Villas for Sale & Rent</a></li>
											<li><a href="#none" class="land">Lands for Sale & Rent</a></li>
										</ul>
									</div>
								</div>
								<!-- //category closthes -->

								<!-- product_content -->
								<div class="tbl_product_content">
									<table summary="">
										<caption></caption>
										<colgroup>
										<col style="width:360px;">
										<col>
										<col>
										<col>
										</colgroup>
										<tbody>
											<tr>
												<td rowspan="2">
													<div>
														<div class="slider-wrapper">
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-3.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-1.jpg" alt="" style="width:359px;height:525px;"></div>
															<div class="slider-box"><img src="img/bg/slide-2.jpg" alt="" style="width:359px;height:525px;"></div>
														</div>
													</div>
												</td>
												<td colspan="2">
													<div>
														<a href="#none"><img src="img/slider/7.png" width="400" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/2.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div>
														<a href="#none"><img src="img/slider/3.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/4.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
												<td>
													<div>
														<a href="#none"><img src="img/slider/5.png" width="190" height="200" alt="">
															<dl>
																<dt>Tready Sweaters</dt>
																<dd>Style warm & Style life</dd>
															</dl>
														</a>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
								<!-- //product_content -->
							</div>
							<!-- //tbl_myproducts -->
						</div>
						<!-- //tbl_myproducts_wrap -->

						<div class="">
							next
						</div>
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

	<jsp:directive.include file="ads_footer.jsp" />
