<%-- 
    Document   : carrinhoSessao
    Created on : May 22, 2019, 1:22:28 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.pedido.Carrinho"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho</title>
    </head>
    <body>
<%
        if(session.getAttribute("carrinho") == null){
             out.println("O carrinho está vazio");
        }else if(session.getAttribute("carrinho") != null){
            Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");    
                if(carrinho != null) {
                    out.print("Livro " + carrinho.getLivro().getId());
                }
        }
        
%>
    </body>
</html>
