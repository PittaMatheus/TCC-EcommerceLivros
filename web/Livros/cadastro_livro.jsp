<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.GrupoLivro"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Livro"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import ="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de livros</title>
    </head>
    <body>
       <%
        List<EntidadeDominio> categorias = (List<EntidadeDominio>) getServletContext().getAttribute("categorias");
        List<EntidadeDominio> grupoLivros = (List<EntidadeDominio>) getServletContext().getAttribute("grupoLivros");
        %>
            <form action="InserirLivro" method="post">
                 <h2>Cadastro de Livro</h2>
                 <% 
                     //String mensagem = (String) request.getAttribute("mensagem");

                    // if (mensagem != null) {
                    //     out.print(mensagem);
                     //}
                 %>

                 

                 <label for="txtCodigo">Código:</label> 
                 <input type="text" id="txtCodigo" value="2010120132" name="txtCodigo" /> <br> 

                 <label for="txtAutor">Autor:</label> 
                 <input type="text" id="txtAutor" value="autor teste"name="txtAutor" /> <br> 

                 <label for="txtTitulo">Título:</label> 
                 <input type="text" id="txtTitulo" value="titulo teste" name="txtTitulo" /> <br> 

                 <label for="txtAno">Ano:</label>
                 <input type="text" id="txtAno" value="02/02/1999" name="txtAno" />

                 <label for="txtEdicao">Edição:</label> <input type="text" value="2"id="txtEdicao" name="txtEdicao" /> <br>

                 <label for="txtNumPaginas">Número de páginas:</label> 
                 <input type="text" id="txtNumPaginas"  value="222" name="txtNumPaginas" /> <br>
                 <label for="txtSinopse">Sinopse:</label> 
                 <input type="text" id="txtSinopse"  value="Esse é um exemplo da sinopse de um livro"name="txtSinopse" /> <br>
                 <label for="txtEditora">Editora:</label> 
                 <input type="text"  value="Abril"id="txtEditora" name="txtEditora" /> <br>

                 <label for="txtAltura">Altura:</label>
                 <input type="text"  value="20"id="txtAltura" name="txtAltura" /> <br>

                 <label for="txtLargura">Largura:</label> 
                 <input type="text" value="14" id="txtLargura" name="txtLargura" /> <br>

                 <label for="txtPeso">Peso:</label>
                 <input type="text" value="1.50" id="txtPeso" name="txtPeso" /> <br>

                 <label for="txtProfundidade">Profundidade:</label>
                 <input type="text" value="4" id="txtProfundidade" name="txtProfundidade" /> <br>

                 <label for="txtIsbn">ISBN:</label>
                 <input type="text" value="2423432"id="txtIsbn" name="txtIsbn" /> <br>
                 

                 <label for="txtPreco">Preço:</label> 
                 <input type="text" value="49.99" id="txtPreco" name="txtPreco" /> <br>

                <label>Categoria:</label><br>

                 <%for(EntidadeDominio edCat:categorias){
                     Categoria categoria = (Categoria)edCat; %>
                     <input type="checkbox" name="categoria" id ="categoria<%=categoria.getNome()%>"value="<%=categoria.getId()%>"><%=categoria.getNome()%><br>

                 <%}%>

                 <label>Grupo de Precificação:</label>
                 <select name="grupoLivro" id="cbPrecificacao">
                 <option value="">Selecione um grupo...</option>
                     <%for(EntidadeDominio edGrupo:grupoLivros){
                         GrupoLivro grupoLivro = (GrupoLivro)edGrupo;%>
                 <option id ="cbPrecificacao<%=grupoLivro.getId()%>"value="<%=grupoLivro.getId()%>"><%=grupoLivro.getNome()%></option>
                     <%}%>	
                 </select>


                 <br> 
                 <input type="submit" name="acao" value="inserir" placeholder="SALVAR" id="btSalvar"/>
             </form>
        
        <%//}}{%>

    </body>
</html>
