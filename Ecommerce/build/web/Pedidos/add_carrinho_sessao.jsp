<%-- 
    Document   : add_carrinho_sessao
    Created on : May 22, 2019, 8:45:58 AM
    Author     : matheus
--%>

<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        String id_livro = request.getParameter("l");

		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Pedidos/AdicionarCarrinhoSessao?l="+id_livro + "&acao=consultarPorID");
			return;
		}
                %>  
        
        %>
    </body>
</html>
