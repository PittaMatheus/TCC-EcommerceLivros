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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        <body>

    <%
        Resultado resultado = (Resultado) session.getAttribute("resultado");    
        List<Pedido> pedidos = (List) resultado.getEntidades();
        int id_endereco = Integer.parseInt(request.getParameter("id_end"));
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
                        <h3>Detalhes do endereço de entrega</h3>
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
                                }
                            }
                         }    

    
    %>
            </table>
        <br><br>
                   
        <a href="listar_pedidos.jsp">Voltar</a>   
    </body>
</html>
