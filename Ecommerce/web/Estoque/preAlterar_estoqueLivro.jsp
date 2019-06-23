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
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
         <!-- CSS CAROUSEL-->
         <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css" media="screen,projection"/>
         <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css" media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
                                    <!-- NAV FIXO DO TOPO-->
                            <div class="navbar-fixed indigo darken-4">
                                <nav>
                                    <div class="nav-wrapper indigo darken-4">
                                      <a href="#" class="brand-logo center maiusculo">Editar estoque do livro</a>
                                      <ul class="left">
                                          <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                                      </ul>
                                    </div>
                                  </nav>
                            </div>
        <div class="conteiner center">
       
            <br><br>
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
       </div>
    </body>
</html>