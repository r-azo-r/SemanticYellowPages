<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.Discarder"%>
<%@page import="com.narphorium.freebase.services.exceptions.FreebaseServiceException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.util.*,org.json.simple.JSONObject,inputdata.Search,inputdata.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Semantic Yellow Pages</title>
<script type="text/javascript">
 </script>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.4.2.js" ></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>  
<script type="text/javascript" src="js/Myriad_Pro_600.font.js"></script>
<!--[if lt IE 9]>
	<script type="text/javascript" src="http://info.template-help.com/files/ie6_warning/ie6_script_other.js"></script>
	<script type="text/javascript" src="js/html5.js"></script>
<![endif]-->
<!-- addition for tab control -->
<link type="text/css" href="css/custom-theme/jquery-ui-1.8.10.custom.css" rel="stylesheet" />	
		<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.10.custom.min.js"></script>
		<script type="text/javascript">
			$(function(){

				// Accordion
				$("#accordion").accordion({ header: "h3" });
	
				// Tabs
				$('#tabs').tabs();
	

				// Dialog			
				$('#dialog').dialog({
					autoOpen: false,
					width: 600,
					buttons: {
						"Ok": function() { 
							$(this).dialog("close"); 
						}, 
						"Cancel": function() { 
							$(this).dialog("close"); 
						} 
					}
				});
				
				// Dialog Link
				$('#dialog_link').click(function(){
					$('#dialog').dialog('open');
					return false;
				});

				// Datepicker
				$('#datepicker').datepicker({
					inline: true
				});
				
				// Slider
				$('#slider').slider({
					range: true,
					values: [17, 67]
				});
				
				// Progressbar
				$("#progressbar").progressbar({
					value: 20 
				});
				
				//hover states on the static widgets
				$('#dialog_link, ul#icons li').hover(
					function() { $(this).addClass('ui-state-hover'); }, 
					function() { $(this).removeClass('ui-state-hover'); }
				);
				
			});
		</script>
        <link type="text/css" rel="stylesheet" href="css/suggest.min.css" />

<script type="text/javascript" src="js/suggest.min.js"></script>
			</head>
<body id="page3">
<div class="extra">
	<div class="main">
<!-- header -->
		<header>
			<div class="wrapper">
				<h1><a href="index.jsp" id="logo">SEMANTIC Yellow Pages</a></h1>
				<div class="right">
					<div class="wrapper">
						<form id="search" action="setSession" method="get">
							<div class="bg">
								<input type="submit" class="submit" value=""/>
								<input type="text" name="searchbox" class="input"/>
							</div>
						</form>
					</div>
					<div class="wrapper">
						<nav>
							<ul id="top_nav">
								<li><a href="#">Register</a></li>
								<li><a href="#" id="opener">Log In</a></li>
								<li><a href="#">Help</a></li>
							</ul>
						</nav>
					</div>	
				</div>
				
			</div>
			<nav>
				<ul id="menu">
					<li><a href="index.jsp" class="nav1">Home</a></li>
					<li><a href="userreg1.jsp" class="nav2">User Profile </a></li>
					<li><a href="servicereg.jsp" class="nav3">Service Profile</a></li>
					<li><a href="test.jsp" class="nav4">About</a></li>
					<li class="end"><a href="Contacts.html" class="nav5">Contacts</a></li>
				</ul>
			</nav>
			
			<div class="text" style='width: 400px; height: 250px; overflow: hidden;'>
			<!--  	<h2 style="color: #2f82c8">Semantic Yellow Pages</h2>
				<p>Semantic Yellow Pages is a user centric search engine which is aimed at providing fast results relavant to the current user according to his preferences and lifestyle ! In other words its just customized for you !
				</p>--><br/>
			<iframe src='demo.html' width='418px' height='290px' seamless='seamless'></iframe>			
			</div> 
			
			<div class="img"><br/><br/><img src="images/semanticlogo.jpg" height='250px' width='347px' alt="" /></div> 
		</header>
	  <!-- / header -->
<!-- content -->
<br/>

<%

