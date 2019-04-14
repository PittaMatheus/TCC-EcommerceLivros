<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.GrupoLivro"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% List<EntidadeDominio> gruposLivro = (List<EntidadeDominio>) getServletContext().getAttribute("grupoLivros"); 
           int id = Integer.parseInt(request.getParameter("id"));
           
        %>
        <h1>Editar grupo de precificação</h1>
        <form action='AlterarGrupoLivro' method='POST'>
            <% for(EntidadeDominio edGrupoLivro: gruposLivro){
                    GrupoLivro grupoLivro = (GrupoLivro)edGrupoLivro;
                    if(grupoLivro.getId().equals(id)){ %>
                        <input type="hidden" name="id" id="id" value="<%=grupoLivro.getId()%>" />
                        <label for="nome">Nome do grupo de precificação do livro: </label> 
                        <input type="text" id="nomeCategoria" value="<%=grupoLivro.getNome() %>" name="nomeGrupo" /> <br>
                        <br>
                        <label for="margemLucro">Margem de lucro do grupo(%): </label> 
                        <input type="text" id="margemLucro" value="<%=grupoLivro.getMargemLucro()%>" name="margemLucro" /> <br>
                <% }
            }%>
            <br>
            <input type="submit" name="acao" value="alterar" placeholder="SALVAR" id="btAlterar"/>
        </form>
    </body>
    <br><br>
    <a href="listar_categorias.jsp">Voltar</a>
</html>
