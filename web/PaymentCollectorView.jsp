<%-- 
    Document   : PaymentCollectorView
    Created on : 12 Nov, 2018, 7:10:14 PM
    Author     : HP 250 G5
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Collector View</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/PCV.css">
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
					<li><a href="sign_in.jsp"><i class="fas fa-user"></i> Sign out</a></li>
                                       
                                </ul>
			</div>
		</div>
	</nav>
        <%
            //out.print("<script type='text/javascript'>alert('Login Sucessfull');</script>");
            if(request.getParameter("id")!=null){
                String i=request.getParameter("id");
                DBL.DBlayer.executeq("update payment set PaymentReceived=1 where order_id="+i);
                DBL.DBlayer.executeq("update order_table set activity=0 where order_id="+i);
                response.sendRedirect("PaymentCollectorView.jsp?name="+request.getParameter("name"));
            }
            
            out.print("<h1>Welcome "+request.getParameter("name")+"</h1>");
            out.print("<h2>Ready For Payment</h2><br>"); 
            out.print("<table border=1 name='tab'><tr><th>Sr No.</th><th>Table No.</th><th>Bill Amount</th><th>Mode of payment</th><th>Payment Received?</th></tr>");
            ResultSet rs=DBL.DBlayer.getResult("select * from payment,order_table where PaymentReceived=0 and payment.order_id=order_table.order_id");
            int k=1;
            while(rs.next()){
                out.print("<tr name='"+rs.getString(1)+"'><td>"+k+".</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td><input type='checkbox' value='1' name='"+rs.getString(1)+"'></td></tr>");
                k++;
            }
            
            out.print("</table><br><br>");  
            out.print("<h2>Pending Payments</h2><br>");
            out.print("<table border=1><tr><th>Sr No.</th><th>Table no.</th></tr>");
            ResultSet rs2=DBL.DBlayer.getResult("select t.table_no from order_table t left join payment p on t.order_id=p.order_id  where  p.bill_amount is null and t.table_no is not null and t.activity=1");
            k=1;
            while(rs2.next()){
                out.print("<tr><td>"+k+".</td><td>"+rs2.getString(1)+"</td></tr>");
                k++;
            }    
            out.print("</table><br><br>");  
        %>
        <script type="text/javascript">
            $('input[type=checkbox]').click(function(){
                var i=this.name;
                $('tr[name='+i+']').fadeOut(1000,function(){
                   window.location.href+="&id="+i; 
                });
            });
        </script>
    </body>
</html>
