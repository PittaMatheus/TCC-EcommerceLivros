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
         <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
    <!-- NAV FIXO DO TOPO-->
    
                            <div class="navbar-fixed indigo darken-4">
                                <nav>
                                    <div class="nav-wrapper indigo darken-4">
                                      <a href="#" class="brand-logo center maiusculo">Itens do pedido</a>
                                      <ul class="left">
                                          
                                          <%
    if(papel == 1){
%>
        <li><a href="../Clientes/listar_meusPedidos.jsp"><i class="material-icons">arrow_back</i></a></li>
<%    
   }
    else if(papel == 2){
    %>
    
        <li><a href="../adm/listar_pedidos.jsp"><i class="material-icons">arrow_back</i></a></li>
<%
    }
%>
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                          
                                      </ul>
                                    </div>
                                  </nav>
                            </div>        
        <ul>
            <li>Pedido: <%=id_pedido%>  </li>

        </ul>
        <h3>Itens do pedido</h3>
        <table border="1" class="highlight striped centered responsive-table">
            <thead>
                <tr>
                    <th>Imagem</th><th>Titulo do livro</th><th>Autor</th><th>Quantidade</th><th>Valor</th>
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
            <td><%=itemPedido.getQuantidade()%></td>
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


    </body>
</html>
