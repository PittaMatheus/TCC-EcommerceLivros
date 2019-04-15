<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
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
       
        <%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/PreAlterarGrupoLivro?acao=consultarPorID&id=" + id);
			return;
		}

                         List<GrupoLivro> grupoLivros = (List) resultado.getEntidades();
                         
                         if(grupoLivros.size() == 0) {
                            out.print("Erro");                   
                        } else { 

                             %>
            <h1>Editar grupo de precificação</h1>
        <%
                            for (GrupoLivro grupLivro : grupoLivros) {
	%>
            <form action='AlterarGrupoLivro' method='POST'>
                <input type="hidden" name="id" id="id" value="<%=grupLivro.getId()%>" />
                <label for="nome">Nome do grupo de precificação do livro: </label> 
                <input type="text" id="nomeCategoria" value="<%=grupLivro.getNome() %>" name="nomeGrupo" /> <br>
                <br>
                <label for="margemLucro">Margem de lucro do grupo(%): </label> 
                <input type="text" id="margemLucro" value="<%=grupLivro.getMargemLucro()%>" name="margemLucro" /> <br>
                <% }
            }%>
            <br>
            <input type="submit" name="acao" value="alterar" placeholder="SALVAR" id="btAlterar"/>
        </form>
    </body>
    <br><br>
    <a href="listar_grupoPrecificacao.jsp">Voltar</a>
</html>
