<%-- 
    Document   : managerBillsView
    Created on : 25 Nov, 2018, 11:50:37 AM
    Author     : HP 250 G5
--%>

<%@page contentType="text/html" import="java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display BIll</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-2.1.4.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>	
<link rel="stylesheet" href="css/BillDisplay.css">
<style>
    h1{
        text-align: center;
    }
    .content{
        margin-left: 33%;
    }
    table{
        margin-left: 7%;
        width: 500px;
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
                                        <li><a href="managerRatingsView.jsp"><i class="fas fa-star-half-alt"></i> View Ratings</a></li>
                                        <li><a href="managerBillsView.jsp"><i class="fas fa-file-invoice-dollar"></i> View Bills</a></li>
				</ul>
			</div>
		</div>
	</nav>
        <h1> Welcome Manager</h1><br>
        <div class="content">
            <form action="managerBillsView.jsp" method="get">  
            <label for="month_start">Month</label> 
            <select id="month_start" 
                    name="month" />
            <option>all</option>
              <option value="1">January</option>       
              <option value="2">February</option>       
              <option value="3">March</option>       
              <option value="4">April</option>       
              <option value="5">May</option>       
              <option value="6">June</option>       
              <option value="7">July</option>       
              <option value="8">August</option>       
              <option value="9">September</option>       
              <option value="10">October</option>       
              <option value="11">November</option>       
              <option value="12">December</option>       
            </select> -
            <label for="day_start">Day</label> 
            <select id="day_start" name="day" />
              <option>all</option>      
              <option>1</option>       
              <option>2</option>       
              <option>3</option>       
              <option>4</option>       
              <option>5</option>       
              <option>6</option>       
              <option>7</option>       
              <option>8</option>       
              <option>9</option>       
              <option>10</option>       
              <option>11</option>       
              <option>12</option>       
              <option>13</option>       
              <option>14</option>       
              <option>15</option>       
              <option>16</option>       
              <option>17</option>       
              <option>18</option>       
              <option>19</option>       
              <option>20</option>       
              <option>21</option>       
              <option>22</option>       
              <option>23</option>       
              <option>24</option>       
              <option>25</option>       
              <option>26</option>       
              <option>27</option>       
              <option>28</option>       
              <option>29</option>       
              <option>30</option>       
              <option>31</option>       
            </select> - 
            <label for="year_start">Year</label> 
            <select id="year_start" name="year" />
            <option>all</option>
              <option>2009</option>       
              <option>2010</option>       
              <option>2011</option>       
              <option>2012</option>       
              <option>2013</option>       
              <option>2014</option>       
              <option>2015</option>       
              <option>2016</option>       
              <option>2017</option>       
              <option>2018</option>       
            </select> 
            
         &nbsp; &nbsp; &nbsp;    
         <button name="search" type="submit"><i class="fas fa-search"></i></button>
            &nbsp; &nbsp; &nbsp; 
            <button type="button" class="btn btn-primary" name="avg">Total Amount</button>
            </form><br><br>
            <table border="1" id="tab">
                <tr>
                    <th>Sr NO.</th>
                    <th>Order Id</th>
                    <th>Bill Amount</th>
                    <th>Mode of Payment</th>
                    <th>Date</th>
                </tr>
                <%
                    if(request.getParameter("day")==null ||(request.getParameter("day").equals("all")&&request.getParameter("month").equals("all")&&request.getParameter("year").equals("all") )){
                        ResultSet rs=DBL.DBlayer.getResult("select * from payment where paymentReceived=1");
                        int k=1;
                        while(rs.next()){
                            out.print("<tr><td>"+k+".</td><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(3)+"</td></tr>");
                            k++;
                            out.print("<input type=hidden name=t value='"+rs.getString(2)+"' >");
                        }
                    }
                    else{
                        //HashMap<String, Integer> map = new HashMap<>(); 
                        //map.put("January",1);
                        //map.put("Febrauary",1);
                        //map.put("March",1);
                        //map.put("April",1);
                        //map.put("January",1);
                        //map.put("January",1);
                        out.print("<script type='text/javascript'>$('#month_start').val('"+request.getParameter("month")+"');"+"$('#day_start').val('"+request.getParameter("day")+"');"+"$('#year_start').val('"+request.getParameter("year")+"');"+"</script>");
                        String Y=request.getParameter("year");
                        if(Y!=null&& Y.equals("all")) Y="any(select year(order_date) from payment where paymentReceived=1)";
                        String M=request.getParameter("month");
                        if(M!=null&& M.equals("all")) M="any(select month(order_date) from payment where paymentReceived=1)";
                        String D=request.getParameter("day");
                        if(D!=null&& D.equals("all")) D="any(select day(order_date) from payment where paymentReceived=1)";
                        ResultSet rs=DBL.DBlayer.getResult("select * from payment where year(order_date)="+Y+" and month(order_date)="+M+" and day(order_date)="+D);
                        int k=1;
                        while(rs.next()){
                             out.print("<tr><td>"+k+".</td><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(3)+"</td></tr>");
                            k++;
                            out.print("<input type=hidden name=t value='"+rs.getString(2)+"' >");
                        }   
                         }
                    %>
            </table>
        </div>
            <script type="text/javascript">
                $('button[name=avg]').click(function(){
                    var y=$('#year_start').val();
                    if(y!='all') y=" Year: "+y;
                    else y='';
                    var m=$('#month_start option:selected').text();
                    if(m!='all') m="in Month: "+m;
                    else m='';
                    var d=$('#day_start').val();
                    if(d!='all') d=" Day: "+d;
                    else d='';
                    var x=$('input[type=hidden]');
                    var sum=0;
                    for(var i=0;i<x.length;i++) sum+=Number(x[i].value);
                    //sum=sum.toPrecision(3);
                    //sum=Double(sum);
                    alert('Total amount '+m+d+y+' is '+sum);
            });
            $("select").on("change",function(){
                document.forms[0].submit();
            });
            </script>
    </body>
</html>

