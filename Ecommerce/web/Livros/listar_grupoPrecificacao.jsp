<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.GrupoLivro"%>
<%@page import="ecommerce.dominio.livro.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Grupo de precificação</title>
    </head>
    <body>
        <h1>Grupo de precificação dos livros</h1>
        <%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/ListarGrupoLivros?acao=listar&status=1");
			return;
		}
                
                
                         List<GrupoLivro> gruposLivros = (List) resultado.getEntidades();
                         
                         if(gruposLivros.size() == 0) {
                            out.print("<br><br>Nenhum grupo de precificação cadastrado");
                        } else {
                     
        %>  
        
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
                    <%
                            for (GrupoLivro grupoLivro : gruposLivros) {  %>
                                <tr>
                                    <td><input type="radio" id="grupoLivro" required name='id' value=" <%= grupoLivro.getId() %> " /></td>
                                    <td> <%=grupoLivro.getNome()%></td>
                                    <td> <%=grupoLivro.getMargemLucro()%></td>
                                    <td><a href="../Livros/preAlterarGrupoLivro.jsp?id=<%=grupoLivro.getId()%>">Editar</a></td>
                                </tr>
                      <%}%>
                            <% }
                                                
                    %>
                </tbody>
            </table>
        </form>
                <br>
                <a href="../Clientes/home.jsp">Voltar</a>
         
          
          
          
    </body>
</html>
