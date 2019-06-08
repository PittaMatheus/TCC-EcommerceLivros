<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
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
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de clientes Inativos</title>
    </head>
    <body>
        	<%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarClientes?acao=listar&status=0");
			return;
		}
	%>
        
        <%
                         List<Cliente> clientes = (List) resultado.getEntidades();
                         
                         if(clientes.size() == 0) { %>
                            <!-- NAV FIXO DO TOPO-->
                            <div class="navbar-fixed indigo darken-4">
                                <nav>
                                    <div class="nav-wrapper indigo darken-4">
                                      <a href="#" class="brand-logo center maiusculo">Nenhum cliente desativado</a>
                                      <ul class="left">
                                          <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                                      </ul>
                                    </div>
                                  </nav>
                            </div>
                            <br> <br> <br> <br>
                            <div class="container center"><img src="https://img.icons8.com/bubbles/400/000000/crowd.png"></div>
                    <%
                        } else {
                     %>
                <!-- NAV FIXO DO TOPO-->
                <div class="navbar-fixed indigo darken-4">
                   <form action='AtivarCliente'>
                    <nav>
                        <div class="nav-wrapper indigo darken-4">
                          <a href="#" class="brand-logo center maiusculo">Clientes inativos no sistema</a>
                          <ul id="nav-mobile" class="right hide-on-med-and-down">
                              <li><button type="submit" class="btn-border" name="acao" value="ativar"><i class="material-icons left">done</i>Ativar Cliente</button></li>
                          </ul>
                          <ul class="left">
                              <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                          </ul>
                        </div>
                      </nav>
                </div>
                <br> <br> <br> <br>
                <div class ="container2">
                   
                        <table class="bordered highlight centered responsive-table">
                                <thead>
                                    <tr class="black white-text maiusculo center">
                                        <th>#</th><th>Nome</th><th>Sobrenome</th><th>Data de nascimento</th><th>Ranking</th><th>EmaIl</th><th>CPF</th><th>RG</th>
                                        <th>Sexo</th><th>Endereços</th><th>Cartões</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                            for (Cliente cliente : clientes) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value='" + cliente.getId() + "' id='" + cliente.getId() + "'/><label for='"+ cliente.getId() +"'></td>");
                                out.println("<td> " + cliente.getNome()+ "</td>");                                
                                out.println("<td>" + cliente.getSobrenome()+ "</td>");
                                
                                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                                String dataFormatNasc = formato.format(cliente.getData_nascimento());
                                
                                out.println("<td>" + dataFormatNasc + "</td>");
                                out.println("<td>" + cliente.getRanking()+ "</td>");
                                out.println("<td>" + cliente.getEmail()+ "</td>");
                                out.println("<td>" + cliente.getCpf()+ "</td>");
                                out.println("<td>" + cliente.getRg()+ "</td>");
                                if(cliente.getSexo().equals("M")){out.println("<td>Masculino</td>");}else out.println("<td>Feminino</td>");
                                out.println("<td><a href='listar_endereco.jsp?id=" + cliente.getId() + "'> Ver</a></td>");
                                out.println("<td><a href='listar_cartoes.jsp?id=" + cliente.getId() + "'> Ver</a></td>");                                
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
        <script type="text/javascript" src="../js/materialize.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    </body>
</html>
