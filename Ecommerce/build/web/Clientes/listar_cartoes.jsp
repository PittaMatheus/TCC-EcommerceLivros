<%@page import="ecommerce.dominio.cliente.Bandeira"%>
<%@page import="ecommerce.dominio.cliente.Cartao"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
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
        <title>Cartões </title>
    </head>
    <body>
                <%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
                List<Bandeira> bandeiras = (List<Bandeira>) getServletContext().getAttribute("bandeira");
		if(resultado == null || bandeiras.size() == 0) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarCartao?acao=consultarPorID&id=" + id);
			return;
		}
                %>
           

       
 <%
                         List<Cartao> cartoes = (List) resultado.getEntidades();
                         
                         if(cartoes.size() == 0) {%>
                               <!-- NAV FIXO DO TOPO-->
                               <div class="navbar-fixed indigo darken-4">
                                   <nav>
                                       <div class="nav-wrapper indigo darken-4">
                                         <a href="#" class="brand-logo center maiusculo">Nenhum cartão cadastrado</a>
                                         <ul class="left">
                                             <li><a href="listar_clientes.jsp"><i class="material-icons">arrow_back</i></a></li>
                                         </ul>
                                       </div>
                                     </nav>
                               </div>
                               <br> <br> <br> <br>
                               <div class="container center"><img src="https://img.icons8.com/cool-color/400/000000/bank-cards.png"></div>              
                        <% } else { %>
                            <!-- NAV FIXO DO TOPO-->
                            <div class="navbar-fixed indigo darken-4">
                                <form action="ExcluirCartao">
                                <nav>
                                    <div class="nav-wrapper indigo darken-4">
                                      <a href="#" class="brand-logo center maiusculo">Cartões cadastrado do cliente</a>
                                      <ul id="nav-mobile" class="right hide-on-med-and-down"> 
                                          <li><%out.println("<a href='cadastro_cartao.jsp?id=" + id + "' ><i class='material-icons left'>add_circle_outline</i>Novo cartão&nbsp &nbsp &nbsp</a></li>");%>
                                          <li> <button type="submit" name="acao" value="desativar" class="btn-border"><i class='material-icons left'>done</i>Desativar cartão</button>  </li>
                                      </ul>             
                                      <ul class="left">
                                          <li><a href="listar_clientes.jsp"><i class="material-icons">arrow_back</i></a></li>
                                      </ul>
                                    </div>
                                </nav>
                            </div>
                            <br> <br> <br>
                            <div class="container2">
                                <table class="bordered highlight centered responsive-table">
                                    <thead>
                                        <tr class="black white-text maiusculo center">
                                             <th>#</th>
                                             <th>Bandeira</th>
                                             <th>Nome</th>
                                             <th>Data de vencimento</th>
                                             <th>Numero</th>
                                             <th>Codigo</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            for (Cartao cartao : cartoes) {
                                                out.println("<tr>");
                                                out.println("<td><input type='radio' required name='id' value='" + cartao.getId() + "' id='" + cartao.getId() + "' /><label for='"+ cartao.getId() +"'></td></td>");
                                                out.println("<td>" + bandeiras.get(cartao.getBandeira().getId()-1).getNome() + "</td>");
                                                out.println("<td>" + cartao.getNome()+ "</td>");
                                                out.println("<td>" + cartao.getDtVencimento()+ "</td>");
                                                out.println("<td>" + cartao.getNumeroCartao()+ "</td>");
                                                out.println("<td>" + cartao.getCodSeguranca()+ "</td>");
                                                out.println("</tr>");
                                            }
                                         }                       
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
