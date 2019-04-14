<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <% List<EntidadeDominio> categorias = (List<EntidadeDominio>) getServletContext().getAttribute("categorias"); 
           int id = Integer.parseInt(request.getParameter("id"));
           
        %>
        <h1>Editar categoria</h1>
        <form action='AlterarCategoria' method='POST'>
            <% for(EntidadeDominio edCat: categorias){
                    Categoria categoria = (Categoria)edCat;
                    if(categoria.getId().equals(id)){ %>
                        <input type="hidden" id="id" name="id" value="<%=categoria.getId() %>"/>
                        <label for="nome">Nome da categoria</label> 
                        <input type="text" id="nomeCategoria" value="<%=categoria.getNome() %>" name="nomeCategoria" /> <br>
                        <br>
                <% }
            }%>
            <input type="submit" name="acao" value="alterar" placeholder="ALTERAR" id="btAlterar"/>
        </form>
    </body>
    <br><br>
    <a href="listar_categorias.jsp">Voltar</a>
</html>
