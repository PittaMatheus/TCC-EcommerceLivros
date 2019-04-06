<%-- 
    Document   : tipos_endereco
    Created on : Mar 27, 2019, 11:10:02 AM
    Author     : matheus
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Endereco"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente"%>
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
			response.sendRedirect(request.getContextPath() + "/Clientes/ListarEndereco?acao=listar&id=" + id);
			return;
		}
	%>

       
 <%
                         List<Endereco> enderecos = (List) resultado.getEntidades();
                          
                         if(enderecos.size() == 0) {
                            out.print("Nenhum endereco cadastrado");
                        } else {
                            for (Endereco endereco : enderecos) {
  
                                %>
                <table border='1'>
                    <thead>
                        <%
                            if(endereco.getTipoEndereco().equals("1")){
                        %>
                        <tr><h4>Endereço de cobrança</h4></tr>
                        <% 
                            }else{
                        %>
                            <tr><h4>Endereço de Entrega</h4></tr>
                        <% 
                            }
                        %>
                       <tr>
                                <th>#<th>Logradouro</th><th>Bairro</th><th>CEP</th><th>Numero</th><th>Cidade</th><th>UF</th>
                                <th>Tipo de logradouro</th><th>Complemento</th><th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id' value=" + endereco.getId() + " /></td>");
                                out.println("<td>" + endereco.getLogradouro()+ "</td>");
                                out.println("<td>" + endereco.getBairro()+ "</td>");
                                out.println("<td>" + endereco.getCep()+ "</td>");
                                out.println("<td>" + endereco.getNumero()+ "</td>");
                                out.println("<td>" + endereco.getCidade()+ "</td>");
                                out.println("<td>" + endereco.getUf()+ "</td>");
                                out.println("<td>" + endereco.getTipoLogradouro()+ "</td>");
                                out.println("<td>" + endereco.getComplemento()+ "</td>");
                                out.println("<td><a href='preAlterarEndereco.jsp?id=" + endereco.getId() + "'>Icone editar</a></td>");
                                out.println("</tr>");    
                                %>
                                
            </tbody>
        </table>
      <%                     

                                  
                              
                            }
                         }                 
                    %>
                    <br> <br> <br>
                    <%
                     out.println("<a href='cadastro_endereco.jsp?id=" + id + "' >Adicionar Endereco</a>");
                    %>
                    <br> <br> <br>
                    <a href='listar_clientes.jsp?'>Voltar</a>
        <br><br>
    </body>
</html>
