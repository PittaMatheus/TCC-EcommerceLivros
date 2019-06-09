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
        <title>Alterar a Categoria</title>
    </head>
    <body>
       <%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/PreAlterarCategoria?acao=consultarPorID&id=" + id);
			return;
		}

                         List<Categoria> categorias = (List) resultado.getEntidades();
                         
                         if(categorias.size() == 0) {
                            out.print("Erro");                   
                        } else { 

                             %>
                        <!-- NAV FIXO DO TOPO-->
                        <div class="navbar-fixed indigo darken-4">
                            <form action='AlterarCategoria' method='POST'>
                            <nav>
                                <div class="nav-wrapper indigo darken-4">
                                  <a href="#" class="brand-logo center maiusculo">Editar Categoria</a>
                                  <ul id="nav-mobile" class="right">      
                                      <li><button type="submit" name="acao" value="alterar" placeholder="SALVAR" id="btAlterar" class="btn-border"><i class='material-icons left'>done</i>Alterar categoria</button></li>
                                  </ul>
                                  <ul class="left">
                                      <li><a href="listar_categorias.jsp"><i class="material-icons">arrow_back</i></a></li>
                                  </ul>
                                </div>
                              </nav>
                        </div>
                        <br> <br> <br><br>
        <div class ="container row">
        <h5 class="forma_redonda negrito center">Preencha o campo abaixo</h5>
            <br>
        <% for (Categoria cat : categorias) {%>
                <input type="hidden" name="id" id="id" value="<%=cat.getId()%>" />
                <label for="nome">Categoria</label> 
                <input type="text" id="categoria" value="<%=cat.getNome() %>" name="nomeCategoria" /> <br>
                <br>
                <% }
            }%>
            </div>    
        </form>
            
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
