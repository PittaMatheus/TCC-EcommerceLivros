<%-- 
    Document   : detalheItem
    Created on : Apr 30, 2019, 9:28:59 AM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhe item</title>
    </head>
    <body>
        <h1>Detalhes</h1>
        <%
           

            int id_livro = Integer.parseInt(request.getParameter("l"));
            String id_usuario = request.getParameter("u");
            

             List<EntidadeDominio> livros = (List<EntidadeDominio>) getServletContext().getAttribute("livros"); 
                      
                   for(EntidadeDominio liv :livros){
                        Livro livro = (Livro)liv; 
                        if(id_livro == livro.getId()){
        %>
                            <fieldset style="width:200px">
                                <div id="texto-livros">
                                    <h4> <%=livro.getTitulo()%></h4>
                                    <li class="livro"><%=livro.getAutor()%></li>
                                    <li><%=livro.getSinopse()%></li>
                                    <li>R$ <%=livro.getPreco()%> </li>
                                    <li>Paginas: <%= livro.getNumeroPaginas()%></li>
                                    <li>Paginas: <%= livro.getCategorias() %></li>
                                    <hr>
                                    <h4>Dimensões</h4>
                                    <li>Altura(cm): <%= livro.getDimensoes().getAltura() %> </li>
                                    <li>Peso(g): <%= livro.getDimensoes().getPeso()%> </li>
                                    <li>Profundidade(cm): <%= livro.getDimensoes().getProfundidade()%> </li>
                                    <li>largura(cm): <%= livro.getDimensoes().getLargura() %> </li>
                                    
                                    
                                </div>
                            </fieldset>
                                    
                                    
                                    
                                    
                                   
        <%
                        }
                    }



            if(session.getAttribute("usuarioLogado") == null){
               %>
                <a href="">Adicionar ao carrinho via sessao</a>
        <%
           }else if(session.getAttribute("usuarioLogado") != null){
               Resultado resultado = (Resultado) session.getAttribute("usuarioLogado");    
                List<Cliente> clientes = (List) resultado.getEntidades();
                        if(resultado != null) {
                             if(clientes.size() == 0) {
                                response.sendRedirect("../login.jsp");
                            } else {
                               for (Cliente cliente : clientes) {         
                                %>
                                <a href="../Pedidos/add_carrinho.jsp?l=<%=id_livro%>&u=<%=id_usuario%>">Adicionar ao carrinho</a>
                   
        <%
                }
            }
        }
    }



        %>
        <br><br>
        <a href="../Livros/prateleira.jsp">Voltar</a>
    </body>
</html>
