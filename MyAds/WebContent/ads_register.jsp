
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
							<% if(session.getAttribute("membername") == null ){ %>
							 	<p class="logged" style="position:static;float:left;display:block;">
									<a href="lay_reg.ads">
										<img src="img/com/com02.png" alt="" style="text-align:center;">
									</a>
								</p>
							 <% } else {%>
							 	<p class="logged" style="position:static;float:left;display:block;">
									<a href="lay_myadsprofile.ads">
										<img src="img/com/com01.png" alt="" style="text-align:center;">
										<%= session.getAttribute("membername") %>
									</a>
								</p>
							 <%} %>
						 
							<h1 class="f_left"><span style="color:#0174b3;">MyAds's</span> <span style="color:#f7153a;">Account Register</span></h1>
						</div>
					</div>
					<!-- //mypost header -->
				
					<!-- wrap_function -->
					<div class="wrap_func">
						<div class="f_right">
							add more company informatoin here
						</div>

						<div class="register">
							<form method="post" action="register.ads" name="frmregister" id="frmregister">
								<table summary="">
									<caption></caption>
									<colgroup>
									<col style="width:200px;">
									<col>
									</colgroup>
									<tbody>
										<tr>
											<th><div>Username <span class="require">*</span></div></th>
											<td><div><input type="text" value="" placeholder="Enter your name" name="txt_name" style="width:308px;" data-rule-required="true" data-msg-required="Please enter your user name!"></div></td>
										</tr>
										<tr>
											<th><div>Your full name <span class="require">*</span></div></th>
											<td><div><input type="text" value="" placeholder="Enter your real name" name="txt_realname" style="width:308px;" data-rule-required="true" data-msg-required="Please enter your full name!"></div></td>
										</tr>
										<tr>
											<th><div>Your company name</div></th>
											<td>
												<div style="height:60px;">
													<select style="width:65%;height:40px;" name="txt_companyid" data-rule-required="true" data-msg-required="Please enter your company!">
														<option value="">Choose your company</option>
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
											</td>
										</tr>
										<tr>
											<th><div>Gender <span class="require">*</span></div></th>
											<td>
												<div>
													<label><input type="radio" checked value="Male" name="txt_sex" data-rule-required="true" data-msg-required="Please enter your user name!"> Male</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<label><input type="radio" value="Female" name="txt_sex" > Female</label>
												</div>
											</td>
										</tr>
										<tr>
											<th><div>Create Password <span class="require">*</span></div></th>
											<td><div><input type="password" value="" placeholder="Create password" name="txt_pass" style="width:308px;" id="txt_pass" data-rule-required="true" data-msg-required="Please enter your password!"></div></td>
										</tr>
										<tr>
											<th><div>Confirm Password <span class="require">*</span></div></th>
											<td><div><input type="password" value="" placeholder="Confirm password" name="txt_confpass" style="width:308px;"  data-rule-equalTo="#txt_pass" data-rule-required="true"  data-msg-required="Please enter your comfirm password!"></div></td>
										</tr>
										<tr>
											<th><div>Email address <span class="require">*</span></div></th>
											<td><div><input type="text" value="" placeholder="Enter your email address" name="txt_email" style="width:308px;" data-rule-required="true" data-rule-email="true"  data-msg-required="Please enter your email!"></div></td>
										</tr>
										<tr>
											<th><div>Phone Number <span class="require">*</span></div></th>
											<td><div><input type="text" value="" placeholder="Enter your phone number" name="txt_phone" style="width:308px;"  data-rule-required="true" data-rule-number="true" data-rule-digits="true"  data-msg-required="Please enter your phone number!"></div></td>
										</tr>
										<tr>
											<th><div>Your Address <span class="require">*</span></div></th>
											<td><div><textarea style="width:304px;height:70px;" placeholder="Enter your real current address" name="txt_address"  data-rule-required="true" data-msg-required="Please enter your Address!"></textarea></div></td>
										</tr>
										<tr>
											<th colspan="2" class="t_right"><div><!-- <a href="javascript:register()" class="btn_create_acc">Create My Account</a> --><input type="submit" value="Create My Account" class="btn_create_acc"> </div></th>
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
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/additional-methods.js"></script>
    <script src="js/jquery.validate.js"></script>
	<script>
	$(document).ready(function(e){
		$("#frmregister").validate();
	});
	</script>
