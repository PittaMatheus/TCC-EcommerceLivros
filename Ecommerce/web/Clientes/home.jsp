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
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="../css/Custom.css"  media="screen,projection"/>
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
          
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo"><img src="https://img.icons8.com/clouds/75/000000/literature.png"></a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="#" data-activates="slide-out"  class="menu"><i class="material-icons">menu</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
         
        <!-- MENU DO SISTEMA-->
        <ul id="slide-out" class="side-nav espaco">
            <li><div class="user-view">
                    <div class="background black">
                        <img src="../imagens/bg.jpg">
                    </div>
                    <a href="#!user">
                        <% 
                        if (cliente.getSexo().equals("M")) {
                            out.println("<img src='https://img.icons8.com/office/48/000000/collaborator-male.png' class='circle'>");
                        }else {
                              out.println("<img src='https://img.icons8.com/office/48/000000/collaborator-female.png' class='circle'>");
                        }%>
                        </a>
                    <a href="#!name"><span class="white-text name"><%= cliente.getNome()%></span></a>
                    <a href="#!email"><span class="white-text email"><%= cliente.getEmail()%></span></a>
                </div>
            </li>
            
            <%
                //Cliente com perfil de ADM
                if(cliente.getPapel().getId() == 2){ 
            %>
            
            <li><a class="collapsible-header" href='../Livros/prateleira.jsp'><i class="material-icons">home</i>Home</a></li>
            <li><div class="divider"></div></li>
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
             
         
                        
            <li><a class="collapsible-header" href='../Livros/prateleira.jsp'><i class="material-icons">home</i>Home</a></li>
            <li><div class="divider"></div></li>
            <li><a class="collapsible-header" href='ListarCupomTroca.jsp'><i class="material-icons">description</i>Ver Cupons de troca</a></li>
            <li><a class="collapsible-header" href='../Pedidos/carrinho.jsp?u=<%=cliente.getId()%>'><i class="material-icons">shopping_cart</i>Ver carrinho</a></li>
            <li><a class="collapsible-header" href='../Clientes/listar_meusPedidos.jsp'><i class="material-icons">library_books</i>Ver pedidos</a></li>
            <li><a class="collapsible-header" href='#'><i class="material-icons">loop</i>Solicitar troca</a></li>
            <li><a class="collapsible-header" href='#'><i class="material-icons">find_in_page</i>Consultar andamento da troca</a></li>
            <li><a class="collapsible-header" href='#'><i class="material-icons">search</i>Consultar pontos acumulativos</a></li>
            <li><a class="collapsible-header" href='preAlterar_cliente.jsp?id=<%=cliente.getId()%>'><i class="material-icons">person</i>Editar meu perfil</a></li>
            
                       
        
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
                        <a class="collapsible-header" href='/Ecommerce/LogoutCliente?acao=logout'><i class="material-icons">power_settings_new</i>Sair</a>
                    </li>
                </ul>
            </li>
        </ul>
       
         <br><br><br>
         <div class="container center">
             <h4 class="forma_redonda_vermelho">A VERDADEIRA HISTORIA DO MUNDIAL DO PALMEIRAS</h4>
             <iframe width="660" height="355" src="https://www.youtube.com/embed/nADbKyhyEsg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
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
