<%@page import="ecommerce.dominio.livro.GrupoLivro"%>
<%@page import="ecommerce.dominio.livro.Categoria"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de livros</title>
    </head>
    <body>
       <%
        List<EntidadeDominio> categorias = (List<EntidadeDominio>) getServletContext().getAttribute("categorias");
        List<EntidadeDominio> grupoLivros = (List<EntidadeDominio>) getServletContext().getAttribute("grupoLivros");
        %>
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <form action="InserirLivro" method="POST">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Cadastrar novo livro</a>
                  <ul id="nav-mobile" class="right">      
                      <li><button type="submit" name="acao" value="inserir" placeholder="SALVAR" id="btSalvar" class="btn-border"><i class='material-icons left'>done</i>Cadastrar livro</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="${pageContext.request.contextPath}/Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
        <br> <br> <br>
        <div class ="container row">
        <!-- /Livros/InserirLivro?txtCodigo=20&txtAutor=autor+teste&txtTitulo=titulo+teste&txtAno=02%2F02%2F1999&txtEdicao=2&txtNumPaginas=222&txtSinopse=Esse+exemplo+da+sinopse+de+um+livro&txtEditora=Abril&txtAltura=20&txtLargura=14&txtPeso=1.50&txtProfundidade=4&txtIsbn=2423432&txtPreco=49.99&categoria=9&grupoLivro=&acao=inserir -->
               
                 <% 
                    String mensagem = (String) request.getAttribute("mensagem");

                    if (mensagem != null) {
                         out.println("<div><h5 class='forma_redonda_vermelho  negrito center'>Atenção com os campos</h5><div class='card-panel grey lighten-2'>");
                         out.println(mensagem);
                         out.println("</div></div><br>");
                 %>      
                       
                    <%}%>

                <h5 class="forma_redonda negrito center">Preencha as informações do livro</h5>
                <br>
                 <div class="input-field col s2">
                    <label for="txtCodigo">Código:</label> 
                    <input type="text" id="txtCodigo" value="20" name="txtCodigo">
                 </div>
                 
                 <div class="input-field col s10">
                    <label for="txtAutor">Autor:</label> 
                    <input type="text" id="txtAutor" value="autor teste"name="txtAutor">
                </div>

                 <div class="input-field col s4">
                    <label for="txtTitulo">Título:</label> 
                    <input type="text" id="txtTitulo" value="titulo teste" name="txtTitulo">
                 </div>
                 
                <div class="input-field col s3">
                    <label for="txtAno">Ano:</label>
                    <input type="text" id="txtAno" value="02/02/1999" name="txtAno">
                </div>
                 
                <div class="input-field col s2">
                    <label for="txtEdicao">Edição:</label> <input type="text" value="2" id="txtEdicao" name="txtEdicao">
                </div>
                 
                 <div class="input-field col s3">
                    <label for="txtNumPaginas">Número de páginas:</label>
                    <input type="text" id="txtNumPaginas"  value="222" name="txtNumPaginas">
                </div>
                 
                <div class="input-field col s10">
                    <label for="txtSinopse">Sinopse:</label> 
                    <input type="text" id="txtSinopse"  value="Esse exemplo da sinopse de um livro" name="txtSinopse">
                </div>
                 
                <div class="input-field col s2">
                    <label for="txtEditora">Editora:</label> 
                    <input type="text"  value="Abril"id="txtEditora" name="txtEditora">
                </div>
                 
                 <div class="input-field col s3">
                    <label for="txtAltura">Altura:</label>
                    <input type="text"  value="20"id="txtAltura" name="txtAltura">
                 </div>
                 
                 <div class="input-field col s3">
                    <label for="txtLargura">Largura:</label> 
                    <input type="text" value="14" id="txtLargura" name="txtLargura">
                </div>
                 
                 <div class="input-field col s3">
                    <label for="txtPeso">Peso:</label>
                    <input type="text" value="1.50" id="txtPeso" name="txtPeso">
                </div>

                 <div class="input-field col s3">
                    <label for="txtProfundidade">Profundidade:</label>
                    <input type="text" value="4" id="txtProfundidade" name="txtProfundidade">
                 </div>

                <div class="input-field col s6">
                    <label for="txtIsbn">ISBN:</label>
                    <input type="text" value="2423432"id="txtIsbn" name="txtIsbn">
                </div> 
                 
                 <div class="input-field col s6">
                    <label for="txtPreco">Preço:</label> 
                    <input type="text" value="49.99" id="txtPreco" name="txtPreco">
                 </div>

                <div class="input-field col s12">
                    <label>Grupo de Precificação:</label>
                    <select name="grupoLivro" id="cbPrecificacao">
                    <option value="">Selecione um grupo...</option>
                        <%for(EntidadeDominio edGrupo:grupoLivros){
                            GrupoLivro grupoLivro = (GrupoLivro)edGrupo;%>
                    <option id ="cbPrecificacao<%=grupoLivro.getId()%>" value='"<%=grupoLivro.getId()%>"'><%=grupoLivro.getNome()%></option>
                        <%}%>	
                    </select>
                 </div>
            </div>
            <div class ="container row">
                 <h5 class="forma_redonda negrito center">Informe as categorias do livro</h5>
                 <%for(EntidadeDominio edCat:categorias){
                     Categoria categoria = (Categoria)edCat; %>
                     <div class="col s3">
                        <input type="checkbox" name="categoria" id ='"categoria<%=categoria.getNome()%>"' value="<%=categoria.getId()%>">
                        <label for='"categoria<%=categoria.getNome()%>"'><%=categoria.getNome()%></label>
                     </div>
                 <%}%>
        </div>
                 </form>
             
        <br><br><br> 
         <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../js/materialize.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    </body>
</html>
