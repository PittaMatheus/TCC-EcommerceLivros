<%-- 
    Document   : listar_pagamento.jsp
    Created on : May 12, 2019, 4:31:41 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="livraria.core.util.PrecoUtils"%>
<%@page import="ecommerce.dominio.pedido.ItemPedido"%>
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
<%  
            int id_cliente = 0;
            int tipo = 0;
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
                                 id_cliente = cliente.getId();
                                 tipo = cliente.getPapel().getId();
                                 out.println(cliente.getNome());
                               }
                             }
                        }
            }

    
    
            Resultado resultado = (Resultado) session.getAttribute("resultado");    
            List<Pedido> pedidos = (List) resultado.getEntidades();
            String id_pedido = request.getParameter("p");
            
            
            Resultado resultado2 = (Resultado) request.getAttribute("resultado2");
		if(resultado2 == null) {
			response.sendRedirect(request.getContextPath() + "/adm/ListarPagamentoPedido?p="+id_pedido+"&acao=listar");
			return;
		}
                
%>
            

        <h3>Cartões Utilizados no pedido</h3>
        <table border="1" class="highlight striped centered responsive-table">
            <thead>
                <tr>
                   <th>Bandeira</th><th>Nome do cartão</th><th>Data de validade</th> <th>Valor</th>
                </tr>
            </thead>
<%
                List<Pedido> pagamentos = (List) resultado2.getEntidades();
                for(Pedido ped : pagamentos){
%>
            <tbody>
                
            <td><%=ped.getPagamento().getCartao().getBandeira().getNome() %></td>  
            <td><%=ped.getPagamento().getCartao().getNome() %></td>
            <td><%=FormatadorData.formatarData(ped.getPagamento().getCartao().getDtVencimento())%></td>                  
            <td><%=PrecoUtils.Sifrao(String.valueOf(ped.getPagamento().getValorTotal())) %></td>
            

            


<%
                }
                
%>
           
            </tbody>     
        </table>
<br><br>

<%
    if(tipo == 2){
%>
<a href="../adm/listar_pedidos.jsp">Voltar</a>
<%
    }else if(tipo == 1){
%>
<a href="../Clientes/listar_meusPedidos.jsp">Voltar</a>

<%
}
%>
    </body>
</html>
