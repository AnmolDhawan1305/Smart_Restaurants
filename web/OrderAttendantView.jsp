<%-- 
    Document   : OrderAttendantView
    Created on : 10 Nov, 2018, 12:49:36 PM
    Author     : HP 250 G5
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>OrderAttendant View</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style type="text/css">
    h1{
        text-align: center;
        margin-top: 5%;
    }
    h2{
        text-align: center;
    }
    h3{
        margin-left: 10%;
    }
    #orders{
        margin-left: 38%;
    }
    .btn-primary{
        margin-left: 17%;
    }
    table{
        text-align: center;
        width: 40%;
        font-size: 16px;
    }
    th{
        text-align: center;
    }
    td{
        height: 40px;
    }
    hr{
    overflow: visible; /* For IE */
    padding: 0;
    border: none;
    border-top: medium double #333;
    color: #333;
    text-align: center;
    width: 40%;
    margin-left: 0;
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
					<li><a href="sign_in.jsp"><i class="fas fa-user"></i> Sign out</a></li>
                                        <li><a href='quantL.jsp?name=<%=request.getParameter("name") %>'><i class="fas fa-angle-up"></i> Set Quantity Limit</a>
                                </ul>
			</div>
		</div>
	</nav>
        <%
            //out.print("<script type='text/javascript'>alert('Login Sucessfull');</script>");
            out.print("<h1>Welcome "+request.getParameter("name")+"</h1>");
            out.print("<h2>Orders</h2>"); 
            out.print("<div id='orders'>");
            //ResultSet rs=DBL.DBlayer.getResult("select distinct table_no from (select t.table_no from menu1 m,order_table t,order_detail d where t.order_id=d.order_id and m.item_id=d.item_id and t.activity=1 and d.delievered=0) as t");
            //
            //select distinct table_no from (select m.item_name,t.table_no,d.qty from menu1 m,order_table t,order_detail d where t.order_id=d.order_id and m.item_id=d.item_id) as t
            //while(rs.next()){
            //String maxi=DBL.DBlayer.getScalar("select max()");
            //out.print("<h3>Table Number: "+rs.getString(1)+"</h3>");
            //out.print("<table border=1><tr><th>Sr No.</th><th>Item Name</th><th>Qty</th></tr>&nbsp;&nbsp;&nbsp;&nbsp;");
            if(request.getParameter("del")!=null){
                DBL.DBlayer.executeq("update order_detail set delievered=1 where order_id="+request.getParameter("oid")+" and itr="+request.getParameter("itr"));
                response.sendRedirect("OrderAttendantView.jsp?name="+request.getParameter("name"));
            }
            String prev=null;
            String prevo=null;
            String previ=null;
            int i=1;
            ResultSet rs2=DBL.DBlayer.getResult("select m.item_name,d.qty,d.order_id,t.table_no,d.itr from menu1 m,order_table t,order_detail d where t.order_id=d.order_id and m.item_id=d.item_id and t.activity=1 and d.delievered=0 ");
            int k=1;
            boolean b=false;
            while(rs2.next()){
                if(rs2.getString(4)==null) continue;
                b=true;
                if(prev==null){
                    out.print("<hr>");
                    out.print("<h3>Table Number: "+rs2.getString(4)+"</h3>");
                    out.print("<table border=1 name=f"+i+"><tr><th>Sr No.</th><th>Item Name</th><th>Qty</th></tr>&nbsp;&nbsp;&nbsp;&nbsp;");
                    
                }
                else{
                    if(!prev.equals(rs2.getString(4))){
                        out.print("</table><br>");
                        out.print("<button type='button' class='btn btn-primary' name='"+prevo+"' value='"+previ+"' id='f"+(i)+"'>Ready</button>");
                        out.print("<hr><h3>Table Number: "+rs2.getString(4)+"</h3>");
                        i++; 
                        out.print("<table border=1 name=f"+i+"><tr><th>Sr No.</th><th>Item Name</th><th>Qty</th></tr>&nbsp;&nbsp;&nbsp;&nbsp;");
                       k=1;
                       
                    }
                        }
               out.print("<tr><td>"+k+".</td><td>"+rs2.getString(1)+"</td><td>"+rs2.getString(2)+"</td></tr>");
                k++;
                prev=rs2.getString(4);
                prevo=rs2.getString(3);
                previ=rs2.getString(5);
                
            }
            out.print("</table><br>");
            if(b) out.print("<button type='button' class='btn btn-primary' name='"+prevo+"' value='"+previ+"' id='f"+i+"'>Ready</button>");
                        
            //}
            out.print("</div>");
            %>
            <script type="text/javascript">
                $('button').click(function(){
                   var o=this.name;
                   var i=this.value;
                   var f=this.id;
                   $("table[name="+f+"]").fadeOut(1000,function(){
                   window.location.href+="&del=1"+"&oid="+o+"&itr="+i;
               }); 
                });
            </script>
    </body>
</html>