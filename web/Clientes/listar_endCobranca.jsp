<%-- 
    Document   : tipos_endereco
    Created on : Mar 27, 2019, 11:10:02 AM
    Author     : matheus
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Endereco"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Resultado"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Endereços do cliente</title>
    </head>
    <body>
        	<%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarClientes?acao=consultarPorID&id=" + id);
			return;
		}
	%>

       
 <%
                         List<Cliente> clientes = (List) resultado.getEntidades();
                         
                         if(clientes.size() == 0) {
                            out.print("Nenhum endereco cadastrado");
                        } else {
                            for (Cliente cliente : clientes) {
                                %>
                <table border='1'>
                    <thead>
                        <tr><h4>Endereços de cobrança</h4></tr>
                       <tr>
                                <th>#<th>Logradouro</th><th>Bairro</th><th>CEP</th><th>Numero</th><th>Cidade</th><th>UF</th><th>País</th>
                                <th>Tipo de logradouro</th><th>Complemento</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value=" + cliente.getId() + " /></td>");
                                out.println("<td>" + cliente.getEndereco().getLogradouro()+ "</td>");
                                out.println("<td>" + cliente.getEndereco().getBairro()+ "</td>");
                                out.println("<td>" + cliente.getEndereco().getCep()+ "</td>");
                                out.println("<td>" + cliente.getEndereco().getNumero()+ "</td>");
                                out.println("<td>" + cliente.getEndereco().getCidade()+ "</td>");
                                out.println("<td>" + cliente.getEndereco().getUf()+ "</td>");
                                out.println("<td>" + cliente.getEndereco().getPais()+ "</td>");
                                out.println("<td>" + cliente.getEndereco().getTipoLogradouro()+ "</td>");
                                out.println("<td>" + cliente.getEndereco().getComplemento()+ "</td>");
                                out.println("</tr>");       
                            }
                         }                       
                    %>
            </tbody>
        </table>


            
        <a href='listar_clientes.jsp'>Voltar</a>
        <br><br>
    </body>
</html>
