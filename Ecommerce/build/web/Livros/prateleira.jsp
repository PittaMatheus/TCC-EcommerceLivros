<%-- 
    Document   : prateleira
    Created on : Apr 20, 2019, 7:25:08 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prateleira</title>

    </head>
  
    <body>
      <% if(session.getAttribute("usuarioLogado") == null){
                response.sendRedirect("../login.jsp");
            }else if(session.getAttribute("usuarioLogado") != null){
                Resultado resultado = (Resultado) session.getAttribute("usuarioLogado");    
                List<Cliente> clientes = (List) resultado.getEntidades();
                        if(resultado != null) {
                             if(clientes.size() == 0) {
                                response.sendRedirect("../login.jsp");
                            } else {
                               for (Cliente cliente : clientes) {         
                                  %>
        <br><br><br>

        <h2>Livros</h2>
                    <% List<EntidadeDominio> livros = (List<EntidadeDominio>) getServletContext().getAttribute("livros"); 
                       String st = request.getParameter("st");
                       if(null != st && st.equals("sucess")){
                        %>
                        Adicionado ao carrinho
                    <%
                       }
                   for(EntidadeDominio liv :livros){
                                Livro livro = (Livro)liv; %>
                <fieldset style="width:150px">
                <div id="texto-livros">
                    <h4> <%=livro.getTitulo()%></h4>
                  <li class="livro"><%=livro.getAutor()%></li>
                  <li><%=livro.getSinopse()%></li>
                  <a href="carrinho.jsp?l=<%=livro.getId()%>&u=<%=cliente.getId()%>">Add</a>
                </div>
                </fieldset>
                            <%}
             }
    }
}
         }%>
        </div>
    </body>
</html>
