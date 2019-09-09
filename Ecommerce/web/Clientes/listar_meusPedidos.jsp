
<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="livraria.core.util.FormatadorData"%>
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
                <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
         <!-- CSS CAROUSEL-->
         <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css" media="screen,projection"/>
         <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css" media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Meus Pedidos</title>
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
                        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
                <nav>
                    <div class="nav-wrapper indigo darken-4">
                      <a href="#" class="brand-logo center maiusculo">Pedidos registrados</a>
                      
                      <ul class="left">
                          <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                      </ul>
                    </div>
                  </nav>
            </div>
                <div class ="container">
                    <h3>Meus pedidos registrados</h3>
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
                                %>
                                
                                
                                <td><input type='radio' required name='id_pedido' value="<%=pedido.getId()%>" id="<%=pedido.getId() %>" /><label for="<%=pedido.getId() %>"></label></td>
                      <%          out.println("<td>" + pedido.getCliente().getEmail()+ "</td>");
                                out.println("<td>" + pedido.getCliente().getNome()+ "</td>"); 
                                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                                String dataFormatPedido = formato.format(pedido.getDtPedido());
                                out.println("<td>" + dataFormatPedido+ "</td>");
                                out.println("<td>" + stPedido + "</td>");
                                out.println("<td><a href=../adm/listar_enderecoEntrega.jsp?id_end=" + pedido.getEndereco().getId()+ "&id_ped=" + pedido.getId() + ">Ver</a></td>");
                                out.println("<td> " + LivroUtils.formatarPreco(pedido.getPagamento().getValorTotal()) + "</td>");
                                out.println("<td><a href=itensPedido.jsp?u="+id_usuario+"&p="+pedido.getId()+">Livros</a></td>");
                                out.println("<td><a href=../adm/listar_pagamento.jsp?id_ped=" + pedido.getId() +"&u="+id_usuario + ">detalhar</a>");
                                
                                
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
    </body>
</html>