if(request.getParameter("hyperflag")!=null && request.getParameter("query")!=null)
{
	out.println("<form name='special' id='special' action='setSession' method='get' onload='next()'><input type='text' style='visibility:hidden' name='searchbox' value='"+session.getAttribute("query")+"'/></form>");
}
if (session.getAttribute("companyinfo")!= null)
{
	
%>

	<section id="content">
	<article class="col1">
		<h3>Search Results</h3>
		<div class="pad">
<% 
ArrayList<Company> al=(ArrayList<Company>)session.getAttribute("companyinfo");
ArrayList<StoreDetail> sd=new ArrayList<StoreDetail>();
for(int i=0;i<al.size();i++)
{
	Company temp=al.get(i);
	String img="images/logos/"+temp.CompanyLogo;
	out.println("<form id='getdetails"+i+"' action='displayRightPane'><div class='wrapper under'><figure class='left marg_right1'><img src='"+img+"' alt='"+img+"' height='116px' width='116px'/></figure>"+
			"<p class='pad_bot2'><strong>"+temp.CommonName+"<br>"+temp.stores[0].StoreName+"</strong></p>");
	out.println("<p class='pad_bot2'>"+temp.CompanyUrl+"</p><input type='text' style='visibility:hidden' name='objid' value='"+temp.stores[0].StoreName+"'/><INPUT TYPE='image' class='marker_1'/>"+"</div></form>");
	sd.add(temp.stores[0]);
}
if(session.getAttribute("storedetail")==null)
 {session.setAttribute("storedetail",sd);}
	%>
	<!-- 
			<div class="wrapper under">
						<figure class="left marg_right1"><img src="images/page1_img1.jpg" alt=""></figure>
						<p class="pad_bot2"><strong>Italy<br>Holidays</strong></p>
							<p class="pad_bot2">
							
							</p>
							<a href="#" class="marker_1" ></a>
					</div> -->
				</div>
       		</article>
			<article class="col2 pad_left1">
				<h2>Result Summary</h2>
				<div class="wrapper">
					<article class="col3">
						<div class="wrapper">
							<figure class="left marg_right1"><img src="images/logos/planetm.gif" alt=""></figure>
							
				<!-- tab control -->
									<div id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
					<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
						<li
							class="ui-state-default ui-corner-top ui-tabs-selected ui-state-active"><a
							href="#tabs-1">Map</a>
						</li>
						<li class="ui-state-default ui-corner-top"><a href="#tabs-2">Store
								Information</a>
						</li>
						<li class="ui-state-default ui-corner-top"><a href="#tabs-3">Product
								Information</a>
						</li>
						<li class="ui-state-default ui-corner-top"><a href="#tabs-4">Semantic
								Information</a>
						</li>
						
					</ul>
					<div id="tabs-1"
						class="ui-tabs-panel ui-widget-content ui-corner-bottom">
						<%
						
						if(session.getAttribute("storename")!=null)
						{
							if(session.getAttribute("profile")!=null)
							{
						      UserProfile up=(UserProfile)session.getAttribute("profile");
						      StoreDetail sk=new StoreDetail();
						      ArrayList<StoreDetail> al1=(ArrayList<StoreDetail>) session.getAttribute("storedetail");
								for(int j=0;j<al1.size();j++)
								{
									if(al1.get(j).StoreName.equalsIgnoreCase(session.getAttribute("storename").toString()))
									{
										 sk=al1.get(j);
									}
								
							   }
								String[] abc=up.hasLocation.convertToGoogleFormat(up.hasLocation.current_location);
								out.println("<iframe src='dir3.html?lat="+sk.location.City+"&lon="+sk.location.State+"' width='540px' height='340px' seamless='seamless'></iframe>");
								//out.println("<iframe src='dir2.html?fromlat="+abc[0]+"&fromlon="+abc[1]+"&tolat="+sk.location.latitude+"&tolon="+sk.location.Longitude+"' width='540px' height='340px' seamless='seamless'></iframe>");
							}
							}
						 %>
					</div>
					<div id="tabs-2"
						class="ui-tabs-panel ui-widget-content ui-corner-bottom">
						<%
							if(session.getAttribute("storename")!=null)
							{
							if(session.getAttribute("storedetail")!=null)
							{
								ArrayList<StoreDetail> al1=(ArrayList<StoreDetail>) session.getAttribute("storedetail");
								for(int j=0;j<al1.size();j++)
								{
									if(al1.get(j).StoreName.equalsIgnoreCase(session.getAttribute("storename").toString()))
									{
										StoreDetail ss=al1.get(j);
										String category = ss.category.substring(ss.category.indexOf("#") + 1,ss.category.length());
										String pm=ss.PaymentMethod.substring(ss.PaymentMethod.indexOf("#")+1,ss.PaymentMethod.length());
										out.println("<table cellspacing='15'>");
										out.println("<tr><td>Store Type</td><td>"+category+"</td>");
										out.println("<tr><td>Delivery Method</td><td>"+ss.DeliveryMethod+"</td>");
										out.println("<tr><td>Phone No.</td><td>"+ss.contactInformation.EmailId+"</td>");
										out.println("<tr><td>Payment Method</td><td>"+pm+"</td>");
										out.println("<tr><td>Weekday Timings</td><td>"+ss.timing.WeekDayHours+"</td>");
										out.println("<tr><td>Weekend Timings</td><td>"+ss.timing.WeekEndHours+"</td>");
										out.println("<tr><td>Address</td><td>"+ss.location.City+","+ss.location.State+"</td>");
									    
										Random random = new Random();
										int l = random.nextInt(10);
										int discount = l * 5;
										int price = 0;
										
										if(category.equalsIgnoreCase("ElectronicsStore"))
										{
											price = 6000;
										}
										if(category.equalsIgnoreCase("MusicStore"))
										{
											price = 800;
										}
										if(category.equalsIgnoreCase("BookStore"))
										{
											price = 595;
										}
										if(category.equalsIgnoreCase("Theatre"))
										{
											price = 250;
										}
										if(category.equalsIgnoreCase("Eatery"))
										{
											price = 1250;
										}
										float discountedprice = price - (price*l/100);
										out.println("<tr><td>Discount</td><td>"+l+"%</td>");
										out.println("<tr><td>Price</td><td>Rs."+price+"</td>");
										out.println("<tr><td>Discounted price</td><td>Rs."+discountedprice+"</td>");
										
										out.println("</table>");
										%>
					</div>
					<div id="tabs-3" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
					<%
					 Information v=new FreeBase().gatherInformation("/en/"+session.getAttribute("searchtext"));
					 out.println("<table>");
				
					if(v!=null)
					{
						if(v.thumbnail.length()>1)
						{
						String filename = v.thumbnail.substring(v.thumbnail.lastIndexOf('/') + 1,v.thumbnail.length());
					//	out.println(filename);
					//	out.println("<tr><td><img src='"+"C:\\freebase\\"+filename + ".jpg"+"'></td></tr>");
						}
					out.println("<tr></tr><tr><td><b>"+v.text+"</b></td></tr>");
					 out.println("<tr><td>"+v.Description+"</td></tr>");
					// out.println("<tr><td></td><td>"+v.url+"</td></tr>");
					 
					 
					}
					else
					{
						out.println("<tr><td>No Product Information</td></tr>");
					}
					 out.println("</table>");
					%>
					</div>
					<div id="tabs-4" class="ui-tabs-panel ui-widget-content ui-corner-bottom">
					<%
					 if(session.getAttribute("fbinfo")!=null)
					 {
						 ArrayList<Information> fbinfo=(ArrayList<Information>)session.getAttribute("fbinfo");
						 ArrayList<Node> nodes=new ArrayList<Node>();
						 HashMap<String,String> domains=new HashMap<String,String>();
						 int count=0;   //box
						 Node root=new Node(count++,session.getAttribute("searchtext").toString(),new Data(session.getAttribute("searchtext").toString()),null);
						 //nodes.add(root);
						 int size=fbinfo.size();						
						 for(Information e:fbinfo)
						 {
							 int t=count;
							 if(!domains.containsKey(e.domain)) 
							  nodes.add(new Node(count++,e.domain,new Data(e.domain),root));
							 domains.put(e.domain,count+"");
						 }	
						  out.println("<b><a href='test.jsp' target='_blank'>Semantic Navigator</a></b>");
						 out.println("<table>");
						 out.println("<tr><td><i>Semantic Results</i></td></tr>");
						 for(Information e:fbinfo)
						 {
							 String filename = e.thumbnail.substring(e.thumbnail.lastIndexOf('/') + 1,e.thumbnail.length());						 
						 out.println("<tr><td><b><a href='"+request.getContextPath()+"/setSession?searchbox="+e.text+"'>"+e.text+"</a></b></td></tr><br/> ");
						 nodes.add(new Node(count++,e.text,new Data(e.Description),nodes.get(Integer.parseInt(domains.get(e.domain).toString())-2)));
						 }
						 StringBuffer sb = new StringBuffer();
					       sb.append("[");
					       sb.append(root.toJSONString());
					      sb.append(",");
					      for(int i = 0 ; i < nodes.size();i++)
					      {
					    	  sb.append(nodes.get(i).toJSONString());
					    	  if(!(i==nodes.size()-1))
					    		  sb.append(',');
					      }
					      sb.append("]");
					      //System.out.println(sb.toString());
					    
					   
						 session.setAttribute("size",size);
						 session.setAttribute("graph",sb.toString());
						
						// out.println("<tr><td><a href='Third.jsp' target='_blank'>Graph</a>");
						 out.println("</table>");
						 //fbinfo.clear();
					 }
					 else{
						 out.print("No related data available");
					 }
					%>
					</div>
										
					</div>
									<%}
								}
							}
							}%>
								</div>		
                        </article>
					</div>
							</article>
				       <!-- <iframe src="a1.html" seamless="seamless" height="61%" width="100%"> </iframe> -->
				        </section>											
<% }
else
{
	session.setAttribute("size",0);
%>
	<section id="content">
			<article class="col1">
				<!-- <h3><cufon class="cufon cufon-canvas" alt="Search " style="width: 96px; height: 26px; "><canvas width="116" height="26" style="width: 116px; height: 26px; top: 0px; left: -1px; "></canvas><cufontext>Search </cufontext></cufon><cufon class="cufon cufon-canvas" alt="Results" style="width: 96px; height: 26px; "><canvas width="107" height="26" style="width: 107px; height: 26px; top: 0px; left: -1px; "></canvas><cufontext>Results</cufontext></cufon></h3> -->
				<div class="pad">
					
					<div class="wrapper">
					
					</div>
				</div>
       		</article>
			<article class="col2 pad_left1">
				<!-- <h2><cufon class="cufon cufon-canvas" alt="Semantic " style="width: 190px; height: 40px; "><canvas width="219" height="40" style="width: 219px; height: 40px; top: 0px; left: -2px; "></canvas><cufontext>Semantic </cufontext></cufon><cufon class="cufon cufon-canvas" alt="View" style="width: 91px; height: 40px; "><canvas width="94" height="40" style="width: 94px; height: 40px; top: 0px; left: -2px; "></canvas><cufontext>View</cufontext></cufon></h2> -->
				<div class="wrapper">
					<article class="col3">
						<div class="wrapper">
							
						</div>		
                        </article>			
				</div>
			</article>
		  <div>
		  	<h2 style="color: #2f82c8">Semantic Yellow Pages</h2>
				<p style="font-size:12px;font-weight:bold;color:#323232;line-height:20px;text-align:left;padding-bottom:25px">Semantic Yellow Pages is a user centric search engine which is aimed at providing fast results relavant to the current user according to his preferences and lifestyle ! In other words its just customized for you !
				</p> 
		  </div>
        </section>
<% }%>		
<!-- / content -->
	</div>
	<div class="block"></div>
</div>
<div class="body1">
	<div class="main">
<!-- footer -->
		<footer>
			
		</footer>
<!-- / footer -->
	</div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
</body>
</html>