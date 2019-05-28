<%-- 
    Document   : carrinho
    Created on : Apr 20, 2019, 9:05:44 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cliente"%>
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

            String id_livro = request.getParameter("l");
            String id_usuario = request.getParameter("u");
       %>

        
        <%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Pedidos/AdicionarCarrinho?acao=inserir&l="+id_livro + "&u=" + id_usuario);
			return;
		}
                %>

</html>
