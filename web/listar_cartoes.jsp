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
			response.sendRedirect(request.getContextPath() + "/ListarCartao?acao=consultarPorID&id=" + id);
			return;
		}
	%>

       <table border='1'>
            <thead>
                <tr><h4>Cartões cadastrados</h4></tr>
                <tr>
                     <th>#</th><th>Logradouro</th> <th>Numero</th><th>Cep</th><th>Bairro</th><th>Cidade</th><th>Estado</th>
                </tr>
            </thead>
            <tbody>
 <%
                         List<Cartao> cartoes = (List) resultado.getEntidades();
                         
                         if(cartoes.size() == 0) {
                            out.print("<tr");
                            out.print("<td colspan='3'>Nenhum endereco cadastrado</td>");
                            out.print("</tr>");
                        } else {
                            for (Cartao cartao : cartoes) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value=" + cartao.getId() + " /></td>");
                                out.println("<td>" + cartao.getBandeira()+ "</td>");
                                out.println("<td>" + cartao.getNome()+ "</td>");
                                out.println("<td>" + cartao.getDtVencimento()+ "</td>");
 
                                
                                out.println("</tr>");
                            }
                         }                       
                    %>
            </tbody>
        </table>


            
        <a href='listar_clientes.jsp'>Voltar</a>
    </body>
</html>
