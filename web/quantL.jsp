<%-- 
    Document   : quantL
    Created on : 11 Nov, 2018, 11:53:36 AM
    Author     : HP 250 G5
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	
        <title>Quantity limit</title>
        <style type="text/css">
            body{
background: #2193b0;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #6dd5ed, #2193b0);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #6dd5ed, #2193b0); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

            }
            
            h1{
                margin-top: 5%;
                text-align: center;
            }
           
            .submenu{
                margin-left: 28%;
                width: 100%;
            }
            #rad{
                padding-left: 42%;
                font-size: 16px;
            }
            input[type="text"]{
                text-align: center;
            }
            #inp{
                padding-left: 35%;
            }
            .togg{
                display: none;
            }
            select{
                width: 178px;
            }
            .left{
              
            }
            #disp{
                display: none;
            }
            .igreen{
                color: green;
                
            }
            .ired{
                color: red;
            }
            .t{
                padding-left: 5%;
            }
            input[type="text"]{
                width: 70px;
                margin-left: 0;
                background-color: #4acada;
            }
            input[type="text"][name="t"]{
                width: 150px;
            }
        </style>
    </head>
    <body>
            
        <nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				 <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-nav-demo" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
				<a href="#" class="navbar-brand"><i class="fas fa-utensils"></i>Mocha</a>
			</div>
			<div class="collapse navbar-collapse" id="bs-nav-demo">
				<ul class="nav navbar-nav">
					<li><a href="index.html">Home</a></li>
					<li><a href="about.html">About</a></li>
					<li><a href="Contact.html">Contact</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="sign_in.jsp"><i class="fas fa-user"></i> Sign Out</a></li>
				</ul>
			</div>
		</div>
	</nav>
        <div class="container">
            <form action="quantL.jsp" method="get">
                
            <h1>Menu</h1><br>
            <a href='OrderAttendantView.jsp?name=<%=request.getParameter("name") %>' style="float: left"><i class="fas fa-arrow-circle-left" style="font-size: 1.50em " title="Back"></i></a>
            <div id="rad">
                <label>
                    <input type="radio" name="r" value="0" checked>
                    Item Type
                </label>
                &nbsp; &nbsp;
                <label>
                    <%
                        if(request.getParameter("r")!=null &&request.getParameter("r").equals("1"))
                            out.print("<input type='radio' name='r' value='1' checked>");
                        else out.print("<input type='radio' name='r' value='1'>");
                    %>
                    Item Name
                </label>
                <br>
                
            </div>
            <div id="inp">
                <br>
                <%
                    
                    out.print("<select id='yes' name='s'><option value='select' selected>select</option>");
                    ResultSet rs=DBL.DBlayer.getResult("select distinct item_type from menu1");
                    while(rs.next()){
                        if(request.getParameter("s")!=null&&request.getParameter("s").equals(rs.getString(1)))
                            out.print("<option value='"+rs.getString(1)+"' selected>"+rs.getString(1)+"</option>");
                        else
                            out.print("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
                    }
                    out.print("</select>");
                  if(request.getParameter("t")==null)  
                    out.print("<input type='text' name='t' placeholder='Search here!' class='togg'>");
                else
                   out.print("<input type='text' name='t' placeholder='Search here!' class='togg' value='"+request.getParameter("t")+"'>");
                %>
                &nbsp;<button id="search"><i class="fas fa-search"></i></button>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-warning" id="sub"><font color="black"> Save <i class="fas fa-save"></i></font></button>
            </div>
          
                <br>
                <% //update maxqty in database
                   if(request.getParameter("tex")!=null){
                       ResultSet RS=DBL.DBlayer.getResult("select item_id from menu1");
                       while(RS.next()){
                           DBL.DBlayer.executeq("update menu1 set maxqty="+request.getParameter(RS.getString(1))+" where item_id="+RS.getString(1));
                           DBL.DBlayer.executeq("update menu1 set availabilty=1 where maxqty>=1");
                       }
                   } 
                   
                  if(request.getParameter("r")==null || request.getParameter("r").equals("0")){  
                    if(request.getParameter("s")==null || request.getParameter("s").equals("select")){
                       // int k=1;
                        ResultSet rs2=DBL.DBlayer.getResult("select distinct item_type from menu1");
                        while(rs2.next()){
                            out.print("<h1>"+rs2.getString(1)+"</h1><br><div class='submenu'>");
                            out.print("<div class='row'><h3><div class='col-lg-3 t'>Item</div><div class='col-lg-2'>Price</div><div class='col-lg-4 left'>Set</div></h3></div><br>");
                            ResultSet rs3=DBL.DBlayer.getResult("select * from menu1 where item_type='"+rs2.getString(1)+"'");
                            while(rs3.next()){
                                if( request.getParameter(rs3.getString(1))!=null && request.getParameter(rs3.getString(1)).equals("1")){
                                        out.print("<div class='row'><h4><div class='col-lg-3'><i class='fas fa-circle igreen'></i> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(6)+"'></div></h4></div>");                                                    
                                
                                }
                                else{
                                    if(rs3.getString(5).equals("1")) out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle igreen'></i></span> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(6)+"'></div></h4></div>");                                                    
                                    else out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle ired'></i></span> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(6)+"'></div></h4></div>");                                                     
                                }
                                 out.print("<br>");
                               // k++;
                            }
                            out.print("</div>");
                        }
                    }
                    else{
                       // int y=1;
                      ResultSet rs2=DBL.DBlayer.getResult("select distinct item_type from menu1");
                        while(rs2.next()){
                            out.print("<div id='disp'>");
                            out.print("<h1>"+rs2.getString(1)+"</h1><br><div class='submenu'>");
                            out.print("<div class='row'><h3><div class='col-lg-3 t'>Item</div><div class='col-lg-2'>Price</div><div class='col-lg-4 left'>Select</div></h3></div><br>");
                            ResultSet rs3=DBL.DBlayer.getResult("select * from menu1 where item_type='"+rs2.getString(1)+"'");
                            while(rs3.next()){
                                if( request.getParameter(rs3.getString(1))!=null && request.getParameter(rs3.getString(1)).equals("1")){
                                        out.print("<div class='row'><h4><div class='col-lg-3'><i class='fas fa-circle igreen'></i> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(6)+"'></div></h4></div>");                                                    
                                
                                }
                                else{
                                    if(rs3.getString(5).equals("1")) out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle igreen'></i></span> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(6)+"'></div></h4></div>");                                                    
                                    else out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle ired'></i></span> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(1)+"'></div></h4></div>");                                                     
                                }
                                 out.print("<br>");
                               // k++;
                            }
                            out.print("</div></div>");
                        }
                        out.print("<h1>"+request.getParameter("s")+"</h1><br><div class='submenu'>");
                            out.print("<div class='row'><h3><div class='col-lg-3 t'>Item</div><div class='col-lg-2'>Price</div><div class='col-lg-4 left'>Select</div></h3></div><br>");
                            ResultSet rs4=DBL.DBlayer.getResult("select * from menu1 where item_type='"+request.getParameter("s")+"'");
                            while(rs4.next()){
                              if( request.getParameter(rs4.getString(1))!=null && request.getParameter(rs4.getString(1)).equals("1")){
                                        out.print("<div class='row'><h4><div class='col-lg-3'><i class='fas fa-circle igreen'></i> &nbsp; &nbsp;"+rs4.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs4.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs4.getString(1)+"' value='"+rs4.getString(6)+"'></div></h4></div>");                                                    
                                
                                }
                                else{
                                    if(rs4.getString(5).equals("1")) out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle igreen'></i></span> &nbsp; &nbsp;"+rs4.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs4.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs4.getString(1)+"' value='"+rs4.getString(6)+"'></div></h4></div>");                                                    
                                    else out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle ired'></i></span> &nbsp; &nbsp;"+rs4.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs4.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs4.getString(1)+"' value='"+rs4.getString(6)+"' ></div></h4></div>");                                                     
                                }
                                out.print("<br>");
                               // y++;
                            }
                    }
                  }
                  else{
                      ResultSet rs2=DBL.DBlayer.getResult("select distinct item_type from menu1");
                        while(rs2.next()){
                            out.print("<div id='disp'>");
                            out.print("<h1>"+rs2.getString(1)+"</h1><br><div class='submenu'>");
                            out.print("<div class='row'><h3><div class='col-lg-3 t'>Item</div><div class='col-lg-2'>Price</div><div class='col-lg-4 left'>Select</div></h3></div><br>");
                            ResultSet rs3=DBL.DBlayer.getResult("select * from menu1 where item_type='"+rs2.getString(1)+"'");
                            while(rs3.next()){
                                if( request.getParameter(rs3.getString(1))!=null && request.getParameter(rs3.getString(1)).equals("1")){
                                        out.print("<div class='row'><h4><div class='col-lg-3'><i class='fas fa-circle igreen'></i> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(6)+"'></div></h4></div>");                                                    
                                
                                }
                                else{
                                    if(rs3.getString(5).equals("1")) out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle igreen'></i></span> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(6)+"'></div></h4></div>");                                                    
                                    else out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle ired'></i></span> &nbsp; &nbsp;"+rs3.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs3.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs3.getString(1)+"' value='"+rs3.getString(1)+"'></div></h4></div>");                                                     
                                }
                                 out.print("<br>");
                               // k++;
                            }
                            out.print("</div></div>");
                        }
                      out.print("<br><div class='submenu'>");
                            out.print("<div class='row'><h3><div class='col-lg-3 t'>Item</div><div class='col-lg-2'>Price</div><div class='col-lg-4 left'>Select</div></h3></div><br>");
                            ResultSet rs4=DBL.DBlayer.getResult("select * from menu1 where item_name like '%"+request.getParameter("t")+"%'");
                            while(rs4.next()){
                               if( request.getParameter(rs4.getString(1))!=null && request.getParameter(rs4.getString(1)).equals("1")){
                                        out.print("<div class='row'><h4><div class='col-lg-3'><i class='fas fa-circle igreen'></i> &nbsp; &nbsp;"+rs4.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs4.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs4.getString(1)+"' value='"+rs4.getString(6)+"'></div></h4></div>");                                                    
                                
                                }
                                else{
                                    if(rs4.getString(5).equals("1")) out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle igreen'></i></span> &nbsp; &nbsp;"+rs4.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs4.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs4.getString(1)+"' value='"+rs4.getString(6)+"'></div></h4></div>");                                                    
                                    else out.print("<div class='row'><h4><div class='col-lg-3'><span><i class='fas fa-circle ired'></i></span> &nbsp; &nbsp;"+rs4.getString(2)+"</div>&nbsp;&nbsp;<div class='col-lg-2'>"+rs4.getString(4)+"</div>&nbsp;&nbsp;<div class='col-lg-4'>"+"<input type='text'"+" name='"+rs4.getString(1)+"' value='"+rs4.getString(6)+"'></div></h4></div>");                                                     
                                }
                                out.print("<br>");
                               // y++;
                            }
                  }
                  %>
         
                  <input type="text" name="tex" value="1" class="togg" disabled>
                  </form>
                        
        </div>
        <script type="text/javascript">
            
            var v=<%=(request.getParameter("r")!=null &&request.getParameter("r").equals("1"))?"1":"0" %>
                       //var t
            
                    
                       
            if(v=="1"){
               
                 $("input[type='text'][name='t']").toggleClass("togg");
                 $("#yes").toggleClass("togg");
            }
            
            //else{
              //   $("input[type='text']").removeClass("togg");
                // $("#yes").addClass("togg");
            //}
            $("input[type=radio]").on("change",function(){
                $("input[type='text'][name='t']").toggleClass("togg");
                 $("#yes").toggleClass("togg");
            });
           // if(t!="0") $("input[type=text]").text( %>);
            $("#search").click(function(){
                document.forms[0].submit();
            });
           $("#sub").click(function(){
               document.forms[0].action="quantL.jsp";
               $('input[type=text][name=tex]').prop('disabled',false);
               document.forms[0].submit();
            <% //session.setAttribute((String)session.getAttribute("tableno"),request.getRequestURI()); %>
           });
           
            
        </script>        
    </body>
</html>

