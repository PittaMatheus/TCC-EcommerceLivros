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
        <title>Adicionar endereco de entrega</title>
    </head>
    <body>
        <% String id = request.getParameter("id");%>
        <!-- NAV FIXO DO TOPO-->
        <form action="InserirEndereco" name="acao" value="inserir" method="POST">
        <div class="navbar-fixed indigo darken-4">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">cadastrar Novo endereco de entrega</a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                      <li> <button type="submit" name="acao" value="inserir" class="btn-border"><i class='material-icons left'>done</i>Cadastrar endereço</button>                    
                  </ul>
                  <ul class="left">
                      <li><a href="listar_clientes.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
            </nav>
        </div>
        <br> <br> <br> <br>
        <div class ="container row">
            <div class="input-field col s5">
                <label for="tipoLogradouro" data-error="Informe o tipo do endereco"  >Endereço de: </label>
                <select id="tipoLogradouro" name="tipoLogradouro"class="validate"   >
                    <option value="" disabled >Tipo de logradouro</option>
                    <option value="vila"selected>Vila</option>
                    <option value="estrada">Estrada</option>
                    <option value="fazenda">Fazenda</option>
                    <option value="sitio">Sitio</option>
                    <option value="condominio">Condominio</option>
                </select>
            </div>
                                     
            <input type="hidden" value="<%= id %>" name="id" id="id" required>    
            
            <div class="input-field col s5">
                <label for="cep" >CEP</label>                            
                <input type="text" value="09870-090" name="cep" id="cep" required>
            </div>
            
            <div class="input-field col s2">
                <button type="button" value="Buscar CEP" class="btn"/>Buscar CEP</button>
            </div>
            
            <div class="input-field col s3">
                <label for="cidade" data-error="Informe a cidade!" >Cidade</label>
                <input type="text" value="Mogi das cruzes" name="cidade" id="cidade"required>
            </div>

            <div class="input-field col s3">
                <label for="bairro" data-error="Informe a bairro!" >Bairro</label>
                <input type="text" value="cubas" name="bairro" id="bairro"required>
            </div>

            <div class="input-field col s3">
                <label for="uf" data-error="Informe o estado!" >Estado</label>
                <input type="text" value="SP" name="uf" id="uf"required>
            </div>
            
            <div class="input-field col s3">
                <label for="pais" data-error="Informe o pais!" >País</label>
                <input type="text" value="Brasil" name="pais" id="pais"required>
            </div>
            
            <div class="input-field col s5">
                <label for="logradouro" data-error="Informe o endereço!">Endereço</label>
                <input type="text" value="A.V brasil" name="logradouro" id="logradouro" required>
            </div>
            
             <div class="input-field col s5">
                <label for="complemento" data-error="Informe o complemento!">Complemento</label>
                <input type="text" value="Apt 22" name="complemento" id="complemento">
            </div>
            
            <div class="input-field col s2">
                <label for="numero" data-error="Informe o numero da casa!">Nº</label>
                <input type="text" value="664" name="numero" id="numero"required>
            </div>
            
            <div class="input-field col s6">
                <label for="nomeEndereco" data-error="Informe o nome do endereco!">Nome do endereço: (Ex: Casa da avó)</label>
                <input type="text" value="Casa da vó" name="nomeEndereco" id="nomeEndereco">
            </div>
            
            <div class="input-field col s6">
                <label for="referencia"">(Opcional)Ponto de referência Ex: Proximo ao mercado X)</label>
                <input type="text" value="Proximo ao mercado" name="referencia" id="referencia">
            </div>   

        </form>
  
        
        </div>
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
