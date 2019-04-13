<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorias</title>
    </head>
    <body>
        <h1>Categorias dos livros</h1>
          <% List<EntidadeDominio> categorias = (List<EntidadeDominio>) getServletContext().getAttribute("categorias"); %>
          
        <form action='DesativarCategoria'>
            <input type='submit' name="acao" value="desativar" />
            <br><br>
            <table border='1'>
                <thead>
                    <tr>
                        <th>#</th><th>Nome</th><th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(EntidadeDominio edCat:categorias){
                          Categoria categoria = (Categoria)edCat; %>
                        <tr>
                            <td><input type="radio" id="categoria" required name='id' value=" <%= categoria.getId() %> " /></td>
                            <td> <%=categoria.getNome()%></td>
                            <td><a href="preAlterarCategoria.jsp?id=<%=categoria.getId()%>">Editar</a></td>
                        </tr>
                      <%}%>
                </tbody>
            </table>
        </form>
                <br>
                <a href="../Clientes/home.jsp">Voltar</a>
         
          
          
          
    </body>
</html>
