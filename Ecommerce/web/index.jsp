<%-- 
    Document   : index
    Created on : May 21, 2019, 10:56:02 AM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!-- CSS CAROUSEL-->
        <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css" media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css" media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
        <!-- LOGO -->
        <link rel="icon" href="../imagens/logo.png">
    </head>
    <body>
    <!-- DROPDOWN DO LOGIN -->
        <ul id="dropdown1" class="dropdown-content">
            <li><a href="../login.jsp">Login</a></li>
            <li class="divider"></li>
            <li><a href="../Clientes/cadastro_cliente.jsp">Cadastre-se</a></li>
        </ul>
    <div class="navbar-fixed">
        <nav class="indigo darken-4">
          <div class="nav-wrapper indigo darken-4">
            <a href="#!" class="brand-logo left"><img src="https://img.icons8.com/clouds/75/000000/literature.png"></a>
            <ul class="right hide-on-med-and-down">
              <li><a href="../Pedidos/carrinhoSessao.jsp"><i class="material-icons left">local_grocery_store</i>Carrinho</a></li>
              <!-- DROPDOWN DO LOGIN -->
              <li><a class="dropdown-button" href="#!" data-activates="dropdown1"><i class="material-icons left">face</i>Entre ou cadastre-se<i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
          </div>
        </nav>
    </div>
<!--FIM NAVBAR-->

<%
            if(session.getAttribute("mensagem") != null){ %>
                    <input type="hidden" class="btn" id="mensagem" onclick="Materialize.toast('<b>O livro foi adicionado ao carrinho!</b>', 4000, 'green rounded')">
                    <script>
                        window.onload = function(){
                            document.getElementById("mensagem").click();
                        }
                    </script>
<%
            }
        
%>
    <br><br>
     <div class="container2 maiusculo"><h4 class="negrito">Livros em promoção</h4></div>
        <div class="container2 carousel_livros">
       <% 
    Resultado resultado = (Resultado) request.getAttribute("resultado");
    if(resultado == null) {
        
            response.sendRedirect(request.getContextPath() + "/Livros/ListarLivros?acao=listar&status=1&menu=ok");
            return;
    }

    List<Livro> livros = (List) resultado.getEntidades();
                         
    if(livros.size() == 0) {
       out.print("<br><br>Nenhum livro cadastrado");
    }else { 
        for (Livro livro : livros) {
            
       %>
            <a href="../Pedidos/detalheItem.jsp?l=<%=livro.getId()%>"> <div><img src="../imagens/<%=livro.getImagem()%>" class="z-depth-1" style='width: 98%' /></div></a>
            <%
        }
    }
request.getSession().removeAttribute("mensagem");

%>
    </div>
      

    


        <br><br><br>


        
        <!-- JS CAROUSEL-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js"></script>
        <script>
           $('.carousel_livros').slick({
               slidesToShow: 5,
               slidesToScroll: 1,
               autoplay: true,
               autoplaySpeed: 2000,
            });
        </script>
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
