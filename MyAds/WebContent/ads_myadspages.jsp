	
<%@page import="myads.model.util.Pagination"%>
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
							<label><input type="text" placeholder="Find your posts...!" style="width:400px;" id="txtSearch"></label>
							<a href="javascript:" class="btn_create_acc btn_mypost" id="btnSearch">Search</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="lay_newposting.ads" class="btn_create_acc btn_mypost">Add New Post</a>
						</div>
					</div>
					<!-- //mypost header -->
					
					<!-- mypost content -->
					<div class="mypost_cnt mgt20">
						<ul id="productList">
						
							<%
							    int countPage=Pagination.totalpage;
								List<PostingListDto> postinglist=(List<PostingListDto>)request.getSession().getAttribute("postingList");
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
									<a href="javascript:" class="btn_post disable_post">Disable Post</a>
									<a href="javascript:" class="btn_post enabl_post">Enable Post</a>
									<a href="javascript:" class="btn_post edit_post">Edit Post</a>
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
						<div class="paging" id="paging"><!-- 비활성상태는 on class 제거 -->
						    <input type="text" value="0" id="txtcurrentpage">
							<a href="javascript:" class="btn_pag_cntr first" rel="1"><span class="blind">first</span></a><a href="javascript:" class="btn_pag_cntr prev"><span class="blind">previous</span></a>
							<span class="pag_num">
							    <a href="javascript:" class="on indexPage" rel="1">1</a>
							    <%
							       for(int i=2;i<=countPage;i++){
							    %>
									<a href="javascript:" rel="<%=i %>" class="indexPage"><%=i %></a>
								<%
							       }
								%>
							</span>
							<a href="javascript:" class="btn_pag_cntr next on"><span class="blind">next</span></a><a href="javascript:" class="btn_pag_cntr last on indexPage" rel="<%=countPage %>"><span class="blind">last</span></a>
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
	<script type="text/javascript">
		$(document).ready(function(e){
			$("#btnSearch").click(function(e){
				$.ajax({
	    			type : "POST",
	       			url : "${pageContext.request.contextPath }/lay_search_myadspages.ads",
	    			data : "txtSearch="+$("#txtSearch").val()+"&cp=1",
	    			success : function(dat) {    				
	    				console.log(dat);
	    				var html='';
	    				for(var i=0;i<dat[1].length;i++){
	    					html+='<li>'
	    					      +'<div class="img"><a href="#none"><img src="uploads/'+dat[1][i]["img"]+'" alt=""></a></div>'
	    					      +'<dl>'
	    					      +'<dt>Product Name:<a href="#none">'+dat[1][i]["ProductName"]+'</a></dt>'
	    					      +'<dd>Category Type: '+dat[1][i]["SubCateName"]+'</dd>'
	    					      +'<dd><strong>Price: '+dat[1][i]["Price"]+'</strong></dd>'
	    					      +'<dd><strong>Discount: '+dat[1][i]["discount"]+'</strong></dd>'
	    					      +'<dd>Phone Number: '+dat[1][i]["Phone"]+'</dd>'
							      +'<dd>Your Address: '+dat[1][i]["Adr"]+'</dd>'
							      +'</dl>'
								  +'<div class="btn_wrap"><a href="javascript:" class="btn_post disable_post">Disable Post</a>'
								  +'<a href="#none" class="btn_post enabl_post">Enable Post</a><a href="#none" class="btn_post edit_post">Edit Post</a>'
								  +'</div></li>';							

	    				}
	    				var paging="";
	    				paging+='<input type="text" value="0" id="txtcurrentpage">'
					       +'<a href="javascript:" class="btn_pag_cntr first" rel="1"><span class="blind">first</span></a><a href="javascript:" class="btn_pag_cntr prev"><span class="blind">previous</span></a>'
					       +'<span class="pag_num">'
	    				   +'<a href="javascript:" class="on indexPage" >1</a>';
	    				for(var i=2;i<=dat[0];i++){
	    					       paging+='<a href="javascript:" rel="'+i+'" class="indexPage">'+i+'</a>'	;						
	    				}
	    				paging+='</span><a href="javascript:" class="btn_pag_cntr next on"><span class="blind">next</span></a><a href="javascript:" class="btn_pag_cntr last on indexPage" rel=""><span class="blind">last</span></a>'
	    				console.log(paging);
	    				$("#productList").empty();
	    				$("#productList").append(html);
	    				$("#paging").empty();
	    				$("#paging").append(paging);
	    				
	    				
	    			},
	    			error : function(e) {
	    				console.log("ERROR: ", e);
	    				
	    			},
	    			done : function(e) {
	    				console.log("DONE");
	    			}
	    		});
				
			});
			$( "#txtSearch" ).keypress(function() {
				$( "#btnSearch" ).trigger( "click" ); 
			});
			$( "#txtSearch" ).keyup(function() {
				$( "#btnSearch" ).trigger( "click" ); 
			});
			$( "#txtSearch" ).keydown(function() {
				$( "#btnSearch" ).trigger( "click" ); 
			});
			
			$(".paging a").click(function(e){
				$.ajax({
	    			type : "POST",
	       			url : "${pageContext.request.contextPath }/lay_search_myadspages.ads",
	    			data : "cp="+$(this).attr("rel"),
	    			success : function(dat) {    				
	    				console.log(dat);
	    				var html='';
	    				var page='';
	    				for(var i=0;i<dat[1].length;i++){
	    					html+='<li>'
	    					      +'<div class="img"><a href="#none"><img src="uploads/'+dat[1][i]["img"]+'" alt=""></a></div>'
	    					      +'<dl>'
	    					      +'<dt>Product Name:<a href="#none">'+dat[1][i]["ProductName"]+'</a></dt>'
	    					      +'<dd>Category Type: '+dat[1][i]["SubCateName"]+'</dd>'
	    					      +'<dd><strong>Price: '+dat[1][i]["Price"]+'</strong></dd>'
	    					      +'<dd><strong>Discount: '+dat[1][i]["discount"]+'</strong></dd>'
	    					      +'<dd>Phone Number: '+dat[1][i]["Phone"]+'</dd>'
							      +'<dd>Your Address: '+dat[1][i]["Adr"]+'</dd>'
							      +'</dl>'
								  +'<div class="btn_wrap"><a href="#none" class="btn_post disable_post">Disable Post</a>'
								  +'<a href="#none" class="btn_post enabl_post">Enable Post</a><a href="#none" class="btn_post edit_post">Edit Post</a>'
								  +'</div></li>';							

	    				}

	    				$("#productList").empty();
	    				$("#productList").append(html);
	    				$('.paging a').click(function(e) {
	    					$(this).siblings('a').removeClass('on');
	    					$(this).addClass('on');
	    				});
	    				
	    			},
	    			error : function(e) {
	    				console.log("ERROR: ", e);
	    				
	    			},
	    			done : function(e) {
	    				console.log("DONE");
	    			}
	    		});
			});
			
		});
    </script>
