<%-- 
    Document   : clienteBurlou
    Created on : May 20, 2019, 2:21:05 PM
    Author     : matheus
--%>

<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ops</title>
    </head>
    <body>
        <h1>Você não vai burlar o sistema desativando o javascript. Também há validação no beck-end.</h1><br>
        <%  Resultado resultado = (Resultado)request.getAttribute("resultado");
            
            out.println(resultado.getMensagem());
        
        %>
        
    </body>
</html>
