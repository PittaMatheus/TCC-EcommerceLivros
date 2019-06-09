<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.GrupoLivro"%>
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
        <title>Alterar grupo de precificação</title>
    </head>
    <body>
       
        <%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Livros/PreAlterarGrupoLivro?acao=consultarPorID&id=" + id);
			return;
		}

                         List<GrupoLivro> grupoLivros = (List) resultado.getEntidades();
                         
                         if(grupoLivros.size() == 0) {
                            out.print("Erro");                   
                        } else { 

                             %>
                            <!-- NAV FIXO DO TOPO-->
                            <div class="navbar-fixed indigo darken-4">
                                <form action='AlterarGrupoLivro' method='POST'>
                                <nav>
                                    <div class="nav-wrapper indigo darken-4">
                                      <a href="#" class="brand-logo center maiusculo">Alterar grupo de precificação</a>
                                      <ul id="nav-mobile" class="right">      
                                          <li><button type="submit" name="acao"  value="alterar" placeholder="SALVAR" id="btAlterar" class="btn-border"><i class='material-icons left'>done</i>Alterar grupo</button></li>
                                      </ul>
                                      <ul class="left">
                                          <li><a href="listar_grupoPrecificacao.jsp"><i class="material-icons">arrow_back</i></a></li>
                                      </ul>
                                    </div>
                                  </nav>
                            </div>
                            <br> <br> <br><br>
                            <div class ="container row">
        <%
                            for (GrupoLivro grupLivro : grupoLivros) {
	%>
                <input type="hidden" name="id" id="id" value="<%=grupLivro.getId()%>" />
                <label for="nome">Nome do grupo de precificação do livro: </label> 
                <input type="text" id="nomeCategoria" value="<%=grupLivro.getNome() %>" name="nomeGrupo" /> <br>
                <br>
                <label for="margemLucro">Margem de lucro do grupo(%): </label> 
                <input type="text" id="margemLucro" value="<%=grupLivro.getMargemLucro()%>" name="margemLucro" /> <br>
                <% }
            }%>
            <br>
 
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
