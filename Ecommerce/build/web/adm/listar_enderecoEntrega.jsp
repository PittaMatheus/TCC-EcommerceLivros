<%-- 
    Document   : listar_enderecoEntrega
    Created on : May 10, 2019, 11:10:50 AM
    Author     : matheus
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.cliente.Endereco"%>
<%@page import="ecommerce.dominio.cliente.Endereco"%>
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
        <title>Endereço de entrega do pedido</title>
    </head>
        <body>
        
    <%
        Resultado resultado = (Resultado) session.getAttribute("resultado");    
        List<Pedido> pedidos = (List) resultado.getEntidades();
        int id_endereco = Integer.parseInt(request.getParameter("id_end"));
        int id_pedido = Integer.parseInt(request.getParameter("id_ped"));
        int tipoCliente =0; 
                
                         if(pedidos.size() == 0) {
                            out.print("<br><br>Erro");
                        } else {
                     %>
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
             <form action="gerenciar_pedido.jsp" method="POST">
                <nav>
                    <div class="nav-wrapper indigo darken-4">
                      <a href="#" class="brand-logo center maiusculo">Endereço de entrega do pedido</a>
                      <ul class="left">
                
                    <%
                    for (Pedido pedido : pedidos) {
                        if(pedido.getId() == id_pedido){
                    %>
 
<%
                        if(tipoCliente == 0){
%>
                            <li><a href="../Clientes/listar_meusPedidos.jsp"><i class="material-icons">arrow_back</i></a></li>
<%
                        }else{
%>
                            <li><a href="listar_pedidos.jsp"><i class="material-icons">arrow_back</i></a></li>
<%

                        }
%>
         
                          
                      </ul>
                    </div>
                  </nav>
            </div>
                    <br>
                    <h5>Detalhes do pedido</h5>
                    
                    <ul>
                        <li>Cliente:     <%=pedido.getCliente().getNome()%></li>
                        <li>Numero do pedido:   <%=pedido.getId()%></li>
                        <li>Status do pedido:  <%=pedido.getStatusPedido().getId()%></li>
                    </ul>
                        <h4>Endereço</h4>
                     <table border="1" class="highlight striped centered responsive-table">
                                <thead>
                                    <tr>
                                        <th>Id do pedido</th><th>Logradouro</th><th>Numero</th><th>Bairro</th><th>Tipo de logradouro</th>
                                        <th>Cidade</th><th>Estado</th><th>Nome do endereço</th>
                                    </tr>
                                </thead>
                                <tbody>                

                    <%
                                out.println("<tr>");
                                out.println("<td>" + pedido.getId() + "</td>"); 
                                out.println("<td>" + pedido.getEndereco().getLogradouro()+ "</td>");
                                out.println("<td>" + pedido.getEndereco().getNumero()+ "</td>"); 
                                out.println("<td>" + pedido.getEndereco().getBairro()+ "</td>");
                                out.println("<td>" + pedido.getEndereco().getTipoLogradouro()+ "</td>");
                                out.println("<td>" + pedido.getEndereco().getCidade()+ "</td>");
                                out.println("<td>" + pedido.getEndereco().getUf()+ "</td>");
                                out.println("<td>" + pedido.getEndereco().getNomeEndereco()+ "</td>");
                                out.println("</tr>");
                                out.println("</tbody>");
                                tipoCliente = pedido.getCliente().getPapel().getId(); 
                                }
                            }
                         }    

    
    %>
            </table>
            

       
    </body>
</html>
