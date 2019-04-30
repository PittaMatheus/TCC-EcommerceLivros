<%-- 
    Document   : confirmaDadosCompra
    Created on : Apr 28, 2019, 10:15:33 AM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cartao"%>
<%@page import="ecommerce.dominio.cliente.Endereco"%>
<%@page import="java.util.List"%>
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
        <h1>Confirme seus dados para realizar a compra</h1>
        <%
            String id_livro = request.getParameter("l");
            String id_usuario = request.getParameter("id");


            Resultado resultado = (Resultado) request.getAttribute("resultado");
            if(resultado == null) {
                response.sendRedirect(request.getContextPath() + "/Clientes/ListarEndereco?acao=listar&id=" + id_usuario + "&conf=1");
            }
            else{
             List<Endereco> enderecos = (List) resultado.getEntidades();
              
                         if(enderecos.size() == 0) {
                            out.print("Nenhum endereco cadastrado");
                        } else {
                            for (Endereco endereco : enderecos) {
  
                                %>
            <form action="AuxilioPedido" method="POST">
                <table border='1'>
                    <thead>
                        <%
                            if(endereco.getTipoEndereco().equals("0")){         
                        %>
                            <tr><h4>Endereço de Entrega</h4></tr>
                       
                       <tr>
                                <th>#<th>Logradouro</th><th>Bairro</th><th>CEP</th><th>Numero</th><th>Cidade</th><th>UF</th>
                                <th>Tipo de logradouro</th><th>Complemento</th><th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id_endereco' value=" + endereco.getId() + " /></td>");
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
                         }     
            }
                    %>
                    <br> <br> <br>
                    <input type="submit">
                    
                    <input type="hidden" name="u" value="<%=id_usuario%>">
            </form>

                      

    </body>
</html>
