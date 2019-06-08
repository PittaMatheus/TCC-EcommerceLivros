<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.cliente.Endereco"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Endereços do cliente</title>
    </head>
    <body>
        
        	<%
               
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarEndereco?acao=listar&id=" + id);
			return;
		}
	%>

       
 <%
                         List<Endereco> enderecos = (List) resultado.getEntidades();
                          
                         if(enderecos.size() == 0) {%>
                            <!-- NAV FIXO DO TOPO-->
                            <div class="navbar-fixed indigo darken-4">
                                <nav>
                                    <div class="nav-wrapper indigo darken-4">
                                      <a href="#" class="brand-logo center maiusculo">Nenhum endereco cadastrado</a>
                                      <ul class="left">
                                          <li><a href="listar_clientes.jsp"><i class="material-icons">arrow_back</i></a></li>
                                      </ul>
                                    </div>
                                  </nav>
                            </div>
                            <br> <br> <br> <br>
                            <div class="container center"><img src="https://img.icons8.com/clouds/400/000000/worldwide-location.png"></div>
                            <%
                        } else {%>
                        <!-- NAV FIXO DO TOPO-->
                        <div class="navbar-fixed indigo darken-4">
                            <nav>
                                <div class="nav-wrapper indigo darken-4">
                                  <a href="#" class="brand-logo center maiusculo">Listagem dos Endereço</a>
                                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                                      <li><%out.println("<a href='cadastro_endereco.jsp?id=" + id + "' ><i class='material-icons left'>add_circle_outline</i>Novo endereço</a>");%></li>
                                  </ul>
                                  <ul class="left">
                                      <li><a href="listar_clientes.jsp"><i class="material-icons">arrow_back</i></a></li>
                                  </ul>
                                </div>
                              </nav>
                        </div>
                <br> <br> <br> <br>
                <div class ="container2">
                    <table class="bordered highlight centered responsive-table">
                        <thead>
                            <tr class="black white-text maiusculo center">
                                <th>#</th>
                                <th>Logradouro</th>
                                <th>Bairro</th>
                                <th>CEP</th>
                                <th>Numero</th>
                                <th>Cidade</th>
                                <th>UF</th>
                                <th>Tipo de logradouro</th>
                                <th>Complemento</th>
                                <th>Tipo de endereço</th>
                                <th>Editar</th>
                            </tr>
                        </thead>
                    <tbody>
                        <%
                              for (Endereco endereco : enderecos) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value='" + endereco.getId() + "' id='" + endereco.getId() + "'/><label for='"+ endereco.getId() +"'></td>");
                                out.println("<td>" + endereco.getLogradouro()+ "</td>");
                                out.println("<td>" + endereco.getBairro()+ "</td>");
                                out.println("<td>" + endereco.getCep()+ "</td>");
                                out.println("<td>" + endereco.getNumero()+ "</td>");
                                out.println("<td>" + endereco.getCidade()+ "</td>");
                                out.println("<td>" + endereco.getUf()+ "</td>");
                                out.println("<td>" + endereco.getTipoLogradouro()+ "</td>");
                                out.println("<td>" + endereco.getComplemento()+ "</td>");
                               
                                if(endereco.getTipoEndereco().equals("1")){

                                    out.println("<td>Cobrança</td>");

                                }else{

                                out.println("<td>Entrega</td>");

                                }
                       
                                out.println("<td><a class='btn orange' href='preAlterarEndereco.jsp?id=" + endereco.getId() + "'><i class='material-icons'>edit</i></a></td>");
                                out.println("</tr>");    
                            }
                         }                 
                    %>
                     </tbody>
                </table>
                    <br> <br> <br>     
               </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../js/materialize.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    </body>
</html>
