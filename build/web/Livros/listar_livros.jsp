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
        
        
        <h4>Livros ativos</h4>
       
        <%
         List<Livro> livros = (List) resultado.getEntidades();
                         
                         if(livros.size() == 0) {
                            out.print("<br><br>Nenhum livro cadastrado");
                 }else {
        %> 
         <table border="1" style ="width: 50%">
        <tr>
            <th>Código barra</th>
            <th>Título</th>
            <th>Autor</th>
            <th>Ano</th>
            <th>Editora</th>
            <th>ISBN</th>
            <th>Altura</th>
            <th>Largura</th>
            <th>Peso</th>
            <th>Profundidade</th>
            <th>Grupo de precificação</th>
            <th>Margem de lucro</th>
            <th>Preco de custo</th>
            <th>Preco de revenda</th>
            <th>Lucro</th>  
            <th>Ação</th>
        </tr>       
        <%
                            
                        
                              for (Livro livro : livros) {
                     %>
    
        <tr>
            <td><%=livro.getCodigoBarras()%></td>
            <td><%=livro.getTitulo()%></td>
            <td><%=livro.getAutor()%></td>
            <td><%=livro.getAno()%></td>
            <td><%=livro.getEditora().getNome()%></td>
            <td><%=livro.getIsbn().getCodBarras()%></td>
            <td><%=livro.getDimensoes().getAltura()%></td>
            <td><%=livro.getDimensoes().getLargura()%></td>
            <td><%=livro.getDimensoes().getPeso()%></td>
            <td><%=livro.getDimensoes().getProfundidade()%></td>
            <td><%=livro.getGrupoLivro().getNome()%></td>
            <td><%=livro.getGrupoLivro().getMargemLucro()%>%</td>
            <td><%=livro.getPreco()%></td>
            <td><%=livro.getPreco() + (livro.getPreco() * (livro.getGrupoLivro().getMargemLucro()/100))%></td>
            <td><%=(livro.getPreco() + (livro.getPreco() * (livro.getGrupoLivro().getMargemLucro()/100)))  -   (livro.getPreco())%></td>
            <td><a href="preAlterar_livro.jsp?id=<% out.print(livro.getId()); %>">Editar</a></td>
            </tr>
        <% }} %>
        </table>
        <br><br>
         <a href='../Clientes/home.jsp'>Voltar</a>
    </body>
</html>
