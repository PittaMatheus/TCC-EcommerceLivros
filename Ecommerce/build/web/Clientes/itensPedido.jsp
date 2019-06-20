<%-- 
    Document   : itensPedido
    Created on : May 30, 2019, 8:32:08 PM
    Author     : matheus
--%>

<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="ecommerce.dominio.pedido.ItemPedido"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Itens do meu pedido</title>
    </head>
    <body>
<%          
        Livro livro = new Livro();
        int id_cliente = 0;
        int papel = 0;
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
             Resultado resultado = (Resultado) session.getAttribute("resultado");    
            List<Pedido> pedidos = (List) resultado.getEntidades();
            String id_pedido = request.getParameter("p");
            Resultado resultado2 = (Resultado) request.getAttribute("resultado2");
		if(resultado2 == null) {
			response.sendRedirect(request.getContextPath() + "/adm/ListarItemPedido?p="+id_pedido+"&acao=listar");
			return;
		}
%>
            
        <ul>
            <li>Pedido: <%=id_pedido%>  </li>

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
            <td><img width="70" src="../imagens/<%=itemPedido.getLivro().getImagem()%>"></td>
            <td><%=itemPedido.getLivro().getTitulo()%></td>
            <td><%=itemPedido.getLivro().getAutor()%></td>
            <%livro.setPreco(itemPedido.getLivro().getPreco());
              livro.getGrupoLivro().setMargemLucro(itemPedido.getLivro().getGrupoLivro().getMargemLucro());
            %>
            <td><%=LivroUtils.formatarPreco(LivroUtils.calcularPrecoLivro(livro))%></td>
            


<%
                }
%>
           
            </tbody>     
        </table>
<br><br>
<%
    if(papel == 1){
%>
<a href="../Clientes/listar_meusPedidos.jsp">Voltar</a>
<%    
   }
    else if(papel == 2){
    %>
    <a href="../adm/listar_pedidos.jsp">Voltar</a>

<%
    }
%>

    </body>
</html>
