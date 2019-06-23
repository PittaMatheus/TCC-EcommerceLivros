<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
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
                }else { 
                    
                    String mensagem = (String) resultado.getMensagem();

                    if (mensagem != null) {
                        out.println(mensagem);
                    }

                   for (Cliente cliente : clientes) {
                       

	%>
        
        
        <form action="AlterarCliente" method="POST">
            <br><br>      
            <input type="hidden" name="id" id="id" value="<%= cliente.getId() %>">
            <input type="hidden" name="cep" id="cep" value="<%= cliente.getEndereco().getCep()%>">
            <input type="hidden" name="cidade" id="cidade" value="<%= cliente.getEndereco().getCidade()%>">
            <input type="hidden" name="bairro" id="bairro" value="<%= cliente.getEndereco().getBairro()%>">
            <input type="hidden" name="uf" id="uf"value="<%= cliente.getEndereco().getUf()%>">
            <input type="hidden" name="logradouro" id="logradouro" value="<%= cliente.getEndereco().getLogradouro()%>">
            <input type="hidden" name="numero" id="numero" value="<%= cliente.getEndereco().getNumero()%>">
                
            
            <label for="nome" data-error="Informe o nome!">Nome</label>
            <input type="text" name="nome" id="nome" value="<%= cliente.getNome()%>" class="validate" required>

            <label for="sobrenome" data-error="Informe o sobrenome!" >Sobrenome</label>
            <input type="text" name="sobrenome" id="sobrenome" value="<%= cliente.getSobrenome()%>" class="validate" required>
            <br><br>
            
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
           <br><br>
            
            <label for="cpf" data-error="Informe o CPF!">CPF</label>
            <input type="text" name="cpf" id="cpf" value="<%= cliente.getCpf() %>" required readonly>

            <label for="rg" data-error="Informe o RG!" >RG</label>
            <input type="text" name="rg" id="rg" value="<%= cliente.getRg()%>" required readonly>
            <br><br>
            
            <label for="data_nascimento" data-error="Informe a data de nascimento!" >Data de nascimento</label>
            <input type="text" name="data_nascimento" id="data_nascimento" value="<%= FormatadorData.formatarData(cliente.getData_nascimento())%>"class="validate"  required>
            <br><br>

            <label for="email" data-error="Informe o email!" >Email</label>
            <input type="email" name="email" id="email" value="<%= cliente.getEmail()%>" class="validate" required>
            <br><br>
            
            <label for="senha" data-error="informe a senha">Senha</label>
            <input type="password" name="senha" id="senha">
            <label for="senhaConfirmada" data-error="informe a senha">Confirme a senha</label>            
            <input type="password" name="senhaConfirmada" id="senhaConfirmada">       
            
            <input type="submit" name="acao" value="alterar" class="btn btn-success">                                  
        </form>
                <%}
            }%>
    </body>
    <br><br>
    <a href="home.jsp">Voltar</a>
</html>