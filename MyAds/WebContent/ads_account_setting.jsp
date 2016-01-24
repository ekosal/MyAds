
<jsp:directive.include file="ads_header.jsp" />
	<jsp:directive.include file="ads_help.jsp" />

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
							<h1 class="f_left"><span style="color:#0174b3;">MyAdspages</span> <span style="color:#f7153a;">Account Setting</span></h1>
						</div>
					</div>
					<!-- //mypost header -->
				
					<!-- wrap_function -->
					<div class="wrap_func">
						<div class="f_right">
							add more company informatoin here
						</div>

						<div class="register change">
							<form method="post" action="">
								<!-- photo -->
								<div class="single_photo">
									<div class="uploadimage">
										<a href="#none" class="wrap_img user single">
											<span class="getphoto">photo</span>
											<!--<span class="addmore">Add more photos</span>-->
										</a>
										<input type="file" class="btn_upload" id="btn_uploadimg" name="txt_photo" style="display:none;" multiple required="required">
										<span style="display:none" class="storeimg"></span>
									</div>
									<a href="#none" class="btn_edit" style="margin-top:10px;">Edit</a>
									<span class="disable_photo" style="display:block;"><span class="blind">disable photo</span> </span>
								</div>
								<!-- //photo -->
								
								<a href="#none" class="btn_edit">Edit All</a>
								<table summary="">
									<caption></caption>
									<colgroup>
									<col style="width:200px;">
									<col>
									</colgroup>
									<tbody>
										<tr>
											<th><div>Username</div></th>
											<td>
												<!-- default read -->
												<div class="dis" style="display:none;">
													<input type="text" value="Senghong" style="width:400px;" disabled="disabled" class="dis hid_ipt">
													<a href="#none" class="btn_edit">Edit</a>
												</div>
												<!--// default read -->

												<!-- display edit -->
												<div style="display:block;">
													<input type="text" value="Senghong" placeholder="Enter your name" name="txt_name" style="width:463px;" required="required"><br>
													<a href="#none" class="btn_save">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#none" class="btn_cancel">Cancel</a>
												</div>
												<!-- //display edit -->
											</td>
										</tr>
										<tr>
											<th><div>Your full name</div></th>
											<td>
												<!-- default read -->
												<div class="dis" style="display:block;">
													<input type="text" value="Nob Senghong" style="width:400px;" disabled="disabled" class="dis hid_ipt">
													<a href="#none" class="btn_edit">Edit</a>
												</div>
												<!--// default read -->

												<!-- display edit -->
												<div style="display:none;">
													<input type="text" value="Nob Senghong" placeholder="Enter your real name" name="txt_realname" style="width:463px;" required="required"><br>
													<a href="#none" class="btn_save">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#none" class="btn_cancel">Cancel</a>
												</div>
												<!-- //display edit -->
											</td>
										</tr>
										<tr>
											<th><div>Your company name</div></th>
											<td>
												<!-- default read -->
												<div class="dis" style="display:block;">
													<input type="text" value="Men's Collection" style="width:400px;" disabled="disabled" class="dis hid_ipt">
													<a href="#none" class="btn_edit">Edit</a>
												</div>
												<!--// default read -->
												
												<!-- display edit -->
												<div style="display:none;padding:0;">
													<div style="height:60px;">
														<select style="width:350px;height:40px;" name="txt_companyid" required="required">
															<option value="0">Choose your company</option>
															<%
																ResultSet rsth=MyComobox.getCompany();
																while(rsth.next()){
															%>
															<option value="<%= rsth.getString("ComId") %>"><%= rsth.getString("ComName") %></option>
															<%
																}
															%>
														</select>
														<a href="lay_com.ads" class="btn_create_acc" style="padding-left:10px;padding-right:10px;">Add New</a>
													</div>
													<a href="#none" class="btn_save">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#none" class="btn_cancel">Cancel</a>
												</div>
												<!-- //display edit -->
											</td>
										</tr>
										<tr>
											<th><div>Gender</div></th>
											<td>
												<!-- default read -->
												<div class="dis" style="display:block;">
													<input type="text" value="M" style="width:400px;" disabled="disabled" class="dis hid_ipt">
													<a href="#none" class="btn_edit">Edit</a>
												</div>
												<!--// default read -->
												
												<!-- display edit -->
												<div style="display:none;">
													<label><input type="radio" checked value="Male" name="txt_sex" required="required"> Male</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<label><input type="radio" value="Female" name="txt_sex" required="required"> Female</label><br>
													<a href="#none" class="btn_save">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#none" class="btn_cancel">Cancel</a>
												</div>
												<!-- //display edit -->
											</td>
										</tr>
										<tr>
											<th><div>Password</div></th>
											<td>
												<!-- default read -->
												<div class="dis" style="display:block;">
													<input type="password" value="123" style="width:400px;" disabled="disabled" class="dis hid_ipt">
													<a href="#none" class="btn_edit">Edit</a>
												</div>
												<!--// default read -->
												
												<!-- display edit -->
												<div style="display:none;padding:0;">
													<div><p>Current</p><input type="password" value="" placeholder="Current password" name="txt_pass" style="width:463px;" required="required"></div>
													<div><p>New</p><input type="password" value="" placeholder="New password" name="txt_nex_pass" style="width:463px;" required="required"></div>
													<div><p>Re-Type New</p><input type="password" value="" placeholder="Re-type new password" name="txt_pass" style="width:463px;" required="required"></div>
													<a href="#none" class="btn_save">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#none" class="btn_cancel">Cancel</a>
												</div>
												<!-- //display edit -->
											</td>
										</tr>
										<tr>
											<th><div>Email address</div></th>
											<td>
												<!-- default read -->
												<div class="dis" style="display:block;">
													<input type="text" value="senghong@gmail.com" style="width:400px;" disabled="disabled" class="dis hid_ipt">
													<a href="#none" class="btn_edit">Edit</a>
												</div>
												<!--// default read -->
												
												<!-- display edit -->
												<div style="display:none;">
													<input type="text" value="sengong@gmail.com" placeholder="Enter your email address" name="txt_email" style="width:463px;" required="required"><br>
													<a href="#none" class="btn_save">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#none" class="btn_cancel">Cancel</a>
												</div>
												<!-- //display edit -->
											</td>
										</tr>
										<tr>
											<th><div>Phone Number</div></th>
											<td>
												<!-- default read -->
												<div class="dis" style="display:block;">
													<input type="text" value="070372639" style="width:400px;" disabled="disabled" class="dis hid_ipt">
													<a href="#none" class="btn_edit">Edit</a>
												</div>
												<!--// default read -->
												
												<!-- display edit -->
												<div style="display:none;">
													<input type="text" value="070372639" placeholder="Enter your phone number" name="txt_phone" style="width:463px;" required="required"><br>
													<a href="#none" class="btn_save">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#none" class="btn_cancel">Cancel</a>
												</div>
												<!-- //display edit -->
											</td>
										</tr>
										<tr>
											<th><div>Your Address</div></th>
											<td>
												<!-- default read -->
												<div class="dis" style="display:none;">
													<textarea style="width:420px;height:70px;" disabled="disabled" class="dis hid_ipt">St 34444 PP</textarea>
													<a href="#none" class="btn_edit">Edit</a>
												</div>
												<!--// default read -->
												
												<!-- display edit -->
												<div style="display:block;">
													<textarea style="width:459px;height:70px;" placeholder="Enter your real current address" name="txt_address" required="required">St 34444 PP</textarea><br>
													<a href="#none" class="btn_save">Save</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<a href="#none" class="btn_cancel">Cancel</a>
												</div>
												<!-- //display edit -->
											</td>
										</tr>
										<tr style="display:;">
											<th colspan="2" class="t_right" style="padding:10px 0;"><div><!-- <a href="javascript:register()" class="btn_create_acc">Create My Account</a> --><input type="submit" value="Change My Account" class="btn_create_acc"> </div></th>
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
