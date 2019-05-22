<%-- 
    Document   : carrinhoSessao
    Created on : May 22, 2019, 1:22:28 PM
    Author     : matheus
--%>

<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.pedido.Carrinho"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrinho</title>
    </head>
    <body>
<%           
            double valorTotal = 0;
            Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
            if(carrinho == null){
                out.println("Não há livros no carrinho");
                out.println("<br><a href='../index.jsp'>Adicionar livros</a>");
            }else{
            %>
            <h1>Carrinho</h1>
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
                            for(Livro livro : carrinho.getLivs()){
                                %>
                    <tr>
                        
                        <td><%=livro.getTitulo()%></td>
                        <td><%=livro.getAutor()%></td>
                        <td><%=livro.getAno()%></td>
                        <td><%=livro.getEdicao()%></td>
                        <td><%=livro.getPreco()%></td>
                        <td><a href="">Remover</a></td>
                    </tr>
<%                      
                        valorTotal += livro.getPreco();
                             }
                        
%>
        </table>
        <hr>
        
        <%
            
            out.println("Preco total: " + LivroUtils.formatarPreco(valorTotal));
        }
        
        %>
        <br><br>
        <form action="confirmaValorTotal.jsp" method="GET">
            <input type="hidden" name="id_usuario" id="id_usuario" value="">
            <input type="hidden" name="valorTotal" value="<%= valorTotal %>">
            
            <input type="submit" value="Realizar pedido"> 
        </form>
        <br><br><br>
        <a href="../index.jsp">Voltar</a>
    </body>
</html>
