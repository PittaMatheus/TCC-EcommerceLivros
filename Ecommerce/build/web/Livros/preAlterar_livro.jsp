<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="java.lang.String"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.livro.Categoria"%>
<%@page import="ecommerce.dominio.livro.GrupoLivro"%>
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
            List<EntidadeDominio> categorias = (List<EntidadeDominio>) getServletContext().getAttribute("categorias");
            List<EntidadeDominio> grupoLivros = (List<EntidadeDominio>) getServletContext().getAttribute("grupoLivros");
            Resultado resultado = (Resultado) request.getAttribute("resultado");
            
            String id = request.getParameter("id");    
            //String mensagem = resultado.getMensagem();
            
            if(resultado == null) {
                response.sendRedirect(request.getContextPath() + "/Livros/PreAlterarLivro?acao=consultarPorID&id=" + id + "&status=1");
                return;
            }
            
            
            List<Livro> livros = (List) resultado.getEntidades();
            if(livros.size() == 0){
                out.println("Error");
            }else{
                for (Livro livro : livros) {
                                

	%>

       
        <h3>Editar livro</h3>
        <form action="AlterarLivro">
        
            <% 
                

                if (resultado.getMensagem() != null) {
                    out.println(resultado.getMensagem());
                 %> 
                    <br>
                <%}%>
        
            <input type="hidden" id="id" name="id" value="<%=livro.getId()%>"/>
            <input type="hidden" id="id" name="id_editora" value="<%=livro.getEditora().getId()%>"/>
            <input type="hidden" id="id" name="id_dimensoes" value="<%=livro.getDimensoes().getId()%>"/>
            <input type="hidden" id="id" name="id_grupolivro" value="<%=livro.getGrupoLivro().getId()%>"/>
            <input type="hidden" id="id" name="id_isbn" value="<%=livro.getIsbn().getId()%>"/>
            <label for="txtCodigo">Código:</label> 
            <input type="text" id="txtCodigo" value="<%=livro.getCodigoBarras()%>" name="txtCodigo" /> <br> 

            <label for="txtAutor">Autor:</label> 
            <input type="text" id="txtAutor" value="<%=livro.getAutor()%>"name="txtAutor" /> <br> 

            <label for="txtTitulo">Título:</label> 
            <input type="text" id="txtTitulo" value="<%=livro.getTitulo()%>" name="txtTitulo" /> <br> 

            <label for="txtAno">Ano:</label>
            <input type="text" id="txtAno" value="<%=livro.getAno()%>" name="txtAno" /> <br>

            <label for="txtEdicao">Edição:</label> <input type="text" value="<%=livro.getEdicao()%>"id="txtEdicao" name="txtEdicao" /> <br>

            <label for="txtNumPaginas">Número de páginas:</label> 
            <input type="text" id="txtNumPaginas"  value="<%=livro.getNumeroPaginas()%>" name="txtNumPaginas" /> <br>
            <label for="txtSinopse">Sinopse:</label> 
            <input type="text" id="txtSinopse"  value="<%=livro.getSinopse()%>"name="txtSinopse" /> <br>
            <label for="txtEditora">Editora:</label> 
            <input type="text"  value="<%=livro.getEditora().getNome()%>"id="txtEditora" name="txtEditora" /> <br>

            <label for="txtAltura">Altura:</label>
            <% if(livro.getDimensoes().getAltura() != null){ %>
                <input type="text"  value="<%=livro.getDimensoes().getAltura()%>"id="txtAltura" name="txtAltura" /> <br>
            <%}else{%>
                <input type="text"  value=""id="txtAltura" name="txtAltura" /> <br>
            <%}%>
            
            <label for="txtLargura">Largura:</label>
            <% if(livro.getDimensoes().getLargura() != null){ %>
                <input type="text" value="<%=livro.getDimensoes().getLargura()%>" id="txtLargura" name="txtLargura" /> <br>
            <%}else{%>
                <input type="text" value="" id="txtLargura" name="txtLargura" /> <br>
            <%}%>
            
            <label for="txtPeso">Peso:</label>
            <% if(livro.getDimensoes().getPeso() != null){ %>
                <input type="text" value="<%=livro.getDimensoes().getAltura()%>" id="txtPeso" name="txtPeso" /> <br>
            <%}else{%>
                <input type="text" value="" id="txtPeso" name="txtPeso" /> <br>
            <%}%>
                
            <label for="txtProfundidade">Profundidade:</label>
            <% if(livro.getDimensoes().getProfundidade() != null){ %>
                <input type="text" value="<%=livro.getDimensoes().getProfundidade()%>" id="txtProfundidade" name="txtProfundidade" /> <br>
            <%}else{ %>
                <input type="text" value="" id="txtProfundidade" name="txtProfundidade" /> <br>
            <%}%>
            
            <label for="txtIsbn">ISBN:</label>
            <input type="text" value="<%=livro.getIsbn().getCodBarras()%>"id="txtIsbn" name="txtIsbn" /> <br>

            <label for="txtPreco">Preço:</label> 
            <% if(livro.getPreco() != null){ %>
                <input type="text" value="<%=livro.getPreco()%>" id="txtPreco" name="txtPreco" /> <br>
            <%}else{%>
                <input type="text" value="" id="txtPreco" name="txtPreco" /> <br>
           <%}%>
           
            <label>Categoria:</label> <br>
           <%for(EntidadeDominio entCats:categorias){
                   Categoria categoria = (Categoria)entCats;%>
            <input type="checkbox" name="categoria" value="<%=categoria.getId()%>"
               <% for(Categoria categoriaLivro:livro.getCategorias()){
                       if(categoria.getId() == (categoriaLivro.getId())){
                           out.print("checked");
                       }   
                   }%>
               ><%=categoria.getNome()%>
               <br>	
           <%}%>

            <label>Grupo de Precificação:</label>
           <select name="grupoLivro">

               <option value="">Selecione uma grupo...</option>
                   <%for(EntidadeDominio edGrp:grupoLivros){
                       GrupoLivro grupoLivro = (GrupoLivro)edGrp;
                   %> 
                   <option value="<%=grupoLivro.getId()%>"
                       <%if(grupoLivro.getId() == (livro.getGrupoLivro().getId())){
                           out.print("selected");
                       }%>><%=grupoLivro.getNome()%>
                   </option>
                   <%}%>

           </select>
            <br><br>
       <%  } %>
       
            <input type="submit" name="acao" value="alterar" class="btn btn-success">   
        </form>
       <%}%>
    </body>
</html>
