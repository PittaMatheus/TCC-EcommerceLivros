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
        
        <!-- MENU -->
        <ul id="slide-out" class="side-nav">
            <li><div class="user-view">
                <div class="background black"></div>
                    <a href="#!user"><img class="circle" src="../imagens/borja.jpg"></a>
                    <a href="#!name"><span class="white-text name">Miguel Borja</span></a>
                    <a href="#!email"><span class="white-text email">borja@adm.com</span></a>
                </div>
            </li>
            <li><a href="#!"><i class="material-icons">house</i>Home</a></li>
            <li><div class="divider"></div></li>
            <li><a href="#!"><i class="material-icons">description</i>Gerencia de clientes</a></li>
            <li><a href="#!"><i class="material-icons">description</i>Gerencia de livros</a></li>
            <li><a href="#!"><i class="material-icons">description</i>Gerencia de pedidos</a></li>
            <li><a href="#!"><i class="material-icons">description</i>Gerencia de estoque</a></li>
               <li><a href="/Ecommerce/LogoutCliente?acao=logout"><i class="material-icons">close</i>Sair</a></li>
        </ul>
        <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>
        
        
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
                                 out.print("Seja bem vindo " + cliente.getNome());

                                 //Cliente com perfil de ADM
                                 if(cliente.getPapel().getId() == 2){ %>
                                 
                                 <br><br><br>
                                 <fieldset>
                                     <legend>Gerencia de clientes</legend>
                                     <br>
                                    <div><a href='listar_clientes.jsp'>Listar clientes</a></div>
                                    <div><a href='listar_clientes.jsp'>Desativar clientes</a></div>
                                    <div><a href='listar_clientesInativos.jsp'>Ativar clientes</a></div>
                                </fieldset>
                                <fieldset>
                                    <legend>Gerencia de livros</legend>
                                    <br>
                                    <div><a href='../Livros/cadastro_livro.jsp'>Cadastrar livro</a></div>
                                    <div><a href='../Livros/listar_livros.jsp'>Listar livro</a></div>
                                    <div><a href='../Livros/listar_livros.jsp'>Desativar livro</a></div>
                                    <div><a href='../Livros/listar_livrosInativos.jsp'>Ativar livro</a></div>
                                    <div><a href='../Livros/cadastro_categoria.jsp'>Inserir Categoria de livro</a></div>
                                    <div><a href='../Livros/listar_categorias.jsp'>Listar Categorias de livro</a></div>
                                    <div><a href='../Livros/cadastro_grupoLivro.jsp'>Inserir grupo de precificação</a></div>
                                    <div><a href='../Livros/listar_grupoPrecificacao.jsp'>Listar grupo de precificação</a></div>
                                    
                                </fieldset>
                                <fieldset>
                                    <br>
                                    <legend>Gerencia de pedidos</legend>
                                    <div><a href='../adm/listar_pedidos.jsp'>Ver pedidos</a></div>
                                    <div><a href='../adm/listar_pedidos.jsp'>Gerenciar pedidos</a></div>
                                    <div><a href='../adm/listar_SolicitacaoTrocas.jsp'>Ver Solicitações de trocas </a></div>
                                    <div><a href=''>Gerenciar trocas </a></div>
                                    <div><a href=''>Editar meu perfil </a></div>
                                </fieldset>
                                <fieldset>
                                    <legend>Gerencia de estoque</legend>
                                    <br>
                                    <div><a href='../Estoque/entrada_estoqueLivro.jsp'>Entrada em estoque de livro</a></div>
                                    <div><a href='../Estoque/listar_estoqueLivros.jsp'>Listar estoque de livro</a></div>
                                    <div><a href='../Estoque/listar_fornecedores.jsp'>Listar fornecedores</a></div>
                                </fieldset>
                                     <%
                                    }
                                 // Perfil comum
                                 else if(cliente.getPapel().getId() == 1){ %>
                                 <br><br>
                                <fieldset>
                                    <br>
                                    <legend>Ações</legend>
                                    <div><a href='../Livros/prateleira.jsp'>Home</a></div>
                                    <div><a href='ListarCupomTroca.jsp'>Ver Cupons de troca</a></div>                                   
                                    <div><a href='../Pedidos/carrinho.jsp?u=<%=cliente.getId()%>'>Ver carrinho</a></div>
                                    <div><a href='../Clientes/listar_meusPedidos.jsp'>Ver pedidos</a></div>
                                    <div><a href=''>Solicitar troca</a></div>
                                    <div><a href=''>Consultar andamento da troca</a></div>
                                    <div><a href=''>Consultar pontos acumulativos</a></div>
                                    
                                    
                                    
                                    <div><a href='preAlterar_cliente.jsp?id=<%=cliente.getId()%>'>Editar meu perfil</a></div>
                                </fieldset>
                                    <%
                                     }
                        }
            }
        }
    }
         %>
        <br><br>
         <div><a href="/Ecommerce/LogoutCliente?acao=logout">Sair</a></div> 
        
        
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
