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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
                        
			response.sendRedirect(request.getContextPath() + "/adm/ListarTrocas?acao=listar&tipoUsuario=2");
                        
			return;
		}
                        
                         List<Troca> trocas = (List) resultado.getEntidades();
                         
                         if(trocas.size() == 0) {
                            out.print("<br><br>Nenhuma troca registrada");
                        } else {
                             String stPedido = "";
                                        session.setAttribute("resultado",  resultado); 
                                        %>
                                <h3>Solicitações de trocas registrados</h3>
                                  <table border="1" class="highlight striped centered responsive-table">
                                <thead>
                                    <tr>
                                        <th>#</th><th>Id Troca</th><th>Id Usuario</th><th>Id pedido</th><th>Autorizar</th>
                                    </tr>
                                </thead>
        
        <%
                            for (Troca troca : trocas) {
                     %>
                       
                <div class ="container">
                  
                    <form action="AutorizarTroca" method="POST">
                        <input type='hidden' name='u' value='<%=troca.getCliente().getId()%>'>
                        <input type='hidden' name='id_pedido' value='<%=troca.getId()%>'>

                        
                            
                                <tbody>
                                    <%
                                        

                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value=" + troca.getId() + " /></td>");
                                out.println("<td>" + troca.getId() + "</td>"); 
                                out.println("<td>" + troca.getCliente().getId()+ "</td>");
                                out.println("<td>" + troca.getPedido().getId() + "</td>"); 
                                out.println("<td><button name='acao' value='inserir'>Autorizar</button></td>");
                                out.println("</tr>");
                            }
                         }    
                     
                    %>
                            </tbody>
                        </table>
                            <br>
                            <input type="submit" name="acao" value="">
            </div>
                </form>
                <br><br>
        <a href='../Clientes/home.jsp'>Voltar</a>
        
        
        
        
        
        
    </body>
</html>
