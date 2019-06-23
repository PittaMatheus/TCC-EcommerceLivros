<%-- 
    Document   : entrada_estoqueLivro
    Created on : 16/05/2019, 12:12:57
    Author     : bocao
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="ecommerce.dominio.estoque.Estoque"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Import Google Icon Font-->
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
        <title>Entrada estoque livro</title>
    </head>
    <body>
        <%
        List<EntidadeDominio> livros = (List<EntidadeDominio>) getServletContext().getAttribute("livros");
        List<EntidadeDominio> estoques = (List<EntidadeDominio>) getServletContext().getAttribute("estoque");
        Resultado resul = (Resultado) request.getAttribute("resultado");
        if(!livros.isEmpty()){
        %>
        <div class="conteiner">
        <form action="InserirEstoque" method="POST">
                 <h2>Entrada estoque Livro</h2>
                 <% 
                    String mensagem = (String) request.getAttribute("mensagem");

                    if (mensagem != null) {
                        out.println(mensagem);
                 %> 
                        <br>
                    <%}%>
                
                <br>
                
                
                        <%  if(!estoques.isEmpty()){
                                List<Livro> livros1 = new ArrayList<Livro>();
                                Livro livro = new Livro();
                                Estoque estoque = new Estoque();

                                for(EntidadeDominio entEstoque : estoques){
                                    estoque = (Estoque) entEstoque;
                                    for(EntidadeDominio entLivro : livros){
                                        livro = (Livro) entLivro;
                                        if(estoque.getItem().getLivro().getId().equals(livro.getId())){
                                            livros1.add((Livro)entLivro);
                                        }
                                    }
                                }
                                livros.removeAll(livros1); %>
                                <label>Titulo do livro:</label> 
                                <select name="idLivro" id="cbTitulo">
                                    <option value="">Selecione um livro...</option> 
                                    <%for(EntidadeDominio li : livros){
                                        Livro liv = (Livro) li; %>
                                       <option id ="cbTitulo<%=liv.getId()%>"value="<%=liv.getId()%>"><%=liv.getTitulo()%></option>
                                    <%}%>
                                </select>
                            <%}else{%>
                                <label>Titulo do livro:</label> 
                                <select name="idLivro" id="cbTitulo">
                                    <option value="">Selecione um livro...</option> 
                                    <%for(EntidadeDominio edLivro:livros){
                                        Livro livro = (Livro)edLivro; %>
                                        <option id ="cbTitulo<%=livro.getId()%>"value="<%=livro.getId()%>"><%=livro.getTitulo()%></option>
                            <%  
                                    }%>
                                </select>
                            <%}%>	
                

                 <br>
                 
                 <label for="txtFornecedor">Nome fornecedor:</label> 
                 <input type="text" id="txtFornecedor" value="RS livros" name="txtFornecedor" /> <br> 

                 <label for="txtCnpj">CNPJ:</label> 
                 <input type="text" id="txtCnpj" value="78.180.862/0001-30"name="txtCnpj" /> <br> 

                 <label for="txtRazaoSocial">Razão social:</label> 
                 <input type="text" id="txtRazaoSocial" value="Cia dos Livros ltda" name="txtRazaoSocial" /> <br> 

                 <label for="txtQuantidade">Quantidade:</label>
                 <input type="text"  value="20"id="txtQuantidade" name="txtQuantidade" /> <br>

                 <br> 
                 <input type="submit" name="acao" value="inserir" placeholder="SALVAR" id="btSalvar"/>
                 
             </form>
                <a href='${pageContext.request.contextPath}/Clientes/home.jsp'>Voltar</a>
            <%}else{%>
                <h1>Você não possui mas nehuma entrada de livro no estoque,  </h1>
                <h1>volte ao menu principal!</h1>
                <a href='${pageContext.request.contextPath}/Clientes/home.jsp'>Voltar</a>
            <%}%>
            </div>
    </body>
</html>