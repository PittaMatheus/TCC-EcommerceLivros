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
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        
        
    </head>
    <body>
<!-- Dropdown Structure -->
        <ul id="dropdown1" class="dropdown-content">
            <li><a href="../login.jsp">Login</a></li>
            <li class="divider"></li>
            <li><a href="../Clientes/cadastro_cliente.jsp">Cadastre-se</a></li>
        </ul>
        <nav>
          <div class="nav-wrapper">
            <a href="#!" class="brand-logo">Livraria</a>
            <ul class="right hide-on-med-and-down">
              <li><a href="badges.html">Carrinho</a></li>
              <!-- Dropdown Trigger -->
              <li><a class="dropdown-button" href="#!" data-activates="dropdown1">Entre ou cadastre-se<i class="material-icons right">arrow_drop_down</i></a></li>
            </ul>
          </div>
        </nav>
<!--FIM NAVBAR-->

       
      

     
  <div class="carousel">


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
            <a href="../Pedidos/detalheItem.jsp?l=<%=livro.getId()%>" class="carousel-item"><img src="../imagens/<%=livro.getImagem()%>"</a>
            <br>
            <%
        }
    }

%>

</div>





        <br><br><br>

        
        
        
        
        
        
        
        
        
        
        
        
   
        
        
        
        
        
        
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
