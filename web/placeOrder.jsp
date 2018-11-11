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
            if(session.getAttribute("tableno")==null) response.sendRedirect("index.html");
            if(session.getAttribute("orderId")==null){
            String or=DBL.DBlayer.getScalar("select max(order_id) from order_table");
            int v;
            if(or==null) v=0;
            else v=Integer.parseInt(or); 
            //select t.table_no from order_table t left join payment p on t.order_id=p.order_id where  p.bill_amount is null 
            //out.print("<h1>"+v+session.getAttribute("tableno")+"</h1>");
            boolean b=DBL.DBlayer.executeq("insert into order_table(order_id,table_no) values("+(v+1)+","+session.getAttribute("tableno")+")");
            //out.print(b);
            //session.removeAttribute("prev");
            session.setAttribute("orderId",v+1+"");
            
            ResultSet rs=DBL.DBlayer.getResult("select item_id from menu1");
            while(rs.next()){
            if(request.getParameter("c"+rs.getString(1))!=null)
                DBL.DBlayer.executeq("insert into order_detail(order_id,item_id,qty) values("+(v+1)+","+rs.getString(1)+","+request.getParameter("t"+rs.getString(1))+")");
                DBL.DBlayer.executeq("update menu1 set maxqty=maxqty-"+request.getParameter("t"+rs.getString(1))+" where item_id="+rs.getString(1));
                DBL.DBlayer.executeq("update menu1 set availabilty=0 where maxqty=0");    
            }
            session.setAttribute("alert","1");
            }
            else{
                boolean b=false;
             ResultSet rs=DBL.DBlayer.getResult("select item_id from menu1");
             String h=DBL.DBlayer.getScalar("select max(itr) from order_detail where order_id="+session.getAttribute("orderId"));
            while(rs.next()){
                
            if(request.getParameter("c"+rs.getString(1))!=null){
                if(h==null)
                    DBL.DBlayer.executeq("insert into order_detail(order_id,item_id,qty) values("+session.getAttribute("orderId")+","+rs.getString(1)+","+request.getParameter("t"+rs.getString(1))+")");
                else
                    DBL.DBlayer.executeq("insert into order_detail(order_id,item_id,qty,itr) values("+session.getAttribute("orderId")+","+rs.getString(1)+","+request.getParameter("t"+rs.getString(1))+","+(Integer.parseInt(h)+1)+")");
                b=true;
                DBL.DBlayer.executeq("update menu1 set maxqty=maxqty-"+request.getParameter("t"+rs.getString(1))+" where item_id="+rs.getString(1));
                DBL.DBlayer.executeq("update menu1 set availabilty=0 where maxqty=0");
                //DBL.DBlayer.executeq("update menu1 set maxqty=0 where availabilty=0");
                //out.print("<h3>"+boo+"</h3>");
            }
            }
            if(b) session.setAttribute("alert","1");
            }
            
            response.sendRedirect("OrderView.jsp");
            
            %>
    </body>
</html>
