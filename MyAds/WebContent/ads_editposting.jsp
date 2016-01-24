
<%@page import="myads.model.dto.PostingDto"%>
<jsp:directive.include file="ads_header.jsp" />
	<jsp:directive.include file="ads_help.jsp" />
    <%
    	PostingDto postingDto=(PostingDto) request.getSession().getAttribute("postingDto");
    %>
	<!-- body_section -->
	<div class="body_section">
		<!-- cnt_wrap -->
		<div class="cnt_wrap">
			<!-- body_cnt -->
			<div class="body_cnt">
				<!-- container -->
				<div class="container">
				
					<!-- mypost header -->
					<div class="mypost_header">
						<div class="cboth">
							<h1 class="f_left"><span style="color:#0174b3;">MyAds's</span> <span style="color:#f7153a;">Edit Posting</span></h1>
						</div>
					</div>
					<!-- //mypost header -->
				
					<!-- wrap_function -->
					<div class="wrap_func">
						<div class="f_right" style="width:255px;">
							<h1 class="tit">Posting Policies</h1>
							<div class="mypolicy">
								<ol>
									<li>1.  <strong style="color:red;">Do not allow</strong> for uploading  <strong style="color:red;">sexy photo.</strong></li>
									<li>2. Please upload your products photos( You can upload <strong style="color:green;">1,2,3,.... more photos</strong>)</li>
									<li>3. After your uploaded you will see your posting after <strong style="color:green;">approvaled</strong>.</li>
									<li>4. Try to posting in right way follow posting demo in point 5</li>
									<li>5. Demo for Create Your Posting<br>
											 <video controls autoplay style="width:100%;height:150px;">
											  <source src="demo/demo.wmv" type="video/mp4">
											</video> 
									</li>
								</ol>
							</div>
						</div>

						

						<div class="register" style="width:880px;">
							<form method="post" action="add_newposting.ads" name="frmregister" id="frmcreatepost" enctype="multipart/form-data">
								<table summary="">
									<caption></caption>
									<colgroup>
									<col style="width:125px;">
									<col>
									<col>
									</colgroup>
									<tbody>
										<tr style="display:;">
											<th scope="row"><div>Member ID <span class="require">*</span></div></th>
											<td><div>
												<input type="text" value="<%= postingDto.getMemberDto().getId() %>" name="txt_memid">
												<input type="text" value="<%= postingDto.getPostingId() %>"  name="txt_pro_id" style="width:308px;" required="required">
												
											</div></td>
											
										</tr>
										<tr>
											<th scope="row"><div>Your Product Name <span class="require">*</span></div></th>
											<td><div>
												<input type="text" value="<%=postingDto.getTitle() %>" placeholder="Enter your product title" name="txt_pro_tit" style="width:308px;" required="required">
												
												</div></td>
											<td rowspan="7" style="vertical-align:top;text-align:right;">
												<div style="text-align:left;border:1px solid #eee;"><strong>Photo <span class="require">*</span></strong>
													<!-- photo_wrap -->
													<div class="photo_wrap" style="max-height:420px;overflow:scroll;">
														<div class="t_right">
															<a href="#none" class="btn_remove">Remove</a>
															<ul class="multi_photo">
																<li>
																	<!-- photo -->
																	<div class="uploadimage" style="width:100px;float:left;">
																		<a href="#none" class="wrap_img user single">
																			<span class="getphoto">Brow</span>
																			<!--<span class="addmore">Add more photos</span>-->
																		</a>
																		<input type="file" class="btn_upload" id="btn_uploadimg" name="txt_photo" style="display:none;" multiple required="required">
																		<span style="display:none" class="storeimg"></span>
																	</div>
																	<a href="#none" class="btn_edit" style="margin-top:10px;">Edit</a>
																	<!--  display(none/block) -->
																	<span class="disable_photo" style="display:none;"><span class="blind">disable photo</span> </span>
																	<!--  //display(none/block) -->
																	<!-- //photo -->
																</li>
															</ul>
														</div>
														<div class="t_right">
															<a href="#none" class="btn_remove">Remove</a>
															<ul class="multi_photo">
																<li>
																	<!-- photo -->
																	<div class="uploadimage" style="width:100px;float:left;">
																		<a href="#none" class="wrap_img user single">
																			<span class="getphoto">Brow</span>
																			<!--<span class="addmore">Add more photos</span>-->
																		</a>
																		<input type="file" class="btn_upload" id="btn_uploadimg" name="txt_photo" style="display:none;" multiple required="required">
																		<span style="display:none" class="storeimg"></span>
																	</div>
																	<a href="#none" class="btn_edit" style="margin-top:10px;">Edit</a>
																	<!--  display(none/block) -->
																	<span class="disable_photo" style="display:block;"><span class="blind">disable photo</span> </span>
																	<!--  //display(none/block) -->
																	<!-- //photo -->
																</li>
															</ul>
														</div>
														<div class="t_right">
															<a href="#none" class="btn_remove">Remove</a>
															<ul class="multi_photo">
																<li>
																	<!-- photo -->
																	<div class="uploadimage" style="width:100px;float:left;">
																		<a href="#none" class="wrap_img user single">
																			<span class="getphoto">Brow</span>
																			<!--<span class="addmore">Add more photos</span>-->
																		</a>
																		<input type="file" class="btn_upload" id="btn_uploadimg" name="txt_photo" style="display:none;" multiple required="required">
																		<span style="display:none" class="storeimg"></span>
																	</div>
																	<a href="#none" class="btn_edit" style="margin-top:10px;">Edit</a>
																	<!--  display(none/block) -->
																	<span class="disable_photo" style="display:block;"><span class="blind">disable photo</span> </span>
																	<!--  //display(none/block) -->
																	<!-- //photo -->
																</li>
															</ul>
														</div>
													</div>
													<!-- //photo_wrap -->
												</div>
												<a href="#none" class="btn_create_acc mgt10">Save All Photos</a><!--<input type="submit" value="Create My Posting" class="btn_create_acc">-->
											</td>
										</tr>
										<tr>
											<th><div>Category Type <span class="require">*</span></div></th>
											<td>
												<div style="height:50px;">
													<select style="width:300px;height:70px;" name="txt_subcatid" required="required">
														<option value="0" data-modifier="mod">All Categories</option>
															<%
																/* List<MainCategoryDto> rst=CategoryDao.getCategory();
															    List<SubCategoryDto> rst1=CategoryDao.getSubCategory(); */
																for(int j=0;j<rst.size();j++){
															%>
															<optgroup label="<%= rst.get(j).getName() %>">
																		<%
														                	for(int i=0;i<rst1.size();i++)  {  
														                		if (rst.get(j).getId()==rst1.get(i).getId()){
																		%>
																				<option value="<%= rst1.get(i).getSubid() %>" 
																				   <% if (postingDto.getSubCategory().getSubid()==rst1.get(i).getSubid()){ %>
																				   		selected="selected"
																				   <% } %>																				
																				><%= rst1.get(i).getName() %></option>
																		<%
																		     }
														                	}
																		 %>
															</optgroup>
															<%
															     }
															%>
													</select>
												</div>
											</td>
										</tr>
										<tr>
											<th><div>Key Notice <span class="require">*</span></div></th>
											<td><div><input type="text" value="<%=postingDto.getKey() %>" placeholder="Enter key notice" name="txt_keynotice" style="width:308px;" required="required"></div></td>
										</tr>
										<tr>
											<th><div>Price <span class="require">*</span></div></th>
											<td><div><input type="text" value="<%=postingDto.getPrice() %>" placeholder="Enter price" name="txt_price" style="width:308px;" required="required"></div></td>
										</tr>
										<tr>
											<th><div>Discount <span class="require">*</span></div></th>
											<td><div><input type="text" value="<%=postingDto.getDiscount() %>" placeholder="Enter discount price" name="txt_discount" style="width:308px;" required="required"></div></td>
										</tr>
										<tr>
											<th><div>Phone Number <span class="require">*</span></div></th>
											<td><div><input type="text" value="<%=postingDto.getPhone() %>" placeholder="Enter your phone number" name="txt_phone" style="width:308px;" required="required"></div></td>
										</tr>
										<tr>
											<th><div>Your Address <span class="require">*</span></div></th>
											<td><div><textarea style="width:304px;height:50px;" placeholder="Enter your real current address" name="txt_address" required="required">
													<%=postingDto.getAdr() %>
											</textarea></div></td>
										</tr>
										<tr>
											<th><div>Product Description <span class="require">*</span></div></th>
											<td><div><textarea style="width:304px;height:160px;" placeholder="Enter your description" name="txt_dsc" required="required">
												<%=postingDto.getDsc() %>
											</textarea></div></td>
										</tr>
										<tr>
											<th colspan="3" class="t_right"><div><a href="#none" class="btn_create_acc" id="btn_create_acc">Save My Posting</a><!--<input type="submit" value="Create My Posting" class="btn_create_acc">--> </div></th>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
					</div>
					<!-- //wrap_function -->
				</div>
				<!-- //container -->
			</div>
			<!-- //body_cnt -->
		</div>
		<!-- //cnt_wraps -->
	</div>
	<!-- //body_section -->
    
	<jsp:directive.include file="ads_footer.jsp" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js"></script>
	<script type="text/javascript">
		$("#btn_create_acc").click(function(e){

	    	
	    	$("#frmcreatepost").ajaxSubmit({
				url: "./add_newposting.ads",
				type: 'POST',
				success: function(data) { 					
					/* console.log(data); */
				        if(data){
				        	alert('YOU HAVE BEEN INSERTED SUCCESSFULLY.');
				        	location.href="lay_myadspages.ads";
				        }else{
				        	alert('YOU HAVE ERRORS WHEN INSERT UPDATE PROFILE.');
				        }
				        //ajaxindicatorstop()
				        
				},error:function(data,status,er) { 
					//ajaxindicatorstop()
				    console.log("error: "+data+" status: "+status+" er:"+er);
				}
			});        	
	    });
	</script>
