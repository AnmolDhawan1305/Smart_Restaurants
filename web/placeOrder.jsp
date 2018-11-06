<%-- 
    Document   : placeOrder
    Created on : 6 Nov, 2018, 5:34:56 PM
    Author     : HP 250 G5
--%>

<%@page contentType="text/html" import="java.sql.*,java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hidden</title>
    </head>
    <body>
        <%
            
            String or=DBL.DBlayer.getScalar("select max(order_id) from order_table");
            int v;
            if(or==null) v=0;
            else v=Integer.parseInt(or); 
            out.print("<h1>"+v+session.getAttribute("tableno")+"</h1>");
            boolean b=DBL.DBlayer.executeq("insert into order_table(order_id,table_no,getMessage) values("+(v+1)+","+session.getAttribute("tableno")+",'')");
            out.print(b);
            //session.removeAttribute("prev");
            session.setAttribute("orderId",v+1+"");
            ResultSet rs=DBL.DBlayer.getResult("select item_id from menu1");
            while(rs.next()){
            if(request.getParameter("c"+rs.getString(1))!=null)
                DBL.DBlayer.executeq("insert into order_detail(order_id,item_id,qty) values("+(v+1)+","+rs.getString(1)+","+request.getParameter("t"+rs.getString(1))+")");
            }
            //out.print("<script type='text/javascript'>alert('Order placed Successfully');</script>");
            response.sendRedirect("OrderView.jsp");
            
            %>
    </body>
</html>
