<%-- 
    Document   : listar_pagamento.jsp
    Created on : May 12, 2019, 4:31:41 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.pedido.Pedido"%>
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
        Resultado resultado = (Resultado) session.getAttribute("resultado");    
        List<Pedido> pedidos = (List) resultado.getEntidades();
        int id_pedido = Integer.parseInt(request.getParameter("id_ped"));
                
                         if(pedidos.size() == 0) {
                            out.print("<br><br>Erro");
                        } else {
                     %>
                       
                <div class ="container">
                    <%
                    for (Pedido pedido : pedidos) {
                        if(pedido.getId() == id_pedido){
                    %>
                    <h3>Detalhes do pedido</h3>
                    
                    <ul>
                        <li>Cliente:     <%=pedido.getCliente().getNome()%></li>
                        <li>Numero do pedido:   <%=pedido.getId()%></li>
                        <li>Status do pedido:  <%=pedido.getStatusPedido().getId()%></li>

                    </ul>
                        <h3>Detalhes do pagamento do pedido</h3>
                     <table border="1" class="highlight striped centered responsive-table">
                                <thead>
                                    <tr>
                                        <th>Id do pedido</th><th>Data de pagamento</th><th>Valor total</th><th>Cupom de desconto</th><th>Bandeira do cartão</th>
                                    </tr>
                                </thead>
                                <tbody>                

                    <%
                                out.println("<tr>");
                                out.println("<td>" + pedido.getId() + "</td>"); 
                                out.println("<td>" + pedido.getPagamento().getDtPagamento()+ "</td>");
                                out.println("<td>" + pedido.getPagamento().getValorTotal()+ "</td>"); 
                                out.println("<td>" + pedido.getPagamento().getCupom() + "</td>");
                                out.println("<td>" + pedido.getPagamento().getCartao().getBandeira().getNome()+ "</td>");                                
                                out.println("</tr>");
                                out.println("</tbody>");
                                }
                            }
                         }    

    
    %>
            </table>
        <br><br>
                   
        <a href="listar_pedidos.jsp">Voltar</a>   
    </body>
</html>
