<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
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
    <h3>Categorias dos livros</h3>
    <body>
         <%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/ListarCategorias?acao=listar&status=1");
			return;
		}
                
                
                         List<Categoria> categorias = (List) resultado.getEntidades();
                         
                         if(categorias.size() == 0) {
                            out.print("<br><br>Nenhuma categoria cadastrada");
                        } else {
                     
        %>  
        
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
                    <%
                            for (Categoria cat : categorias) {  %>
                                <tr>
                                    <td><input type="radio" id="grupoLivro" required name='id' value=" <%= cat.getId() %> " /></td>
                                    <td> <%=cat.getNome()%></td>
                                    <td><a href="../Livros/preAlterarCategoria.jsp?id=<%=cat.getId()%>">Editar</a></td>
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
