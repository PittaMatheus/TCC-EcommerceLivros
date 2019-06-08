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
         <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
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
                }else { 
                    
                    String mensagem = (String) resultado.getMensagem();

                    if (mensagem != null) {
                        //out.println(mensagem);
                    }

                   for (Cliente cliente : clientes) {
                       

	%>
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
          <form action="AlterarCliente" method="POST">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Alterar Dados pessoais</a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                      <li><button type="submit" class="btn-border" name="acao" value="alterar"><i class="material-icons left">done</i>Alterar dados</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
        <br> <br> <br> <br>
        <div class="container row">
            <input type="hidden" name="id" id="id" value="<%= cliente.getId() %>">
            <input type="hidden" name="cep" id="cep" value="<%= cliente.getEndereco().getCep()%>">
            <input type="hidden" name="cidade" id="cidade" value="<%= cliente.getEndereco().getCidade()%>">
            <input type="hidden" name="bairro" id="bairro" value="<%= cliente.getEndereco().getBairro()%>">
            <input type="hidden" name="uf" id="uf"value="<%= cliente.getEndereco().getUf()%>">
            <input type="hidden" name="logradouro" id="logradouro" value="<%= cliente.getEndereco().getLogradouro()%>">
            <input type="hidden" name="numero" id="numero" value="<%= cliente.getEndereco().getNumero()%>">
            
            <div class="input-field col s6">
                <label for="nome" data-error="Informe o nome!">Nome</label>
                <input type="text" name="nome" id="nome" value="<%= cliente.getNome()%>" class="validate" required>
            </div>
            
            <div class="input-field col s6">
                <label for="sobrenome" data-error="Informe o sobrenome!" >Sobrenome</label>
                <input type="text" name="sobrenome" id="sobrenome" value="<%= cliente.getSobrenome()%>" class="validate" required>
            </div>
            
            <div class="input-field col s4">
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
            </div>
            
            <div class="input-field col s4">
                <label for="cpf" data-error="Informe o CPF!">CPF</label>
                <input type="text" name="cpf" id="cpf" value="<%= cliente.getCpf() %>" required readonly>
            </div>
            
            <div class="input-field col s4">
                <label for="rg" data-error="Informe o RG!" >RG</label>
                <input type="text" name="rg" id="rg" value="<%= cliente.getRg()%>" required readonly>
            </div>
            
            <div class="input-field col s6">
                <label for="data_nascimento" data-error="Informe a data de nascimento!" >Data de nascimento</label>
                <input type="text" name="data_nascimento" id="data_nascimento" value="<%= FormatadorData.formatarData(cliente.getData_nascimento())%>"class="validate"  required>
            </div>
            
            <div class="input-field col s6">
                <label for="email" data-error="Informe o email!" >Email</label>
                <input type="email" name="email" id="email" value="<%= cliente.getEmail()%>" class="validate" required>
            </div>
            
            <div class="input-field col s12 center">
                <h5 class="forma_redonda_vermelho">Deseja alterar a senha</h5>
                <br>
            </div>
            
            <div class="input-field col s6">
                <label for="senha" data-error="Informe a senha" >Senha</label>
                <input type="password" name="senha" id="senha" value="<%=cliente.getSenha()%>" class="validate" required>
            </div>
            
            <div class="input-field col s6">
                <label for="senhaConfirmada" data-error="Informe a senha confirmada">Confirme a senha</label>
                <input type="password" name="senhaConfirmada" id="senhaConfirmada" value="<%=cliente.getSenha()%>" class="validate" required>                       
            </div>
        </div>
        </form>
                <%}
            }%>
            <br>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    </body>
</html>