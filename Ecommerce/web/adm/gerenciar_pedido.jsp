<%-- 
    Document   : gerenciar_pedido
    Created on : May 13, 2019, 10:28:32 AM
    Author     : matheus
--%>

<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="ecommerce.dominio.pedido.StatusPedido"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
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
        <title>Gerenciar pedido</title>
    </head>
    <body>
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
                <nav>
                    <div class="nav-wrapper indigo darken-4">
                      <a href="#" class="brand-logo center maiusculo">Gerenciar pedido</a>
                      <ul class="left">
                          <li><a href="listar_pedidos.jsp"><i class="material-icons">arrow_back</i></a></li>
                           </ul>
                    </div>
                  </nav>
            </div>
         <%
        Resultado resultado = (Resultado) session.getAttribute("resultado");   
        if(resultado != null){
            List<Pedido> pedidos = (List) resultado.getEntidades();
        
            
        int id_pedido = Integer.parseInt(request.getParameter("id"));
        String troca = request.getParameter("troca");
        
         for (Pedido pedido : pedidos) {
                        if(pedido.getId() == id_pedido){
                       
                    %>
                    
                    <div class="container">
                        <br><br>
                        <h4>Detalhes do pedido</h4>
                        <table border="1" class="highlight striped centered responsive-table">
                            <thead>
                                <tr>
                                    <td>Cliente:</td>
                                    <td>Numero do pedido: </td>
                                    <td>Status do pedido: </td>
                                    <td>Data do pedido:</td>
                                </tr>
                            <tbody>
                                <tr>
                                    <td><%=pedido.getCliente().getNome()%></td>
                                    <td><%=pedido.getId()%></td>
                                    <td><%=pedido.getStatusPedido().getId()%></td>
                                    <td><%=FormatadorData.formatarData(pedido.getDtPedido()) %></td>
                                </tr>
                            </tbody>
                            </thead>
                        </table>
                   
                                
                        <div class="center">
                            <h3>Gerenciar pedido</h3>
                       <br>  <%
                            
                           
                                 out.println("Status do pedido:<br>");
                                   if(pedido.getStatusPedido().getId() == 1){
                                        out.println("EM PROGRESSO");
                                   }else if(pedido.getStatusPedido().getId() == 2){
                                       out.println("EM_TRANSPORTE");
                                   }else if(pedido.getStatusPedido().getId() == 3){
                                       out.println("ENTREGUE");
                                   }else if(pedido.getStatusPedido().getId() == 4){
                                        out.println("EM TROCA");
                                   }else if(pedido.getStatusPedido().getId() == 5){
                                        out.println("TROCA APROVADA");
                                   }else if(pedido.getStatusPedido().getId() == 6){
                                        out.println("REPROVADA");
                                   }else if(pedido.getStatusPedido().getId() == 7){
                                        out.println("TROCADO");
                                   }

                                  
%>
                        
<br><br>
                        <form action="GerenciarPedido">
                            <input type="hidden" name="id_pedido" value="<%=pedido.getId()%>">
                            <input type="hidden" name="u" value="<%=pedido.getCliente().getId()%>">
                            <input type="hidden" name="status" value="<%=pedido.getStatusPedido().getId()%>">
                            <button type="submit" name="acao" value="alterar" class="btn-border green"><i class='material-icons left'>done</i>Alterar status</button>
      
                        </form>
                            </div>
                             </div>
       <%
           
       }
}
}
       %>
      

       
    </body>
    
</html>
