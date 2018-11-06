<%-- 
    Document   : OrderView
    Created on : 4 Nov, 2018, 10:43:24 PM
    Author     : HP 250 G5
--%>

<%@page contentType="text/html" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OrderView</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	
<link rel="stylesheet" href="css/Order.css">

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
					<li><a href="sign_in.jsp"><i class="fas fa-user"></i> Sign in</a></li>
				</ul>
			</div>
		</div>
	</nav>
        <h1>Your Order</h1><br>
        <div class="cont">
        <div class="row" id="h">
            <div class="col-lg-1">Sr No.</div>
            <div class="col-lg-2">Item Name</div>
            <div class="col-lg-1">Price/unit</div> <!--Name uid   -->
            <div class="col-lg-2">Qty</div> <!--Name tid buttons id plid or mid   -->
            <div class="col-lg-1">Price</div> <!--Name pid   -->
            <div class="col-lg-1">Status</div> 
            <div class="col-lg-1">Choose</div> <!--Name cid   -->
        </div>
        <%
           // int k=1;
           //if(session.getAttribute("prev")!=null) session.removeAttribute("orderId");
           if(session.getAttribute("orderId")!=null){
               
               ResultSet rs=DBL.DBlayer.getResult("select m.item_id,m.item_name,m.price,od.qty,od.delievered from menu1 m,order_detail od where m.item_id=od.item_id and od.order_id="+session.getAttribute("orderId"));
           while(rs.next()){
                 if(rs.getString(5)!=null && rs.getString(5).equals("1"))
                   out.print("<div class='row' id='r"+rs.getString(1)+"'><br><div class='col-lg-1'><input type='text' class='sr' style='width: 50px;text-align:center' disabled></div><div class='col-lg-2'>"+rs.getString(2)+"</div><div class='col-lg-1'><input type='text' name='u"+rs.getString(1)+"' value='"+rs.getString(3)+"' style='width: 70px;text-align:center;' disabled></div>&nbsp;<div class='col-lg-2'><button class='pl' id='pl"+rs.getString(1)+"' disabled><i class='fas fa-plus'></i></button>&nbsp;<input type='text' name='t"+rs.getString(1)+"' value='"+rs.getString(4)+"' style='width: 50px; text-align:center' disabled>&nbsp;<button class='ms' id='m"+rs.getString(1)+"' disabled><i class='fas fa-minus'></i></button></div><div class='col-lg-1'><input type='text' name='p"+rs.getString(1)+"' class='prc' value='"+(Integer.parseInt(rs.getString(3))*Integer.parseInt(rs.getString(4)))+"' style='width: 70px; text-align: center' disabled></div><div class='col-lg-1'>Delievered</div>"+"<div class='col-lg-1'><input type='checkbox' name='c"+rs.getString(1)+"' value='1' checked disabled></div></div>");
              // k++;
                  else 
                    out.print("<div class='row' id='r"+rs.getString(1)+"'><br><div class='col-lg-1'><input type='text' class='sr' style='width: 50px;text-align:center' disabled></div><div class='col-lg-2'>"+rs.getString(2)+"</div><div class='col-lg-1'><input type='text' name='u"+rs.getString(1)+"' value='"+rs.getString(3)+"' style='width: 70px;text-align:center;' disabled></div>&nbsp;<div class='col-lg-2'><button class='pl' id='pl"+rs.getString(1)+"' disabled><i class='fas fa-plus'></i></button>&nbsp;<input type='text' name='t"+rs.getString(1)+"' value='"+rs.getString(4)+"' style='width: 50px; text-align:center' disabled>&nbsp;<button class='ms' id='m"+rs.getString(1)+"' disabled><i class='fas fa-minus'></i></button></div><div class='col-lg-1'><input type='text' name='p"+rs.getString(1)+"' class='prc' value='"+(Integer.parseInt(rs.getString(3))*Integer.parseInt(rs.getString(4)))+"' style='width: 70px; text-align: center' disabled></div><div class='col-lg-1'>Not Delievered</div>"+"<div class='col-lg-1'><input type='checkbox' name='c"+rs.getString(1)+"' value='1' checked disabled></div></div>");
           }
           }
           
           out.print("<form action='placeOrder.jsp' method='get'>");
           //Write code here if parameter has already set values
           ResultSet rs=DBL.DBlayer.getResult("select item_id,item_name,price from menu1");
           while(rs.next()){
               if(request.getParameter(rs.getString(1))!=null && (request.getParameter(rs.getString(1)).equals("1")) || (request.getParameter("c"+rs.getString(1))!=null && request.getParameter("c"+rs.getString(1)).equals("1"))){
                   out.print("<div class='row' id='r"+rs.getString(1)+"'><br><div class='col-lg-1'><input type='text' class='sr' style='width: 50px;text-align:center' disabled></div><div class='col-lg-2'>"+rs.getString(2)+"</div><div class='col-lg-1'><input type='text' name='u"+rs.getString(1)+"' value='"+rs.getString(3)+"' style='width: 70px;text-align:center;' disabled></div>&nbsp;<div class='col-lg-2'><button class='pl' id='pl"+rs.getString(1)+"' type='button'><i class='fas fa-plus'></i></button>&nbsp;<input type='text' name='t"+rs.getString(1)+"' value='1' style='width: 50px; text-align:center' readonly>&nbsp;<button class='ms' id='m"+rs.getString(1)+"' type='button'><i class='fas fa-minus'></i></button></div><div class='col-lg-1'><input type='text' name='p"+rs.getString(1)+"' class='prc' value='"+rs.getString(3)+"' style='width: 70px; text-align: center' disabled></div><div class='col-lg-1'>Not Delieverd</div>"+"<div class='col-lg-1'><input type='checkbox' name='c"+rs.getString(1)+"' value='1' checked></div></div>");
              // k++;
               
               
           }
           }
           out.print("</form>");  
            %>
            <br>
             <div id="ll">
            <label><span >Grand total</span>
                    &nbsp; &nbsp;
                    <input type="text" name="total" disabled style="width: 100px;text-align: center">
                </label> &nbsp; &nbsp;  &nbsp; &nbsp;
            <span > <button id="add" title="Add more Items"><i class='fas fa-plus'></i></button></span>
             </div>
            <br><br>
            <br>
                <button type="button" class="btn btn-warning" name='cancel' style="float:left">Cancel Order</button>
                <button type="button" class="btn btn-info" id="submit" style="margin-right:200px" >Place Order</button>
                 <button type="button" class="btn btn-primary"style="margin-left: 50px" >I am done with my food</button>
                <script type="text/javascript" src="javascript/Order.js"></script>  
            
        </div>
           <% 
               if(session.getAttribute("orderId")!=null)
                    out.print("<script type='text/javascript'>$('.btn-warning').prop('disabled',true);</script>");
               %>
        </body>
</html>
