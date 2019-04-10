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
        
        %>
       
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

        <%List<Livro> livros = (List<Livro>)request.getAttribute("livros");%> 
        <%for(EntidadeDominio ed:livros){
            Livro l = (Livro) ed;
        %>
            <tr>

                <td><%=l.getCodigoBarras()%></td>
                <td><%=l.getTitulo()%></td>
                <td><%=l.getAutor()%></td>
                <td><%=l.getAno()%></td>
                <td><%=l.getEditora().getNome()%></td>
                <td><%=l.getIsbn().getCodBarras()%></td>
                <td><% /* out.write(LivroUtils.formatarPrecoLivro(l))*/;%></td>
                <td><% if(l.getAtivo()){
                        out.print("Ativo");
                }else{
                        out.print("Inativo");}%></td>
                <td><a href="/Livraria-web/VisualizarLivro?operacao=consultar&id=<% out.print(l.getId()); %>" id="linkVisualizar<%=l.getCodigoBarras()%>">Visualizar</a></td>
                
            </tr>
        <% } %>
        </table>	
    </body>
</html>
