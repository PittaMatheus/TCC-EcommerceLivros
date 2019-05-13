<%-- 
    Document   : gerenciar_pedido
    Created on : May 13, 2019, 10:28:32 AM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.pedido.StatusPedido"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gerenciar pedido</title>
    </head>
    <body>
         <%
        Resultado resultado = (Resultado) session.getAttribute("resultado");   
        if(resultado != null){
        List<Pedido> pedidos = (List) resultado.getEntidades();
         
        int id_pedido = Integer.parseInt(request.getParameter("id"));
        
         for (Pedido pedido : pedidos) {
                        if(pedido.getId() == id_pedido){
                       
                    %>
                    <h3>Detalhes do pedido</h3>
                    
                    <ul>
                        <li>Cliente:     <%=pedido.getCliente().getNome()%></li>
                        <li>Numero do pedido:   <%=pedido.getId()%></li>
                        <li>Status do pedido:  <%=pedido.getStatusPedido().getId()%></li>
                        <li>Data do pedido: <%=pedido.getDtPedido() %> </li>

                    </ul>
                        <h3>Gerenciar pedido</h3>
                        Status do pedido:<br>  <%
                            
                            if(pedido.getStatusPedido().getId() == 1){
                                out.println("EM PROGRESSO");
                            }else if(pedido.getStatusPedido().getId() == 2){
                                out.println("EM_TRANSPORTE");
                            }else if(pedido.getStatusPedido().getId() == 3){
                                out.println("ENTREGUE");
                            }else if(pedido.getStatusPedido().getId() == 4){
                                out.println("EM TROCA");
                            }
                            else if(pedido.getStatusPedido().getId() == 5){
                                out.println("TROCA APROVADA");
                            }
                            else if(pedido.getStatusPedido().getId() == 6){
                                out.println("TROCA REPROVADA");
                            }else if(pedido.getStatusPedido().getId() == 7){
                                out.println("TROCA FINALIZADA");
                            }
                        
                        %><br><br>

                        <form action="GerenciarPedido">
                            <input type="hidden" name="id_pedido" value="<%=pedido.getId()%>">
                            <button name="acao" value="alterarStatusPedido">Alterar status do pedido</button>
                        </form>
       <%
       }
}
}
       %>
    </body>
</html>
