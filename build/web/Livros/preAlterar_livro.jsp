<%-- 
    Document   : preAlterar_livro.jsp
    Created on : Apr 11, 2019, 10:34:20 AM
    Author     : matheus
--%>

<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Livro"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.GrupoLivro"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<EntidadeDominio> categorias = (List<EntidadeDominio>) getServletContext().getAttribute("categorias");
            List<EntidadeDominio> grupoLivros = (List<EntidadeDominio>) getServletContext().getAttribute("grupoLivros");
            
            String id = request.getParameter("id");    
            Resultado resultado = (Resultado) request.getAttribute("resultado");
            if(resultado == null) {
                response.sendRedirect(request.getContextPath() + "/Livros/PreAlterarLivro?acao=consultarPorID&id=" + id + "&status=1");
                return;
            }
            List<Livro> livros = (List) resultado.getEntidades();
                         
                         if(livros.size() == 0) {
                            out.print("Erro");                   
                        } else { 

                            for (Livro livro : livros) {
                                

	%>

       
        <h3>Editar livro</h3>
        <form action="" method="POST">
            
                 <label for="txtCodigo">Código:</label> 
                 <input type="text" id="txtCodigo" value="<%=livro.getCodigoBarras()%>" name="txtCodigo" /> <br> 

                 <label for="txtAutor">Autor:</label> 
                 <input type="text" id="txtAutor" value="<%=livro.getAutor()%>"name="txtAutor" /> <br> 

                 <label for="txtTitulo">Título:</label> 
                 <input type="text" id="txtTitulo" value="<%=livro.getTitulo()%>" name="txtTitulo" /> <br> 

                 <label for="txtAno">Ano:</label>
                 <input type="text" id="txtAno" value="<%=livro.getAno()%>" name="txtAno" />

                 <label for="txtEdicao">Edição:</label> <input type="text" value="<%=livro.getEdicao()%>"id="txtEdicao" name="txtEdicao" /> <br>

                 <label for="txtNumPaginas">Número de páginas:</label> 
                 <input type="text" id="txtNumPaginas"  value="<%=livro.getNumeroPaginas()%>" name="txtNumPaginas" /> <br>
                 <label for="txtSinopse">Sinopse:</label> 
                 <input type="text" id="txtSinopse"  value="<%=livro.getSinopse()%>"name="txtSinopse" /> <br>
                 <label for="txtEditora">Editora:</label> 
                 <input type="text"  value="<%=livro.getEditora().getNome()%>"id="txtEditora" name="txtEditora" /> <br>

                 <label for="txtAltura">Altura:</label>
                 <input type="text"  value="<%=livro.getDimensoes().getAltura()%>"id="txtAltura" name="txtAltura" /> <br>

                 <label for="txtLargura">Largura:</label> 
                 <input type="text" value="<%=livro.getDimensoes().getLargura()%>" id="txtLargura" name="txtLargura" /> <br>

                 <label for="txtPeso">Peso:</label>
                 <input type="text" value="<%=livro.getDimensoes().getAltura()%>" id="txtPeso" name="txtPeso" /> <br>

                 <label for="txtProfundidade">Profundidade:</label>
                 <input type="text" value="<%=livro.getDimensoes().getProfundidade()%>" id="txtProfundidade" name="txtProfundidade" /> <br>

                 <label for="txtIsbn">ISBN:</label>
                 <input type="text" value="<%=livro.getIsbn().getCodBarras()%>"id="txtIsbn" name="txtIsbn" /> <br>
                 
                 <label for="txtPreco">Preço:</label> 
                 <input type="text" value="<%=livro.getPreco()%>" id="txtPreco" name="txtPreco" /> <br>
                 <input type="checkbox" name="categoria" value=""> <%=livro.getCategorias()%><br><br>
                       
                       
               <%for(EntidadeDominio edCat:categorias){
                     Categoria categoria = (Categoria)edCat; %>
                     <input type="checkbox" name="categoria" id ="categoria<%=categoria.getNome()%>"value="<%=categoria.getId()%>"><%=categoria.getNome()%><br>
                <%}%>
                
                 <label>Grupo de Precificação:</label>
                 <select name="grupoLivro" id="cbPrecificacao">
                <%for(EntidadeDominio edGrupo:grupoLivros){
                       GrupoLivro grupoLivro = (GrupoLivro)edGrupo;%>
                       <option id ="cbPrecificacao<%=grupoLivro.getId()%>"value="<%=grupoLivro.getId()%>"><%=grupoLivro.getNome()%></option>
                       <option value="<%=grupoLivro.getId()%>"
                            <%if(grupoLivro.getNome().equals(livro.getGrupoLivro().getNome()))
                            {
                                %> selected </option> 
                       
                       <%=livro.getGrupoLivro().getNome());
                                
                            }%>  
                        
                       
                <%}%>
                         
                 </select>
                 <br><br>
                 
                <%  } 
    } %>
                 <input type="submit" name="acao" value="alterar" class="btn btn-success">   
        </form>
    </body>
</html>
