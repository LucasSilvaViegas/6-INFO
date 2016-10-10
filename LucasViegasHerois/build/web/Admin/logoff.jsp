<%-- 
    Document   : logoff
    Created on : 27/06/2016, 01:09:40
    Author     : Cliente
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.setAttribute("usuario",null);
        response.sendRedirect("../Site");
        %>
        </body>
</html>
