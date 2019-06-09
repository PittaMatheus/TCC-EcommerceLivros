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
        <title>Adicionar cartão</title>
    </head>
    <body>

        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <form action="InserirCartao" name="acao" value="inserir" method="POST">
                    <% String id = request.getParameter("id");%>
            <input type="hidden" value="<%= id %>" name="id" id="id" required> 
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Cadastrar novo cartão</a>
                  <ul id="nav-mobile" class="right">            
                      <li><button type="submit" name="acao" value="inserir" class="btn-border"><i class='material-icons left'>done</i>Cadastrar cartão</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="listar_clientes.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
        <br> <br> <br> <br> <br>
        <div class ="container row">
            <h5 class="forma_redonda negrito center">Informe os dados do cartão</h5>
            <br>
            <div class="input-field col s6">
                <label for="nomeCartao" data-error="Informe o nome do cartão!" >Nome do cartão:</label>
                <input type="text" value="JOAO DA SILVA" name="nomeCartao" id="nomeCartao"required>
            </div>
            
            <div class="input-field col s6">
                <label for="dtVencimento" data-error="Informe a data Vencimento!" >Data de vencimento</label>
                <input type="text" value="2019-09-09" name="dtVencimento" id="dtValidade"required>
            </div>
            
            <div class="input-field col s6">
                <label for="bandeira" data-error="Informe a Bandeira">Bandeira do cartão: </label>
                <select id="bandeira" name="bandeira"class="validate" value="master ">
                    <option value="" disabled>Bandeira</option>
                    <option value="mastercard" selected >MasterCard</option>
                    <option value="Visa">Visa</option>
                    <option value="elo">Elo</option>

                </select>
            </div>

            <div class="input-field col s4">
                   
                <label for="numeroCartao">Numero do cartão</label>                            
                <input type="text" value="2321321" name="numeroCartao" id="numeroCartao" required>  
            </div>
           
            <div class="input-field col s2">
                <label for="codSeguranca" data-error="Informe o código de segurança!" >Codigo de segurança</label>
                <input type="text" value="033" name="codSeguranca" id="dtValidade"required>
            </div>
        </form>

        
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../js/materialize.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    </body>
</html>
