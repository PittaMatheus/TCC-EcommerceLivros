<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Livro"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela de livros</title>
    </head>
    <body>
        
        <%
      		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/ListarLivros?acao=listar&status=1");
			return;
		}
	%>
        
        
        <h4>Livros</h4>
        <table border="1" style ="width: 50%">
        <tr>

            <th>Código barra</th>
            <th>Título</th>
            <th>Autor</th>
            <th>Ano</th>
            <th>Editora</th>
            <th>ISBN</th>
            <th>Preco Revenda</th>
            <th>Status</th>
            <th>Ação</th>
            
        </tr>
        <%
         List<Livro> livros = (List) resultado.getEntidades();
                         
                         if(livros.size() == 0) {
                            out.print("<br><br>Nenhum cliente cadastrado");
                        } else {
                              for (Livro livro : livros) {
                     %>
            <tr>

                <td><%=livro.getCodigoBarras()%></td>
                <td><%=livro.getTitulo()%></td>
                <td><%=livro.getAutor()%></td>
                <td><%=livro.getAno()%></td>
                <td><%=livro.getEditora().getNome()%></td>
                <td><%=livro.getIsbn().getCodBarras()%></td>

                <td><a href="/Livraria-web/VisualizarLivro?operacao=consultar&id=<% out.print(livro.getId()); %>" id="linkVisualizar<%=livro.getCodigoBarras()%>">Visualizar</a></td>
                
            </tr>
        <% }} %>
        </table>
        
         <a href='../Clientes/home.jsp'>Voltar</a>
    </body>
</html>
