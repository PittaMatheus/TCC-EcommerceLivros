<%-- 
    Document   : preAlterar_estoqueLivro
    Created on : 22/05/2019, 10:53:03
    Author     : bocao
--%>

<%@page import="ecommerce.dominio.estoque.Estoque"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="ecommerce.dominio.estoque.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            List<Fornecedor> fornecedores = (List<Fornecedor>) getServletContext().getAttribute("fornecedor");
            List<Livro> livros = (List<Livro>) getServletContext().getAttribute("livros");
            Resultado resultado = (Resultado) request.getAttribute("resultado");
            
            String id = request.getParameter("id");    
            //String mensagem = resultado.getMensagem();
            
            if(resultado == null) {
                response.sendRedirect(request.getContextPath() + "/Estoque/PreAlterarEstoque?acao=consultarPorID&id=" + id);
                return;
            }
            
            
            List<Estoque> estoques = (List) resultado.getEntidades();
            if(estoques.size() == 0){
                out.println("Error");
            }else{
                for (Estoque estoque : estoques) {
                    Fornecedor forn = (Fornecedor) fornecedores.get(estoque.getItem().getFornecedor().getId() -1);
                    Livro liv = (Livro) livros.get(estoque.getItem().getLivro().getId() -1);
                          

	%>

       
        <h3>Editar livro</h3>
        <form action="AlterarEstoque">
        
            <% 
                

                if (resultado.getMensagem() != null) {
                    out.println(resultado.getMensagem());
                 %> 
                    <br>
                <%}%>
        
            <input type="hidden" id="id" name="id" value="<%=estoque.getId()%>"/>
            <input type="hidden" id="id" name="idLivro" value="<%=liv.getId()%>"/>
            <input type="hidden" id="id" name="idFornecedor" value="<%=forn.getId()%>"/>
            
            <label for="txtTituloLivro">Título do livro:</label> 
            <input type="text" id="txtTituloLivro" value="<%=liv.getTitulo()%>" name="txtTituloLivro" /> <br> 

            <label for="txtFornecedor">Nome fornecedor:</label> 
            <input type="text" id="txtFornecedor" value="<%=forn.getNome()%>"name="txtFornecedor" /> <br> 

            <label for="txtCnpj">CNPJ:</label> 
            <input type="text" id="txtCnpj" value="<%=forn.getCnpj()%>" name="txtCnpj" /> <br> 

            <label for="txtRazaoSocial">Razao social:</label>
            <input type="text" id="txtRazaoSocial" value="<%=forn.getRazaoSocial()%>" name="txtRazaoSocial" /> <br>

            <label for="txtValorCusto">Preco de custo:</label> 
            <input type="text" value="<%=estoque.getItem().getCusto()%>"id="txtValorCusto" name="txtValorCusto" /> <br>

            <label for="txtQuantidade">Quantidade:</label> 
            <input type="text" id="txtQuantidade"  value="<%=estoque.getItem().getQuantidade()%>" name="txtQuantidade" /> <br>
            
            <br><br>
       <%  } %>
       
            <input type="submit" name="acao" value="alterar" class="btn btn-success">   
        </form>
        <br>
        <a href='../Estoque/listar_estoqueLivros.jsp'>Voltar</a>
       <%}%>
       
    </body>
</html>