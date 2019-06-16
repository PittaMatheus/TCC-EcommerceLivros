<%-- 
    Document   : listar_trocas
    Created on : Jun 15, 2019, 6:43:49 PM
    Author     : matheus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.pedido.Troca"%>
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
		if(resultado == null) {
                    response.sendRedirect(request.getContextPath() + "/adm/ListarTrocas?acao=listar&tipoUsuario=2&status=1");
                    return;
                 }
                 List<Pedido> pedidos = (List) resultado.getEntidades();
                    if(pedidos.size() == 0) {
                        out.print("<br><br>Nenhuma troca registrada");
                    } else {
                        String stPedido = "";
                        session.setAttribute("resultado",  resultado);        
                         
%>
                        <h3>Trocas Registradas</h3>
                        <table border="1" class="highlight striped centered responsive-table">
                            <thead>
                                <tr>
                                    <th>#</th><th>Id do pedido</th><th>Email</th><th>Nome</th><th>data do pedido</th><th>Status do pedido</th><th>Endereco de entrega</th>
                                    <th>Valor total</th><th>Pagamento</th>
                                </tr>
                            </thead>
                            <tbody>
<%                              session.setAttribute("resultado",  resultado); 
                                for (Pedido pedido : pedidos) {
                                    if(pedido.getStatusPedido().getId() == 1){
                                        stPedido = "EM PROGRESSO";
                                    }else if(pedido.getStatusPedido().getId() == 2){
                                         stPedido = "EM_TRANSPORTE";
                                    }else if(pedido.getStatusPedido().getId() == 3){
                                        stPedido = "ENTREGUE";
                                    }else if(pedido.getStatusPedido().getId() == 4){
                                         stPedido = "EM TROCA";
                                    }
                                    else if(pedido.getStatusPedido().getId() == 5){
                                         stPedido = "TROCA APROVADA";
                                    }
                                    else if(pedido.getStatusPedido().getId() == 6){
                                         stPedido = "TROCA REPROVADA";
                                    }else if(pedido.getStatusPedido().getId() == 7){
                                       stPedido = "TROCA FINALIZADA";
                                    }
                                    out.println("<tr>");
                                    out.println("<td><input type='radio' required name='id' value=" + pedido.getId() + " /></td>");
                                    out.println("<td>" + pedido.getId() + "</td>"); 
                                    out.println("<td>" + pedido.getCliente().getEmail()+ "</td>");
                                    out.println("<td>" + pedido.getCliente().getNome()+ "</td>"); 
                                    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                                    String dataFormatPedido = formato.format(pedido.getDtPedido());
                                    out.println("<td>" + dataFormatPedido+ "</td>");
                                    out.println("<td>" + stPedido + "</td>");
                                    out.println("<td><a href=../adm/listar_enderecoEntrega.jsp?id_end=" + pedido.getEndereco().getId()+ "&id_ped=" + pedido.getId() + ">Ver</a></td>");
                                    double valorTotal= pedido.getPagamento().getValorTotal();
                                    DecimalFormat formatoDouble = new DecimalFormat("#.##");      
                                    valorTotal = Double.valueOf(formatoDouble.format(valorTotal));
                                    out.println("<td> R$ " + valorTotal + "</td>");
                                    out.println("<td><a href=listar_pagamento.jsp?id_ped=" + pedido.getId() + ">detalhar</a>");
                                    out.println("</tr>");
                                }
                         }    
                     
                    %>
                            </tbody>
                        </table>
                <br><br>
        <a href='../Clientes/home.jsp'>Voltar</a>
        
        
    </body>
</html>
