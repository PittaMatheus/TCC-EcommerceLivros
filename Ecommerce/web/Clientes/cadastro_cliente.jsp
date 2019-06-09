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
         <!-- CSS CAROUSEL-->
         <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css" media="screen,projection"/>
         <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css" media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastre -se </title>
    </head>
    <body>
        
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <form action="InserirCliente" name="acao" value="inserir">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">cadastro de cliente</a>
                  <ul id="nav-mobile" class="right">
                      <li> <button type="submit" name="acao" value="inserir" class="btn-border"><i class='material-icons left'>done</i>Cadastrar cliente</button></li>                    
                  </ul>             
                  <ul class="left">
                      <li><a href="../index.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
            </nav>
        </div>
        <br> <br> <br>

                <%
                Resultado resultado = (Resultado) request.getAttribute("resultado");
                if(resultado != null) {
                        if(!resultado.isStatus() && !resultado.getMensagem().isEmpty()) {
                                out.print("<div class='container'><h5 class='forma_redonda_vermelho  negrito center'>Atenção com os campos</h5><div class='card-panel grey lighten-2'>");
                                out.print(resultado.getMensagem());
                                out.print("</div></div><br>");
                        } else {
                                if(!resultado.getMensagem().isEmpty()) {
                                        out.print("<div class=container card-panel teal lighten-2'>");
                                        out.print(resultado.getMensagem());
                                        out.print("</div>");
                                }
                        }
                }
            %>
        <div class ="container row">
        <!-- Clientes/InserirCliente?nome=edner&sobrenome=SobrenomeTeste&cpf=41656190869&rg=329702760&data_nascimento=12%2F01%2F1995&email=emailteste%40teste.com&numTelefone=47223322&senha=SenhaValida%21%40%23&senhaConfirmada=SenhaValida%21%40%23&sexo=M&tipoEndereco=cobranca&tipoLogradouro=vila&cep=12312312312312&cidade=Mogi&bairro=cubas&uf=SP&pais=brasil&logradouro=Rua+tranças+do+rei+careca&numero=12312&complemento=apt+2&nomeEndereco=Casa+da+avó&acao=inserir -->
        <h5 class="forma_redonda negrito center">Dados pessoais</h5>
        <br>
            <div class="input-field col s12 l6">
                <label for="nome" data-error="Informe o nome!">Nome</label>
                <input type="text" name="nome" id="nome" value="NomeTeste" class="validate" required>
            </div>
        
            <div class="input-field col s12 l6">
                <label for="sobrenome" data-error="Informe o sobrenome!" >Sobrenome</label>
                <input type="text" name="sobrenome" id="sobrenome" value="SobrenomeTeste" class="validate" required>
            </div> 
        
            <div class="input-field col s12 l6">
                <label for="cpf" data-error="Informe o CPF!">CPF</label>
                <input type="text" name="cpf" id="cpf" value="41656190869" class="validate" required>
            </div>
        
            <div class="input-field col s12 l6">
                <label for="rg" data-error="Informe o RG!" >RG</label>
                <input type="text" name="rg" id="rg" value="329702760" class="validate" required>
            </div>
        
            <div class="input-field col s12 l4">
                <label for="data_nascimento" data-error="Informe a data de nascimento!" >Data de nascimento</label>
                <input type="text" name="data_nascimento" id="data_nascimento" value="12/01/1995"class="validate"  required>
            </div>   
        
            <div class="input-field col s12 l4">
                <label for="email" data-error="Informe o email!" >Email</label>
                <input type="email" name="email" id="email" value="emailteste@teste.com" class="validate" required>
            </div>
        
            <div class="input-field col s12 l4">
                <label for="telefone" data-error="Informe o telefone!" >Telefone</label>
                <input type="text" name="numTelefone" id="numTelefone" value="47223322" class="validate" required>
            </div> 
        
            <div class="input-field col s12 l6">           
                <label for="senha" data-error="Informe a senha" >Senha</label>
                <input type="password" name="senha" id="senha" value="SenhaValida!@#" class="validate" required>
            </div>
        
            <div class="input-field col s12 l6">           
                <label for="senhaConfirmada" data-error="Informe a senha confirmada">Confirme a senha</label>
                <input type="password" name="senhaConfirmada" id="senhaConfirmada" value="SenhaValida!@#" class="validate" required>                       
            </div> 
        
            <div class="input-field col s12">
                <select id="sexo" name="sexo"class="validate">
                    <option value="" disabled selected> ESCOLHA O SEXO </option>
                    <option value="M" selected>Masculino</option>
                    <option value="F">Feminino</option>
                </select>
            </div>
        </div>
        <br><br>
         <div class ="container row">
         <!-- DADOS ENDERECO--> 
            <h5 class="forma_redonda negrito center">Dados do endereço</h5>
               <br>
               <div class="input-field col s6">
                   <select id="tipoEndereco" name="tipoEndereco" class="validate" value="${param['tipoEndereco']}">
                       <option value="" disabled >Escolha o tipo</option>
                       <option value="cobranca" selected>Cobrança</option>
                       <option value="entrega">Entrega</option>
                   </select>
                       <label>Tipo de Endereco:</label>
               </div>

               <div class="input-field col s4">
                   <label for="cep" >CEP</label>                            
                   <input type="text" value="12312312312312" name="cep" id="cep" required>
               </div>

               <div class="input-field col s2">
                 <button type="button" value="Buscar CEP" class="btn indigo darken-4"/>Buscar CEP</button>
               </div>

                <div class="input-field col s6">
                   <select id="tipoLogradouro" name="tipoLogradouro"class="validate" value="${param['tipoLogradouro']}"  >
                       <option value="" disabled>Escolha o tipo</option>
                       <option value="vila" selected>Vila</option>
                       <option value="estrada">Estrada</option>
                       <option value="fazenda">Fazenda</option>
                       <option value="sitio">Sitio</option>
                       <option value="condominio">Condominio</option>                         
                   </select>
                   <label>Tipo de Logradouro:</label>
                </div>

               <div class="input-field col s6">
                   <label for="cidade" data-error="Informe a cidade!" >Cidade</label>
                   <input type="text" value="Mogi" name="cidade" id="cidade"required>
               </div>

               <div class="input-field col s5">
                   <label for="bairro" data-error="Informe a bairro!" >Bairro</label>
                   <input type="text" value="cubas" name="bairro" id="bairro"required>
               </div>

               <div class="input-field col s2">
                   <label for="uf" data-error="Informe o estado!" >Estado</label>
                   <input type="text" value="SP" name="uf" id="uf"required>
               </div>

               <div class="input-field col s5">
                   <label for="pais" data-error="Informe o pais!" >País</label>
                   <input type="text" value="brasil" name="pais" id="pais"required>
               </div>

               <div class="input-field col s10">
                   <label for="logradouro" data-error="Informe o endereço!">Endereço</label>
                   <input type="text" value="Rua tranças do rei careca" name="logradouro" id="logradouro" required>
               </div>

               <div class="input-field col s2">
                   <label for="numero" data-error="Informe o numero da casa!">Nº</label>
                   <input type="text" value="12312" name="numero" id="numero"required>
               </div>

               <div class="input-field col s6">
                   <label for="complemento" data-error="Informe o complemento!">Complemento</label>
                   <input type="text" value="apt 2" name="complemento" id="complemento">
               </div>

               <div class="input-field col s6">
                   <label for="nomeEndereco" data-error="Informe o nome do endereco!">Nome do endereço: (Ex: Casa da avó)</label>
                   <input type="text" value="Casa da avó" name="nomeEndereco" id="nomeEndereco">
               </div>
            </form>
        </div>
   
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../js/materialize.min.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        
    </body>
</html>
