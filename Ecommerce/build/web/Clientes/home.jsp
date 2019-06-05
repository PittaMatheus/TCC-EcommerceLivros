<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/Custom.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%  
            if(session.getAttribute("usuarioLogado") == null){
                response.sendRedirect("../login.jsp");
            }else if(session.getAttribute("usuarioLogado") != null){
                Resultado resultado = (Resultado) session.getAttribute("usuarioLogado");    
                List<Cliente> clientes = (List) resultado.getEntidades();
                        if(resultado != null) {
                             if(clientes.size() == 0) {
                                response.sendRedirect("../login.jsp");
                            } else {
                               for (Cliente cliente : clientes) {         
                                 //out.print("Seja bem vindo " + cliente.getNome());
                                 %>
          
         
        <!-- MENU DO ISISTEMA-->
        <ul id="slide-out" class="side-nav espaco">
            <li><div class="user-view">
                <div class="background black"></div>
                    <a href="#!user"><img class="circle" src="../imagens/borja.jpg"></a>
                    <a href="#!name"><span class="white-text name"><%= cliente.getNome()%></span></a>
                    <a href="#!email"><span class="white-text email"><%= cliente.getEmail()%></span></a>
                </div>
            </li>
            
            <%
                //Cliente com perfil de ADM
                if(cliente.getPapel().getId() == 2){ 
            %>
            
            <li class="white">
                <ul class="collapsible collapsible-accordion">
                    <li>
                      <a class="collapsible-header"><i class="material-icons">folder_special</i>Gerencia de clientes <i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
                      <div class="collapsible-body">
                        <ul>
                          <li><a class="" href='listar_clientes.jsp'><i class="material-icons">fullscreen</i>Listar clientes</a></li>
                          <li><a class="" href='listar_clientes.jsp'><i class="material-icons">fullscreen</i>Desativar clientes</a></li>
                           <li><a class="" href='listar_clientesInativos.jsp'><i class="material-icons">fullscreen</i>Ativar clientes</a></li>
                          <li><div class="divider"></div></li>
                        </ul>
                      </div>
                    </li>
                </ul>
            </li>
            
            <li class="white">
                <ul class="collapsible collapsible-accordion">
                    <li>
                      <a class="collapsible-header"><i class="material-icons">folder_special</i>Gerencia de livros<i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
                      <div class="collapsible-body">
                        <ul>
                          <li><a class="" href='../Livros/cadastro_livro.jsp'><i class="material-icons">fullscreen</i>Cadastrar livro</a></li>
                          <li><a class="" href='../Livros/listar_livros.jsp'><i class="material-icons">fullscreen</i>Desativar livro</a></li>
                          <li><a class="" href='../Livros/listar_livrosInativos.jsp'><i class="material-icons">fullscreen</i>Ativar livro</a></li>
                          <li><a class="" href='../Livros/listar_categorias.jsp'><i class="material-icons">fullscreen</i>Listar Categorias de livro</a></li>
                          <li><a class="" href='../Livros/listar_livrosInativos.jsp'><i class="material-icons">fullscreen</i>Ativar livro</a></li>
                          <li><a class="" href='../Livros/cadastro_grupoLivro.jsp'><i class="material-icons">fullscreen</i>Inserir grupo de precificação</a></li>
                          <li><a class="" href='../Livros/listar_grupoPrecificacao.jsp'><i class="material-icons">fullscreen</i>Listar grupo de precificação</a></li>
                          <li><div class="divider"></div></li>
                        </ul>
                      </div>
                    </li>
                </ul>
            </li>
            
            <li class="white">
                <ul class="collapsible collapsible-accordion">
                    <li>
                      <a class="collapsible-header"><i class="material-icons">folder_special</i>Gerencia de pedidos<i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
                      <div class="collapsible-body">
                        <ul>
                          <li><a class="" href='../adm/listar_pedidos.jsp'><i class="material-icons">fullscreen</i>Ver pedidos</a></li>
                          <li><a class="" href='../adm/listar_pedidos.jsp'><i class="material-icons">fullscreen</i>Gerenciar pedidos</a></li>
                          <li><a class="" href='../adm/listar_SolicitacaoTrocas.jsp'><i class="material-icons">fullscreen</i>Ver Solicitações de trocas </a></li>
                          <li><a class="" href='#'><i class="material-icons">fullscreen</i>Gerenciar trocas</a></li>
                          <li><a class="" href='#'><i class="material-icons">fullscreen</i>Editar meu perfil</a></li>
                          <li><div class="divider"></div></li>
                        </ul>
                      </div>
                    </li>
                </ul>
            </li>
            
            <li class="white">
                <ul class="collapsible collapsible-accordion">
                    <li>
                      <a class="collapsible-header"><i class="material-icons">folder_special</i>Gerencia de estoque<i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
                      <div class="collapsible-body">
                        <ul>
                          <li><a class="" href='../Estoque/entrada_estoqueLivro.jsp'><i class="material-icons">fullscreen</i>Entrada em estoque de livro</a></li>
                          <li><a class="" href='../Estoque/listar_estoqueLivros.jsp'><i class="material-icons">fullscreen</i>Listar estoque de livro</a></li>
                          <li><a class="" href='../Estoque/listar_fornecedores.jsp'><i class="material-icons">fullscreen</i>Listar fornecedores</a></li>
                          <li><div class="divider"></div></li>
                        </ul>
                      </div>
                    </li>
                </ul>
            </li>
            
            
            <%
                }
             // Perfil comum
             else if(cliente.getPapel().getId() == 1){ %>
             
             
            <li class="white">
                <ul class="collapsible collapsible-accordion">
                    <li>
                      <a class="collapsible-header"><i class="material-icons">folder_special</i>Ações<i class="material-icons right" style="margin-right:0;">arrow_drop_down</i></a>
                      <div class="collapsible-body">
                        <ul>
                          <li><a class="" href='../Livros/prateleira.jsp'><i class="material-icons">fullscreen</i>Home</a></li>
                          <li><a class="" href='ListarCupomTroca.jsp'><i class="material-icons">fullscreen</i>Ver Cupons de troca</a></li>
                          <li><a class="" href='../Pedidos/carrinho.jsp?u=<%=cliente.getId()%>'><i class="material-icons">fullscreen</i>Ver carrinho</a></li>
                          <li><a class="" href='../Clientes/listar_meusPedidos.jsp'><i class="material-icons">fullscreen</i>Ver pedidos</a></li>
                          <li><a class="" href='#'><i class="material-icons">fullscreen</i>Solicitar troca</a></li>
                          <li><a class="" href='#'><i class="material-icons">fullscreen</i>Consultar andamento da troca</a></li>
                          <li><a class="" href='#'><i class="material-icons">fullscreen</i>Consultar pontos acumulativos</a></li>
                          <li><a class="" href='preAlterar_cliente.jsp?id=<%=cliente.getId()%>'><i class="material-icons">fullscreen</i>Editar meu perfil</a></li>
                          <li><div class="divider"></div></li>
                        </ul>
                      </div>
                    </li>
                </ul>
            </li>
                                    <%
                                     }
                        }
            }
        }
    }
         %>
         
            <li class="white">
                <ul class="collapsible collapsible-accordion">
                    <li>
                        <a class="collapsible-header" href='/Ecommerce/LogoutCliente?acao=logout'><i class="material-icons">close</i>Sair</a>
                    </li>
                </ul>
            </li>
        </ul>
         
         
         
<!--            TOPO DO SITE 
       <div class="navbar-fixed">
            <nav class=" indigo darken-4">
                <div class="nav-wrapper indigo darken-4">
                     <h3>LIVROS BORJA</h3>
                     LISTA DO LADO ESQUERDO 
                    <ul>
                        <li>
                             BOTAO FLUTUANTE 
                             
                        </li>
                      
                    </ul>
                </div>
            </nav>
        </div>-->
          
          <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
       
         
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
