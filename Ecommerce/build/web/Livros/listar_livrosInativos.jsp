<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="java.util.List"%>
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
        <title>Ativação de livros</title>
    </head>
    <body>
        
        <%
      		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/ListarLivros?acao=listar&status=0");
			return;
		}
	%>
        
      
        <%
         List<Livro> livros = (List) resultado.getEntidades();
                         
        if(livros.size() == 0) {%>
           <!-- NAV FIXO DO TOPO-->
           <div class="navbar-fixed indigo darken-4">
               <nav>
                   <div class="nav-wrapper indigo darken-4">
                     <a href="#" class="brand-logo center maiusculo">Nenhum livro Inativo</a>
                     <ul class="left">
                         <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                     </ul>
                   </div>
                 </nav>
           </div>
           <br> <br> <br>
           <div class="container center"><img src="https://img.icons8.com/clouds/450/000000/book-shelf.png"></div> 
        <%}else { %> 
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <form action='AtivarLivro'>
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Livros Desativados</a>
                  <ul id="nav-mobile" class="right">      
                      <li><button type="submit" name="acao" value="ativar" class="btn-border"><i class='material-icons left'>done</i>Ativar livro</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
        <br> <br> <br><br><br>
        <div class ="container2 row">
            <table class="bordered highlight centered responsive-table">
                <tr class="black white-text maiusculo center negrito">
                    <td>#</td>
                    <td>Código</td>
                    <td>Título</td>
                    <td>Autor</td>
                    <td>Ano</td>
                    <td>Editora</td>
                    <td>ISBN</td>
                    <td>Grupo</td>
                    <td>Margem de lucro</td>
                    <td>Preco de custo</td>
                    <td>Preco de revenda</td>
                    <td>Lucro</td>  
                </tr>       
                <% for (Livro livro : livros) { %>

                <tr>
                    <td><input type='radio' required name='id' value="<%=livro.getId() %>" id="<%=livro.getId() %>"><label for="<%=livro.getId() %>"></label></td>
                    <td><%=livro.getCodigoBarras()%></td>
                    <td><%=livro.getTitulo()%></td>
                    <td><%=livro.getAutor()%></td>
                    <td><%=livro.getAno()%></td>
                    <td><%=livro.getEditora().getNome()%></td>
                    <td><%=livro.getIsbn().getCodBarras()%></td>
                    <td><%=livro.getGrupoLivro().getNome()%></td>
                    <td><%=livro.getGrupoLivro().getMargemLucro()%>%</td>
                    <td><%=livro.getPreco()%></td>
                    <td><%=livro.getPreco() + (livro.getPreco() * (livro.getGrupoLivro().getMargemLucro()/100))%></td>
                    <td><%=(livro.getPreco() + (livro.getPreco() * (livro.getGrupoLivro().getMargemLucro()/100)))  -   (livro.getPreco())%></td>
                </tr>
                <% }} %>
            </table>
           </form>
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../js/materialize.min.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    </body>
</html>
