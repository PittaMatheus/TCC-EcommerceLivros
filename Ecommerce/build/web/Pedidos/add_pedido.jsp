<%-- 
    Document   : add_pedido
    Created on : Apr 26, 2019, 9:47:43 AM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cartao"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
          Resultado resultado = (Resultado) request.getAttribute("resultado");
           String id_cliente = request.getParameter("u");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Pedidos/AdicionarPedido?acao=inserir&u=" + id_cliente+"");
			return;
		}
      
        %>
        
  
        
        
        
        
        
        
        
        
    </body>
</html>
