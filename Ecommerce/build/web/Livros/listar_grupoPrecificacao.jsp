<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.GrupoLivro"%>
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
        <title>Grupo de precificação</title>
    </head>
    <body>
        <%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/ListarGrupoLivros?acao=listar&status=1");
			return;
		}
                
                
                         List<GrupoLivro> gruposLivros = (List) resultado.getEntidades();
                         
                         if(gruposLivros.size() == 0) {
                            out.print("<br><br>Nenhum grupo de precificação cadastrado");
                        } else {
                     
        %>
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <form action='DesativarGrupo' method='POST'>
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Grupo de precificação dos livros</a>
                  <ul id="nav-mobile" class="right">      
                      <li><button type="submit" name="acao" value="desativar" placeholder="SALVAR" id="btSalvar" class="btn-border"><i class='material-icons left'>done</i>Desativar grupo</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
        <br> <br> <br><br>
        <div class ="container row">
            <table class="bordered highlight centered responsive-table">
                <thead>
                    <tr class="black white-text maiusculo negrito">
                        <th>#</th>
                        <th>Nome</th>
                        <th>Margem de lucro %</th>
                        <th>Editar</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                            for (GrupoLivro grupoLivro : gruposLivros) {  %>
                                <tr>
                                    <td><input type="radio" id='"<%= grupoLivro.getId() %>"' required name='id' value=" <%= grupoLivro.getId() %>"><label for='"<%= grupoLivro.getId() %>"'></label></td>
                                    <td> <%=grupoLivro.getNome()%></td>
                                    <td> <%=grupoLivro.getMargemLucro()%></td>
                                    <td><a class="btn orange" href="../Livros/preAlterarGrupoLivro.jsp?id=<%=grupoLivro.getId()%>"><i class="material-icons">edit</i></a></td>
                                </tr>
                      <%}%>
                            <% }
                                                
                    %>
                </tbody>
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
