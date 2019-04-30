<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="ecommerce.dominio.pedido.Carrinho"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho</title>
    </head>
    <body>
        <h3>Carrinho de livros</h3>

        <%
            double preco = 0;
            Livro livro = new Livro();
            String id_usuario = request.getParameter("u");
            Resultado resultado = (Resultado) request.getAttribute("resultado");
            if(resultado == null) {
                    response.sendRedirect(request.getContextPath() + "/Pedidos/VerCarrinho?acao=consultarPorID&u=" + id_usuario);
                    return; 
                }
            List<Carrinho> carrinhos = (List) resultado.getEntidades();
                         
                         if(carrinhos.size() == 0) {
                            out.print("<br><br>Carrinho vazio");
                        } else { %>
            <form action='LimparCarrinho'>
             <br>
                <button name="acao" value="desativar">Limpar carrinho</button>
                <br><br>
                 <table border="1" style ="width: 50%">
                        <tr>
                            <th>Título</th>
                            <th>Autor</th>
                            <th>Ano</th>
                            <th>Edição</th>
                            <th>Preço</th>
                            <th>Ação</th>
                       </tr>   
                           <%
                             for (Carrinho carrinho : carrinhos) {
                                %>
                    <tr>
                        
                        <td><%=carrinho.getLivro().getTitulo()%></td>
                        <td><%=carrinho.getLivro().getAutor()%></td>
                        <td><%=carrinho.getLivro().getAno()%></td>
                        <td><%=carrinho.getLivro().getEdicao()%></td>
                        <td><%=carrinho.getLivro().getPreco()%></td>
                        <td><a href="RemoverCarrinho?l=<%=carrinho.getLivro().getId()%>&u=<%=carrinho.getCliente().getId()%>&acao=desativar">Remover</a></td>
                    </tr>
<%                      
                        preco = carrinho.getSubTotal();
                             }
                         }
%>
        </table>
        <hr>
        
        <%
            livro.setPreco(preco);
        out.println("Preco total: " + LivroUtils.formatarPrecoLivro(livro));
        
        
        %>
    </form>
        <br><br>
        <form action="confirmaEndereco.jsp">
            <input type="hidden" name="id" id="id_usuario" value="<%=id_usuario%>">
            <input type="submit" value="Realizar pedido"> 
        </form>
           
        <br><br>
        
        
        <a href="../Clientes/home.jsp">Voltar</a>




    </body>
</html>
