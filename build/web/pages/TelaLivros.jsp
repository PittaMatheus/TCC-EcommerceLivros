<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="java.util.List"%>
<%@page import="livraria2019.dominio.EntidadeDominio" %>
<%@page import="livraria2019.dominio.livro.Livro" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tela de livros</title>
    </head>
    <body>
        <%String mensagem = (String)request.getAttribute("mensagem"); %>
        <%if(mensagem != null){out.print(mensagem); }%> <br>
        <a href="/Livraria-web/pages/FormLivro.jsp" id="linkCadastrarLivro">Cadastrar Livros</a>
        <h2>Listagem de Livros</h2>

        <form action="/Livraria-web/ConsultarLivro" method="post">
            <input type="text" name="txtConsulta" id="txtConsulta">
            <input type="submit" value="Consultar" id="btConsulta" /> 
            <input type="hidden" name="operacao" value="consultar" />
            

        </form>
        <br>
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
                <td><% out.write(LivroUtils.formatarPrecoLivro(l));%></td>
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
