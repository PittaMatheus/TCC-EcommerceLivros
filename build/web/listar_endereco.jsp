<%-- 
    Document   : tipos_endereco
    Created on : Mar 26, 2019, 11:34:26 AM
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
			response.sendRedirect(request.getContextPath() + "/ListarEndereco?acao=listar&id=" + id);
			return;
		}
	%>

       <table border='1'>
            <thead>
                <tr><h4>Endereços de entrega</h4></tr>
                <tr>
                     <th>#</th><th>Logradouro</th> <th>Numero</th><th>Cep</th><th>Bairro</th><th>Cidade</th><th>Estado</th>
                </tr>
            </thead>
            <tbody>
 <%
                         List<Endereco> enderecos = (List) resultado.getEntidades();
                         
                         if(enderecos.size() == 0) {
                            out.print("<tr");
                            out.print("<td colspan='3'>Nenhum endereco cadastrado</td>");
                            out.print("</tr>");
                        } else {
                            for (Endereco endereco : enderecos) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value=" + endereco.getId() + " /></td>");
                                out.println("<td>" + endereco.getLogradouro()+ "</td>");
                                out.println("<td>" + endereco.getNumero()+ "</td>");
                                out.println("<td>" + endereco.getCep()+ "</td>");
                                out.println("<td>" + endereco.getBairro()+ "</td>");   
                                out.println("<td>" + endereco.getCidade()+ "</td>");   
                                out.println("<td>" + endereco.getUf()+ "</td>");   
                                
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
