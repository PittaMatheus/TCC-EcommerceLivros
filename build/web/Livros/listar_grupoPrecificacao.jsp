<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.GrupoLivro"%>
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
        <h1>Grupo de precificação dos livros</h1>
          <% List<EntidadeDominio> grupoLivros = (List<EntidadeDominio>) getServletContext().getAttribute("grupoLivros"); %>
          
        <form action='DesativarGrupo'>
            <input type='submit' name="acao" value="desativar" />
            <br><br>
            <table border='1'>
                <thead>
                    <tr>
                        <th>#</th><th>Nome</th><th>Margem de lucro %</th><th>Ação</th>
                    </tr>
                </thead>
                <tbody>
                    <%for(EntidadeDominio gruLiv : grupoLivros){
                          GrupoLivro grupoLivro = (GrupoLivro)gruLiv; %>
                        <tr>
                            <td><input type="radio" id="grupoLivro" required name='id' value=" <%= grupoLivro.getId() %> " /></td>
                            <td> <%=grupoLivro.getNome()%></td>
                            <td> <%=grupoLivro.getMargemLucro()%></td>
                            <td><a href="preAlterarGrupoLivro.jsp?id=<%=grupoLivro.getId()%>">Editar</a></td>
                        </tr>
                      <%}%>
                </tbody>
            </table>
        </form>
                <br>
                <a href="../Clientes/home.jsp">Voltar</a>
         
          
          
          
    </body>
</html>
