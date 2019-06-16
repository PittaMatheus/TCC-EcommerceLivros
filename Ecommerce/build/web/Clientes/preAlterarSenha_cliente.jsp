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
        <title>Alterar senha do clientes</title>
    </head>
    <body>
        <h2>Alterar senha</h2>
        <%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/PreAlterarSenhaCliente?acao=consultarPorID&id=" + id);
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
        
        
        <form action="AlterarSenhaCliente" method="POST">
            <br><br>      
            <input type="hidden" name="id" id="id" value="<%= cliente.getId() %>">
            <input type="hidden" name="cep" id="cep" value="<%= cliente.getEndereco().getCep()%>">
            <input type="hidden" name="cidade" id="cidade" value="<%= cliente.getEndereco().getCidade()%>">
            <input type="hidden" name="bairro" id="bairro" value="<%= cliente.getEndereco().getBairro()%>">
            <input type="hidden" name="uf" id="uf"value="<%= cliente.getEndereco().getUf()%>">
            <input type="hidden" name="logradouro" id="logradouro" value="<%= cliente.getEndereco().getLogradouro()%>">
            <input type="hidden" name="numero" id="numero" value="<%= cliente.getEndereco().getNumero()%>">
            <input type="hidden" name="nome" id="nome" value="<%= cliente.getNome()%>">
            <input type="hidden" name="sobrenome" id="sobrenome" value="<%= cliente.getSobrenome()%>">
            <input type="hidden" name="sexo" id="sexo" value="<%= cliente.getSexo()%>">
            <input type="hidden" name="cpf" id="cpf" value="<%= cliente.getCpf() %>">
            <input type="hidden" name="rg" id="rg" value="<%= cliente.getRg()%>">
            <input type="hidden" name="data_nascimento" id="data_nascimento" value="<%= FormatadorData.formatarData(cliente.getData_nascimento())%>">
            <input type="hidden" name="email" id="email" value="<%= cliente.getEmail()%>">
            
            <h4>Digite a nova senha.</h4>
            <label for="senha" data-error="Informe a senha" >Nova senha</label>
            <input type="password" name="senha" id="senha" class="validate" required>
            
            <label for="senhaConfirmada" data-error="Informe a senha confirmada">Confirme a senha</label>
            <input type="password" name="senhaConfirmada" id="senhaConfirmada" class="validate" required>                       
            <br>

            <br> <br>                         
           <input type="submit" name="acao" value="alterar" class="btn btn-success">                                  
        </form>
                <%}
            }%>
    </body>
    <br><br>
    <a href="home.jsp">Voltar</a>
</html>