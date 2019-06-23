<%-- 
    Document   : listar_trocas
    Created on : May 13, 2019, 8:31:38 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.pedido.Troca"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
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
        <title>Solicitaçẽos de trocas</title>
    </head>
    <body>
         <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Solicitações de troca</a>
                  <ul id="nav-mobile" class="right">      
                      <li><button type="submit" name="acao" value="inserir" placeholder="SALVAR" id="btSalvar" class="btn-border"><i class='material-icons left'>done</i>Cadastrar grupo</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="${pageContext.request.contextPath}/Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
<%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
                        
			response.sendRedirect(request.getContextPath() + "/adm/ListarSolicitacaoTrocas?acao=listar&tipoUsuario=2");
                        
			return;
		}
                        
                         List<Troca> trocas = (List) resultado.getEntidades();
                         
                         if(trocas.size() == 0) {
                            out.print("<br><br>Nenhuma troca registrada");
                        } else {
                             String stPedido = "";
                                        session.setAttribute("resultado",  resultado); 
%>
<br>
        
<%
                            for (Troca troca : trocas) {
                                if(troca.getStatus().equals("1")){
                                    out.println("Não há solicitações de troca pendentes");
                                }else {
                                
%>
<div class="container center">
                                    <table border="1" class="highlight striped centered responsive-table">
                                    <thead>
                                        <tr>
                                            <th>#</th><th>Id Troca</th><th>Id Usuario</th><th>Id pedido</th>
                                        </tr>
                                    </thead>
                                    <div class ="container">
                                        <form action="AutorizarTroca" method="POST">
                                            <input type='hidden' name='u' value='<%=troca.getCliente().getId()%>'>
                                            <input type='hidden' name='id_pedido' value='<%=troca.getPedido().getId()%>'>

                        
                            
                                    <tbody>
<%
                                    out.println("<tr>");%>
                                     <td><input type='radio' required name='id' value="<%=troca.getId() %>" id="<%=troca.getId() %>" /><label for="<%=troca.getId() %>"></label></td>
                                   <% 
                                    out.println("<td>" + troca.getId() + "</td>"); 
                                    out.println("<td>" + troca.getCliente().getId()+ "</td>");
                                    out.println("<td>" + troca.getPedido().getId() + "</td>");                                                              
                                    out.println("</tr>");
                            
                    %>
                                    </tbody>
                                </table>
                            <br>
                            <button type="submit" name="acao" value="inserir" class="btn-border green darken-3"><i class='material-icons left'>done</i>Aprovar</button>
                            <button type="submit" name="acao" value="desativar" class="btn-border red darken-3"><i class='material-icons left'>clear</i>Reprovar</button>


                            <br>
                                
            </div>
                </form>
<%                              }  
                              }
                           } 
%>
                <br><br>
        <a href='../Clientes/home.jsp'>Voltar</a>
        
        
        </div>
        
        
        
    </body>
</html>
