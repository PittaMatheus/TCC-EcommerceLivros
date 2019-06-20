<%-- 
    Document   : listar_pedidos
    Created on : May 8, 2019, 10:39:56 AM
    Author     : matheus
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar pedidos</title>
    </head>
    <body>
        <%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
                        
			response.sendRedirect(request.getContextPath() + "/adm/ListarPedidos?acao=listar&tipoUsuario=2");
                        
			return;
		}
                        
                         List<Pedido> pedidos = (List) resultado.getEntidades();
                         
                         if(pedidos.size() == 0) {
                            out.print("<br><br>Nenhum pedido registrado");
                        } else {
                     %>
                       
                <div class ="container">
                    <h3>Pedidos registrados</h3>
                    <form action="gerenciar_pedido.jsp" method="POST">
                        
                        
                            <table border="1" class="highlight striped centered responsive-table">
                                <thead>
                                    <tr>
                                        <th>#</th><th>Id do pedido</th><th>Email</th><th>Nome</th><th>data do pedido</th><th>Status do pedido</th><th>Endereco de entrega</th>
                                        <th>Valor total</th><th>Itens</th><th>Pagamento</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String stPedido = "";
                                        session.setAttribute("resultado",  resultado); 
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
                                out.println("<td> " + LivroUtils.formatarPreco(pedido.getPagamento().getValorTotal()) + "</td>");
                                out.println("<td><a href=../Clientes/itensPedido.jsp?p="+pedido.getId()+">Livros</a></td>");
                                out.println("<td><a href=listar_pagamento.jsp?id_ped=" + pedido.getId() + ">detalhar</a>");
                                out.println("</tr>");
                            }
                         }    
                     
                    %>
                            </tbody>
                        </table>
                            <br>
                            <input type="submit" name="acao" value="gerenciar">
            </div>
                </form>
                <br><br>
        <a href='../Clientes/home.jsp'>Voltar</a>
    </body>
</html>
