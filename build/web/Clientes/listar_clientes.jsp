<%-- 
    Document   : listar_clientes
    Created on : Mar 26, 2019, 8:16:16 AM
    Author     : matheus
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <!-- Compiled and minified CSS -->
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"> -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listagem de clientes</title>
    </head>
    <body>
        	<%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarClientes?acao=listar&status=1");
			return;
		}
	%>
        
    
    
  
        
                     <%
                         List<Cliente> clientes = (List) resultado.getEntidades();
                         
                         if(clientes.size() == 0) {
                            out.print("<br><br>Nenhum cliente cadastrado");
                        } else {
                     %>
                       
                <div class ="container">
                    <h3>Dados dos clientes</h3>
                    <form action='DesativarCliente'>
                        <input type='submit' name="acao" value="desativar" />
                            <table border="1" class="highlight striped centered responsive-table">
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
                                out.println("<td><a href='preAlterar_cliente.jsp?id=" + cliente.getId()+ "'> " + cliente.getNome()+ " </a></td>");                                
                                out.println("<td>" + cliente.getSobrenome()+ "</td>");
                                
                                SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                                String dataFormatNasc = formato.format(cliente.getData_nascimento());
                                
                                out.println("<td>" + dataFormatNasc + " </td>");
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
                            </div>
    </form>
                <br><br>
        <a href='../index.html'>Voltar</a>
         <!-- Compiled and minified JavaScript -->
        <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script> -->
    </body>
</html>
