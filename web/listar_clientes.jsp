<%-- 
    Document   : listar_clientes
    Created on : Mar 26, 2019, 8:16:16 AM
    Author     : matheus
--%>

<%@page import="br.com.fatecmogidascruzes.dominio.Resultado"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de clientes</title>
    </head>
    <body>
        	<%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/ListarClientes?acao=listar");
			return;
		}
	%>
        <h1>Lista de clientes</h1>
        
        <!--
                    + "c.numeroCobranca, c.cidadeCobranca, c.ufCobranca, c.paisCobranca, c.tipoLogradouroCobranca, c.complementoCobranca "
                    + "FROM cliente c WHERE c.status = 1");
            ResultSet rs =  declaracao.executeQuery();
        
        
        -->

        <table border='1'>
                <thead>
                    <tr>
                        <th>#</th><th>Nome</th><th>Sobrenome</th><th>Data de nascimento</th><th>Ranking</th><th>EmaIl</th><th>CPF</th><th>RG</th>
                        <th>Sexo</th><th>Logradouro</th><th>Bairro</th><th>CEP</th><th>Numero</th><th>Cidade</th><th>UF</th><th>País</th>
                        <th>Tipo de logradouro</th><th>Complemento</th>
                    </tr>
                </thead>
                <tbody>
                     <%
                         List<Cliente> clientes = (List) resultado.getEntidades();
                         
                         if(clientes.size() == 0) {
                            out.print("<tr");
                            out.print("<td colspan='3'>Nenhum cliente cadastrado</td>");
                            out.print("</tr>");
                        } else {
                            for (Cliente cliente : clientes) {
                                out.println("<tr>");
                                out.println("<td><input type='checkbox' name='id' value=" + cliente.getId() + " /></td>");
                                out.println("<td>" + cliente.getNome() + "</td>");
                                out.println("<td>" + cliente.getSobrenome()+ "</td>");
                                out.println("<td>" + cliente.getData_nascimento()+ "</td>");
                                out.println("<td>" + cliente.getRanking()+ "</td>");
                                out.println("<td>" + cliente.getEmail()+ "</td>");
                                out.println("<td>" + cliente.getCpf()+ "</td>");
                                out.println("<td>" + cliente.getRg()+ "</td>");
                                out.println("<td>" + cliente.getSexo()+ "</td>");
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
            <a href='index.html'>Voltar</a>
    </body>
</html>
