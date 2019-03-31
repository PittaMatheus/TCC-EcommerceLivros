<%-- 
    Document   : preAlterar_cliente
    Created on : Mar 28, 2019, 8:20:53 AM
    Author     : matheus
--%>

<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar dados do clientes</title>
    </head>
    <body>
        <h2>Alterar Dados pessoais</h2>
        <%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/PreAlterarCliente?acao=consultarPorID&id=" + id);
			return;
		}

                         List<Cliente> clientes = (List) resultado.getEntidades();
                         
                         if(clientes.size() == 0) {
                            out.print("Erro");                   
                        } else { 

                            for (Cliente cliente : clientes) {


	%>
        
        
        <form action="AlterarCliente" method="POST">
                   
                        <input type="hidden" name="id" id="id" value="<%= cliente.getId() %>">

                        <label for="nome" data-error="Informe o nome!">Nome</label>
                        <input type="text" name="nome" id="nome" value="<%= cliente.getNome()%>" class="validate" required>
                        
                        <label for="sobrenome" data-error="Informe o sobrenome!" >Sobrenome</label>
                        <input type="text" name="sobrenome" id="sobrenome" value="<%= cliente.getSobrenome()%>" class="validate" required>

                        <label for="cpf" data-error="Informe o CPF!">CPF</label>
                        <input type="text" name="cpf" id="cpf" value="<%= cliente.getCpf() %>" class="validate" required>

                        <label for="rg" data-error="Informe o RG!" >RG</label>
                        <input type="text" name="rg" id="rg" value="<%= cliente.getRg()%>" class="validate" required>

                        <label for="data_nascimento" data-error="Informe a data de nascimento!" >Data de nascimento</label>
                       <input type="text" name="data_nascimento" id="data_nascimento" value="<%= cliente.getData_nascimento()%>"class="validate"  required>
                       <br>
                       <br>
                       <label for="email" data-error="Informe o email!" >Email</label>
                       <input type="email" name="email" id="email" value="<%= cliente.getEmail()%>" class="validate" required>
                       
                       
                        <label for="sexo" data-error="Informe o sexo"  >Sexo:</label>
                        <select id="sexo" name="sexo"class="validate" value="">
                            <% if(cliente.getSexo().equals("M")){
                                %> <option selected value="M">Masculino</option>
                                    <option value="F">Feminino</option>
                            <%}else{
                                    %><option selected value="F">Feminino</option>
                                        <option value="M">Masculino</option>
                                   <%}%>
                        </select>
                       

                        <br> <br> <br> <br>                         
                       <input type="submit" name="acao" value="alterar" class="btn btn-success">                                  
        </form>
                            <%
                                            }
                         }        %>
    </body>
    <br><br>
    <a href="listar_clientes.jsp">Voltar</a>
</html>
