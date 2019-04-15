<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria"%>
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
			response.sendRedirect(request.getContextPath() + "/Livros/PreAlterarCategoria?acao=consultarPorID&id=" + id);
			return;
		}

                         List<Categoria> categorias = (List) resultado.getEntidades();
                         
                         if(categorias.size() == 0) {
                            out.print("Erro");                   
                        } else { 

                             %>
            <h1>Editar Categoria</h1>
        <%
                            for (Categoria cat : categorias) {
	%>
            <form action='AlterarCategoria' method='POST'>
                <input type="hidden" name="id" id="id" value="<%=cat.getId()%>" />
                <label for="nome">Categoria </label> 
                <input type="text" id="categoria" value="<%=cat.getNome() %>" name="nomeCategoria" /> <br>
                <br>
                <% }
            }%>
            <br>
            <input type="submit" name="acao" value="alterar" placeholder="SALVAR" id="btAlterar"/>
        </form>
    </body>
    <br><br>
    <a href="listar_categorias.jsp">Voltar</a>
</html>
