<%-- 
    Document   : managerRatingsView
    Created on : 22 Nov, 2018, 9:19:51 PM
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
                                        <li><a href="managerRatingsView.jsp"><i class="fas fa-file-invoice-dollar"></i> View Bills</a></li>
				</ul>
			</div>
		</div>
	</nav>
        <h1> Welcome Manager</h1><br>
        <div class="content">
            
        </div>
    </body>
</html>
