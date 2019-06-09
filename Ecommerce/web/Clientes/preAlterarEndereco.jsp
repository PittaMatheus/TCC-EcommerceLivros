<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.cliente.Endereco"%>
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
        <title>Alterar endereco</title>
    </head>
    <body>
         <%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/AlterarEndereco?acao=consultarPorID&id=" + id);
			return;
		}

                         List<Endereco> enderecos = (List) resultado.getEntidades();
                         
                         if(enderecos.size() == 0) {
                            out.print("Erro");                   
                        } else { %>
                        <!-- NAV FIXO DO TOPO-->
                        <form action="AlterarEndereco" name="acao" value="alterar" method="POST">
                        <div class="navbar-fixed indigo darken-4">
                            <nav>
                                <div class="nav-wrapper indigo darken-4">
                                  <a href="#" class="brand-logo center maiusculo">Alterar dados do endereço de entrega</a>
                                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                                      <li> <button type="submit" name="acao" value="alterar" class="btn-border"><i class='material-icons left'>done</i>Alterar dados</button>                    
                                  </ul>                  
                                  <ul class="left">
                                      <li><a href="listar_clientes.jsp"><i class="material-icons">arrow_back</i></a></li>
                                  </ul>
                                </div>
                            </nav>
                        </div>
                        <br> <br> <br> <br>
                        <div class ="container row">
                            <% for (Endereco endereco : enderecos) { %>

                            <div class="input-field col s5">
                                <label for="tipoLogradouro" data-error="Informe o tipo do endereco" >Endereço de: </label>
                                <select id="tipoLogradouro" name="tipoLogradouro" class="validate"   >
                                    <option value="" disabled >Tipo de logradouro</option>
                                    <option value="vila"selected>Vila</option>
                                    <option value="estrada">Estrada</option>
                                    <option value="fazenda">Fazenda</option>
                                    <option value="sitio">Sitio</option>
                                    <option value="condominio">Condominio</option> 
                                </select>
                            </div>
                                                   
                            <input type="hidden" value="<%= endereco.getId()%>" name="id" id="id" required>    

                            <div class="input-field col s5">
                                <label for="cep" >CEP</label>                            
                                <input type="text" value="<%= endereco.getCep()%>" name="cep" id="cep" required>
                            </div>
                            
                            <div class="input-field col s2">
                                <button type="button" value="buscarCep>" class="btn"/>Buscar CEP</button>
                            </div>
                            
                            <div class="input-field col s4">
                                <label for="cidade" data-error="Informe a cidade!" >Cidade</label>
                                <input type="text" value="<%= endereco.getCidade()%>" name="cidade" id="cidade"required>
                            </div>

                            <div class="input-field col s4">
                                <label for="bairro" data-error="Informe a bairro!" >Bairro</label>
                                <input type="text" value="<%= endereco.getBairro()%>" name="bairro" id="bairro"required>
                            </div>
                            
                            <div class="input-field col s4">
                                <label for="uf" data-error="Informe o estado!" >Estado</label>
                                <input type="text" value="<%= endereco.getUf()%>" name="uf" id="uf"required>
                            </div>

                            <div class="input-field col s5">
                                <label for="logradouro" data-error="Informe o endereço!">Endereço</label>
                                <input type="text" value="<%= endereco.getLogradouro()%>" name="logradouro" id="logradouro" required>
                            </div>
                            
                            <div class="input-field col s5">
                                <label for="complemento" data-error="Informe o complemento!">Complemento</label>
                                <input type="text" value="<%= endereco.getComplemento()%>" name="complemento" id="complemento">
                            </div>

                            <div class="input-field col s2">
                                <label for="numero" data-error="Informe o numero da casa!">Nº</label>
                                <input type="text" value="<%= endereco.getNumero()%>" name="numero" id="numero"required>
                            </div>
                            
                           
                            
                            <div class="input-field col s6">
                                <label for="nomeEndereco" data-error="Informe o nome do endereco!">Nome do endereço: (Ex: Casa da avó)</label>
                                <input type="text" value="<%= endereco.getNomeEndereco()%>" name="nomeEndereco" id="nomeEndereco">
                            </div>
                            
                            <div class="input-field col s6">
                                <label for="referencia"">(Opcional)Ponto de referência Ex: Proximo ao mercado X)</label>
                                <input type="text" value=
                                       "<%=endereco.getReferencia()%>" 
                                       name="referencia" id="referencia">
                            </div>
     

                        </form>
             <%
                                            }
                         }        %>
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
