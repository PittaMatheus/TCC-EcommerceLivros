<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
                                    <div><a href=''>Ver pedidos</a></div>
                                    <div><a href=''>Gerenciar pedidos</a></div>
                                    <div><a href=''>Ver trocas </a></div>
                                    <div><a href=''>Gerenciar trocas </a></div>
                                    <div><a href=''>Editar meu perfil </a></div>
                                </fieldset>
                                     <%
                                    }
                                 // Perfil comum
                                 else if(cliente.getPapel().getId() == 1){ %>
                                 <br><br>
                                <fieldset>
                                    <br>
                                    <legend>Ações</legend>
                                    <div><a href='../Livros/prateleira.jsp'>Adicionar ao carrinho</a></div>
                                    <div><a href='../Pedidos/carrinho.jsp?u=<%=cliente.getId()%>'>Ver carrinho</a></div>
                                    <div><a href=''>Acompanhar pedido</a></div>
                                    <div><a href=''>Editar meu perfil</a></div>
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
    </body>
</html>