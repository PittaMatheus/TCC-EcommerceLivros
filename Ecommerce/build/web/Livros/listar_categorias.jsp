<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.Categoria"%>
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
        <title>Categorias dos livros</title>
    </head>
    <body>
         <%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/ListarCategorias?acao=listar&status=1");
			return;
		}
                
                
                         List<Categoria> categorias = (List) resultado.getEntidades();
                         
                         if(categorias.size() == 0) {%>
                            <!-- NAV FIXO DO TOPO-->
                            <div class="navbar-fixed indigo darken-4">
                                <nav>
                                    <div class="nav-wrapper indigo darken-4">
                                      <a href="#" class="brand-logo center maiusculo">Nenhuma categoria cadastrada</a>
                                      <ul class="left">
                                          <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                                      </ul>
                                    </div>
                                  </nav>
                            </div>
                            <br> <br> <br>
                            <div class="container center"><img src="https://img.icons8.com/clouds/400/000000/folder-invoices.png"></div>
                        
                        <%} else {%>  
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <form action='DesativarCategoria'>
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Categorias dos livros</a>
                  <ul id="nav-mobile" class="right">      
                      <li><button type="submit" name="acao" value="desativar" class="btn-border"><i class='material-icons left'>done</i>Desativar categoria</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
        <br> <br> <br>
        <div class ="container row">
            <table class="bordered highlight centered responsive-table">
                <thead>
                    <tr class="black white-text maiusculo negrito">
                        <td class="center">#</td>
                        <td class="center">Nome da categoria</td>
                        <td class="center">Editar</td>
                    </tr>
                </thead>
                <tbody>
                    <%
                            for (Categoria cat : categorias) {  %>
                                <tr>
                                    <td><input type="radio" required name='id' value=" <%= cat.getId() %> " id='"<%= cat.getId() %>"'><label for='"<%= cat.getId() %>"'></label></td>
                                    <td> <%=cat.getNome()%></td>
                                    <td><a class=" btn orange" href="../Livros/preAlterarCategoria.jsp?id=<%=cat.getId()%>"><i class="material-icons">edit</i></a></td>
                                </tr>
                      <%}%>
                            <% }
                                                
                    %>
                </tbody>
            </table>
        </form>
                <br>
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
