<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="ecommerce.dominio.estoque.Fornecedor"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="ecommerce.dominio.estoque.Estoque"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Resultado resultado = (Resultado) request.getAttribute("resultado");
        
        List<Livro> livros = (List<Livro>) getServletContext().getAttribute("livros");
        List<Fornecedor> fornecedores = (List<Fornecedor>) getServletContext().getAttribute("fornecedor");
        
        if(resultado == null || livros.size() == 0 || fornecedores.size() == 0) {
            response.sendRedirect(request.getContextPath() + "/Estoque/ListarEstoqueLivros?acao=listar");
            return;
        }
	%>
        <h4>Listar estoque de livros</h4>
        <form action="AlterarEstoque" method="POST">
            <%
         
         List<Estoque> estoques = (List) resultado.getEntidades();
         
         if(estoques.size() == 0) {
            out.print("<br><br>Nenhum estoque de livro foi cadastrado");
         }else {
        %> 
        <table border="1" style ="width: 100%">
        <tr>
            <th>Título do livro</th>
            <th>Nome fornecedor</th>
            <th>CNPJ</th>
            <th>Razao social</th>
            <th>Preco de custo</th>
            <th>Data de entrada</th>
            <th>Quantidade</th>
            <th>Alterar a Quantidade</th>
        </tr> 
        <%
            
            for(Estoque est: estoques){
                Estoque estoque = (Estoque) est;
                int i = estoque.getItem().getLivro().getId();
                int j = estoque.getItem().getFornecedor().getId();
               
                
                
                %>
            <tr>
                <td><%=livros.get(i-1).getTitulo()%></td>
                <td><%=fornecedores.get(j-1).getNome()%></td>
                <td><%=fornecedores.get(j-1).getCnpj()%></td>
                <td><%=fornecedores.get(j-1).getRazaoSocial()%></td>
                <td><%=estoque.getItem().getCusto()%></td>
                <td><%out.print(FormatadorData.formatarData(estoque.getDataCadastro()));%></td>
                <%if(estoque.getItem().getQuantidade() == 0){%>
                    <td bgcolor="RED"><%=estoque.getItem().getQuantidade()%></td>
                <%}else{%>
                    <td><%=estoque.getItem().getQuantidade()%></td>
                <%}%>
                <td><a href="preAlterar_estoqueLivro.jsp?id=<% out.print(estoque.getId()); %>">Editar Quantiadade</a></td>
            </tr>
            <%}
         }%>
        </table>
        </form>
        <br><br>
        <a href='../Clientes/home.jsp'>Voltar</a>
        
    </body>
</html>