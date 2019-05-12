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
                        
			response.sendRedirect(request.getContextPath() + "/adm/ListarPedidos?acao=listar");
                        
			return;
		}
                        
                         List<Pedido> pedidos = (List) resultado.getEntidades();
                         
                         if(pedidos.size() == 0) {
                            out.print("<br><br>Nenhum pedido registrado");
                        } else {
                     %>
                       
                <div class ="container">
                    <h3>Pedidos registrados</h3>
                            <table border="1" class="highlight striped centered responsive-table">
                                <thead>
                                    <tr>
                                        <th>#</th><th>Id do pedido</th><th>Email</th><th>Nome</th><th>data do pedido</th><th>Status do pedido</th><th>Endereco de entrega</th>
                                        <th>Valor total</th><th>Pagamento</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                            for (Pedido pedido : pedidos) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value=" + pedido.getId() + " /></td>");
                                out.println("<td>" + pedido.getId() + "</td>"); 
                                out.println("<td>" + pedido.getCliente().getEmail()+ "</td>");
                                out.println("<td>" + pedido.getCliente().getNome()+ "</td>"); 
                                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                                String dataFormatPedido = formato.format(pedido.getDtPedido());
                                out.println("<td>" + dataFormatPedido+ "</td>");
                                out.println("<td>" + pedido.getStatusPedido().getId()+ "</td>");
                                out.println("<td><a href=../adm/listar_enderecoEntrega.jsp?id_end=" + pedido.getEndereco().getId()+ "&id_ped=" + pedido.getId() + ">Ver</a></td>");
                                double valorTotal= pedido.getPagamento().getValorTotal();
                                DecimalFormat formatoDouble = new DecimalFormat("#.##");      
                                valorTotal = Double.valueOf(formatoDouble.format(valorTotal));
                                out.println("<td> R$ " + valorTotal + "</td>");
                                out.println("<td><a href=listar_pagamento.jsp?id_ped=" + pedido.getId() + ">detalhar</a>");
                                out.println("</tr>");
                            }
                         }    
                    session.setAttribute("resultado",  resultado);  
                    %>
                            </tbody>
                            </table>
            </div>
    </form>
                <br><br>
        <a href='../Clientes/home.jsp'>Voltar</a>
    </body>
</html>
