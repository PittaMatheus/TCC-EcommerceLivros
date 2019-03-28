<%-- 
    Document   : preAlterar_cliente
    Created on : Mar 28, 2019, 8:20:53 AM
    Author     : matheus
--%>

<%@page import="br.com.fatecmogidascruzes.dominio.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar dados do clientes</title>
    </head>
    <body>
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
                        <select id="sexo" name="sexo"class="validate" value="<%= cliente.getSexo()%>">
                            <% if(cliente.getSexo().equals("M")){
                                %> <option selected value="M">Masculino</option>
                            <%}else{
                                    %><option selected value="F">Feminino</option>
                                   <%}%>
                        </select>
                       
                       
                        
                      
                       


                            
                     <!-- DADOS ENDERECO-->       
                     <br> 
                        <h1>Endereco</h1>
                        <label for="tipoLogradouro" data-error="Informe o tipo do endereco"  >Endereço de: </label>
                        <select id="tipoLogradouro" name="tipoLogradouro"class="validate" value="<% cliente.getEndereco().getTipoLogradouro();%>">
                             <% if(cliente.getEndereco().getTipoLogradouro().equals("vila")){
                                %> <option value="vila" selected>Vila</option>
                            <%}else if(cliente.getEndereco().getTipoLogradouro().equals("estrada")){
                                    %><option selected value="estrada">Estrada</option>
                             <%}else if(cliente.getEndereco().getTipoLogradouro().equals("fazenda")){                           
                                    %>  <option selected value="fazenda">Fazenda</option>
                             <%}else if(cliente.getEndereco().getTipoLogradouro().equals("sitio")){               
                                       %> <option selected value="sitio">Sitio</option>
                            <%}else{          
                                        %> <option selected value="condominio">Condominio</option>   
                                       <%};%>
                        </select>

                            <br>
                        <label for="cep" >CEP</label>                            
                        <input type="text" value="<%= cliente.getEndereco().getCep()%>" name="cep" id="cep" required>
                        
                        <label for="cidade" data-error="Informe a cidade!" >Cidade</label>
                        <input type="text" value="<%= cliente.getEndereco().getCidade()%>" name="cidade" id="cidade"required>


                        <label for="bairro" data-error="Informe a bairro!" >Bairro</label>
                        <input type="text" value="<%= cliente.getEndereco().getBairro()%>" name="bairro" id="bairro"required>
                    
                        <label for="uf" data-error="Informe o estado!" >Estado</label>
                        <input type="text" value="<%= cliente.getEndereco().getUf()%>" name="uf" id="uf"required>
                        
                        <label for="pais" data-error="Informe o pais!" >País</label>
                        <input type="text" value="<%= cliente.getEndereco().getPais()%>" name="pais" id="pais"required>

                        <button type="button" value="Buscar CEP" class="btn col s12 l2"/>Buscar CEP</button>

                        <br>
                        <label for="logradouro" data-error="Informe o endereço!">Endereço</label>
                        <input type="text" value="<%= cliente.getEndereco().getLogradouro()%>"" name="logradouro" id="logradouro" required>
                        
                        <label for="numero" data-error="Informe o numero da casa!">Nº</label>
                        <input type="text" value="<%= cliente.getEndereco().getNumero()%>" name="numero" id="numero"required>

                        <% if(cliente.getEndereco().getComplemento() != null){ %>
                            <label for="complemento" data-error="Informe o complemento!">Complemento</label>
                            <input type="text" value="<%= cliente.getEndereco().getComplemento()%>" name="complemento" id="complemento">
                        <% } %>
                       
                                                     
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
