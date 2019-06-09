
<%-- 
    Document   : listar_meusPedidos
    Created on : May 13, 2019, 6:37:42 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id_usuario = 0;
             if(session.getAttribute("usuarioLogado") == null){
                response.sendRedirect("../login.jsp");
            }else if(session.getAttribute("usuarioLogado") != null){
                Resultado resultado = (Resultado) session.getAttribute("usuarioLogado");    
                List<Cliente> clientes = (List) resultado.getEntidades();
                        if(resultado != null) {
                             if(clientes.size() == 0) {
                                response.sendRedirect("../login.jsp");
                            } else {
                               for (Cliente cliente : clientes) {         
                                 id_usuario =  cliente.getId();
                               }
                             }
                        }
            }
             

            
            
            
            
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
                        
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarMeusPedidos?acao=consultarPorID&tipoUsuario=1&u="+id_usuario);
                        
			return;
		}
                        
                         List<Pedido> pedidos = (List) resultado.getEntidades();
                         
                         if(pedidos.size() == 0) {
                            out.print("<br><br>Nenhum pedido registrado");
                        } else {
                     %>
                       
                <div class ="container">
                    <h3>Pedidos registrados</h3>
                    <form action="SolicitarTroca" method="POST">
                        
                        
                            <table border="1" class="highlight striped centered responsive-table">
                                <thead>
                                    <tr>
                                        <th>#</th><th>Email</th><th>Nome</th><th>data do pedido</th><th>Status do pedido</th><th>Endereco de entrega</th>
                                        <th>Valor total</th><th>Itens</th><th>Pagamento</th><th>Troca</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        String stPedido = "";
                                        session.setAttribute("resultado",  resultado); 
                            for (Pedido pedido : pedidos) {
                                %>
                                    <input type='hidden' name='u' value='<%=pedido.getCliente().getId()%>'>

                                    
                                    <% 
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
                                out.println("<td><input type='radio' required name='id_pedido' value=" + pedido.getId() + " /></td>");
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
                                out.println("<td><a href=itensPedido.jsp?u="+id_usuario+"&p="+pedido.getId()+">Livros</a></td>");
                                out.println("<td><a href=../adm/listar_pagamento.jsp?id_ped=" + pedido.getId() + ">detalhar</a>");
                                
                                
                                if(stPedido.equals("ENTREGUE")){
                                    out.println("<td><input type='submit' name='acao' value='inserir'></td>");
                                }else{
                                    out.println("<td>-</td>");
                                }
                                out.println("</tr>");
                                
                                
                                 
                            }
                         }    
                     
                    %>
                            </tbody>
                        </table>
                            <br>

                            
            </div>
                </form>
                <br><br>
        <a href='../Clientes/home.jsp'>Voltar</a>
    </body>
</html>
