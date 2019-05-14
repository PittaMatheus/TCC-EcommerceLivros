<%-- 
    Document   : ListarCupomTroca
    Created on : May 13, 2019, 9:26:57 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.pedido.CupomTroca"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Cupons Troca</title>
    </head>
    <body>
      <%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ConsultarCupomTroca?acao=consultarPorID");
			return;
		}
               
                
                
                 List<CupomTroca> cupons = (List) resultado.getEntidades();
                         
                         if(cupons.size() == 0) {
                            out.print("Nenhum cupons cadastrado");                            
                        } else { %>
            <form action=''>
                <table border='1'>
                    <thead>
                        <tr>
                            <th>id cupom</th> <th>id Cliente</th><th>Id pedido</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (CupomTroca cuponsTroca : cupons) {
                                out.println("<tr>");
                                out.println("<td> "+ cuponsTroca.getId() + " /></td>");
                                out.println("<td>" + cuponsTroca.getCliente().getId() + "</td>");
                                out.println("<td>" + cuponsTroca.getPedido().getId()+ "</td>");

                                
                                
 
                                
                                out.println("</tr>");
                            }
                         }                       
                    %>
            </tbody>
        </table>
            </form>
            <br><br><br>   

        
        <br><br>
        <a href=''>Voltar</a>
    </body>
</html>
