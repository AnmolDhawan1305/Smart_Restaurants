<%-- 
    Document   : index
    Created on : 6 Nov, 2018, 11:42:32 PM
    Author     : HP 250 G5
--%>

<%@page contentType="text/html"  import="java.util.*" pageEncoding="UTF-8"%>
<%
  Enumeration em=session.getAttributeNames();
  while(em.hasMoreElements()){
      session.removeAttribute((String)em.nextElement());
  }
  response.sendRedirect("index.html");
%>
