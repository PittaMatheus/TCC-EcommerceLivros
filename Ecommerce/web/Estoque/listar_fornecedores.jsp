<%@page import="ecommerce.dominio.estoque.Fornecedor"%>
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
        <title>JSP Page</title>
    </head>
    <body>
         <div class="navbar-fixed indigo darken-4">
                <nav>
                    <div class="nav-wrapper indigo darken-4">
                      <a href="#" class="brand-logo center maiusculo">Listagem de fornecedores</a>
                      <ul class="left">
                          <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                      </ul>
                    </div>
                  </nav>
        </div>
        <%
//        Resultado resultado = (Resultado) request.getAttribute("resultado");
        
        
        List<Fornecedor> fornecedores = (List<Fornecedor>) getServletContext().getAttribute("fornecedor");
        
//        if(resultado == null) {
//            response.sendRedirect(request.getContextPath() + "/Estoque/ListarEstoqueLivros?acao=listar");
//            return;
//        }
	%>
       
        
            <%
         
         
         
         if(fornecedores.size() == 0) {
            out.print("<br><br>Nenhum fornecedor foi cadastrado");
         }else {
             %> <br><br><br>
         <div class ="container2 row">
            <table class="bordered highlight centered responsive-table">
                <tr class="black white-text maiusculo center negrito">
                <th>Nome fornecedor</th>
                <th>CNPJ</th>
                <th>Razao social</th>
        </tr> 
        <%
            
            for(Fornecedor forn: fornecedores){
                Fornecedor fornecedor = (Fornecedor) forn;
        %>
            <tr>
                <td><%=fornecedor.getNome()%></td>
                <td><%=fornecedor.getCnpj()%></td>
                <td><%=fornecedor.getRazaoSocial()%></td>
            </tr>
            <%}
         }%>
        </table>
         </div>

    </body>
</html>