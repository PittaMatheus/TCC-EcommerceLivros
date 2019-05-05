<%-- 
    Document   : confirmaValorTotal
    Created on : Apr 30, 2019, 10:12:33 PM
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
<%
        String valorTotal = request.getParameter("valorTotal");
        String id_usuario = request.getParameter("id_usuario");

        response.sendRedirect(request.getContextPath() + "/Pedidos/AdicionarPedido?valorTotal=" + valorTotal + "&u=" + id_usuario);

%>        
    </body>
</html>
