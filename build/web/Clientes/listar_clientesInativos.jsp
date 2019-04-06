<%-- 
    Document   : listar_clientesInativos
    Created on : Mar 29, 2019, 11:43:58 PM
    Author     : matheus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de clientes Inativos</title>
    </head>
    <body>
        <h1>Clientes inativos no sistema</h1>
        	<%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarClientes?acao=listar&status=0");
			return;
		}
	%>
        
        <%
                         List<Cliente> clientes = (List) resultado.getEntidades();
                         
                         if(clientes.size() == 0) {
                            out.print("<br><br>Nenhum cliente cadastrado");
                        } else {
                     %>
                       <form action='AtivarCliente'>
                            <input type='submit' name="acao" value="ativar" />
                            <br><br>
                            <table border='2'>
                                <thead>
                                    <tr>
                                        <th>#</th><th>Nome</th><th>Sobrenome</th><th>Data de nascimento</th><th>Ranking</th><th>EmaIl</th><th>CPF</th><th>RG</th>
                                        <th>Sexo</th><th>Endereços</th><th>Cartões</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                            for (Cliente cliente : clientes) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value=" + cliente.getId() + " /></td>");
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
                <br><br>
        <a href='home.jsp'>Voltar</a>
    </body>
</html>
