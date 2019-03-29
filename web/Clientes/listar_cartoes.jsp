<%-- 
    Document   : listar_cartoes
    Created on : Mar 27, 2019, 11:48:40 AM
    Author     : matheus
--%>

<%@page import="br.com.fatecmogidascruzes.dominio.Cartao"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cartões </title>
    </head>
    <body>
        <h1>Cartões</h1>
                	<%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarCartao?acao=consultarPorID&id=" + id);
			return;
		}
	%>
           

       
 <%
                         List<Cartao> cartoes = (List) resultado.getEntidades();
                         
                         if(cartoes.size() == 0) {
                            out.print("Nenhum cartão cadastrado");                            
                        } else { %>
                <table border='1'>
                    <thead>
                        <tr>
                             <th>#</th><th>Bandeira</th> <th>Nome</th><th>Data de vencimento</th><th>Numero</th><th>Codigo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Cartao cartao : cartoes) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value=" + cartao.getId() + " /></td>");
                                out.println("<td>" + cartao.getBandeira().getNome() + "</td>");
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
            <br><br><br>   
            <%
            out.println("<a href='cadastro_cartao.jsp?id=" + id + "' >Adicionar cartão</a>");
            %>
        
        <br><br>
        <a href='listar_clientes.jsp?'>Voltar</a>
    </body>
</html>
