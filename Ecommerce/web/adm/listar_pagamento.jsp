<%-- 
    Document   : listar_pagamento.jsp
    Created on : May 12, 2019, 4:31:41 PM
    Author     : matheus
--%>

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
<%          Resultado resultado = (Resultado) session.getAttribute("resultado");    
            List<Pedido> pedidos = (List) resultado.getEntidades();
            String id_pedido = request.getParameter("p");
            String id_cliente = request.getParameter("u");
            Resultado resultado2 = (Resultado) request.getAttribute("resultado2");
		if(resultado2 == null) {
			response.sendRedirect(request.getContextPath() + "/adm/ListarPagamentoPedido?p="+id_pedido+"&acao=listar");
			return;
		}
%>
            
        <ul>
            <li>Cliente:   <%=id_cliente%>   </li>
            <li>Pedido: <%=id_pedido%>  </li>
            <li>Status do pedido:  </li>

        </ul>
        <h3>Itens do pedido</h3>
        <table border="1" class="highlight striped centered responsive-table">
            <thead>
                <tr>
                    <th>Imagem</th><th>Titulo do livro</th><th>Autor</th><th>Valor</th>
                </tr>
            </thead>
<%
                List<ItemPedido> itens = (List) resultado2.getEntidades();
                for(ItemPedido itemPedido: itens){
%>
            <tbody>
            <td><img src="../imagens/<%=itemPedido.getLivro().getImagem()%>"></td>
            <td><%=itemPedido.getLivro().getTitulo()%></td>
            <td><%=itemPedido.getLivro().getAutor()%></td>
            <td><%=itemPedido.getLivro().getPreco()%></td>
            


<%
                }
%>
           
            </tbody>     
        </table>
<br><br>
<a href="../Clientes/home.jsp">Voltar</a>

    </body>
</html>
