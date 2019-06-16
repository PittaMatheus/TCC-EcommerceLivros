<%-- 
    Document   : CupomDescontoPagamento
    Created on : Jun 16, 2019, 11:21:23 AM
    Author     : matheus
--%>

<%@page import="livraria.core.util.PrecoUtils"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cupom</title>
    </head>
    <body>
        <h1>Cupom de Desconto utilizado no pagamento</h1>
        
        <%
            int id_cliente = 0;
            int papel = 0;
            
            String id_pedido = request.getParameter("p");
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
                                 out.println(cliente.getNome());
                                 papel = cliente.getPapel().getId();
                               }
                            }
                    }
                         }
            Resultado resultado2 = (Resultado) request.getAttribute("resultado2");
		if(resultado2 == null) {
			response.sendRedirect(request.getContextPath() + "/adm/ListarPagamentoPedido?p="+id_pedido+"&acao=listar&cupom=1");
			return;
		}
                            
                        
           
            
%>
           
        <ul>
            <li>Pedido: <%=id_pedido%>  </li>

        </ul>
        <h3>Cupom Utilizado no pedido</h3>
        <table border="1" class="highlight striped centered responsive-table">
            <thead>
                <tr>
                   <th>Nome</th><th>Valor(%)</th>
                </tr>
            </thead>
<%
                List<Pedido> pagamentos = (List) resultado2.getEntidades();
                for(Pedido ped : pagamentos){
%>
            <tbody>
                
            <td><%=ped.getPagamento().getCupom().getNome()%></td>  
            <td><%=ped.getPagamento().getCupom().getValorDesconto() %></td>

<%
                }
%>
            </tbody>     
        </table>
            <br>
            <%
    if(papel == 1){
%>
    <a href="../Clientes/listar_meusPedidos.jsp">Voltar</a>
<%
    } else{
%>
<a href="../adm/listar_pedidos.jsp">Voltar</a>
<% }
%>

    </body>
</html>
