<%-- 
    Document   : home
    Created on : Mar 22, 2019, 10:24:36 AM
    Author     : matheus
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente"%>
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
                                 if(cliente.getPapel().getId() == 2){
                                     out.print("<div><br><a href='listar_clientes.jsp'>Listar clientes</a></div>");
                                     out.print("<div><a href='listar_clientes.jsp'>Desativar clientes</a></div> ");
                                     out.print("<div><a href='listar_clientesInativos.jsp'>Ativar clientes</a></div>");
                                     out.print("<div><a href='../Livros/cadastro_livro.jsp'>Cadastrar livro</a></div>");
                                     out.print("<div><a href='../Livros/listar_livros.jsp'>Listar livro</a></div>");
                                     out.print("<div><a href='../Livros/listar_livros.jsp'>Desativar livro</a></div>");
                                     out.print("<div><a href='../Livros/listar_livrosInativos.jsp'>Ativar livro</a></div>");
                                     out.print("<div><a href=''>Ver pedidos</a></div>");
                                     out.print("<div><a href=''>Gerenciar pedidos</a></div>");
                                     out.print("<div><a href=''>Ver trocas </a></div>");
                                     out.print("<div><a href=''>Gerenciar trocas </a></div>");
                                     out.print("<div><a href=''>Editar meu perfil </a></div>");
                                    }
                                 // Perfil comum
                                 else if(cliente.getPapel().getId() == 1){
                                     out.println("<div><a href=''>Adicionar ao carrinho</a></div>");
                                     out.println("<div><a href=''>Realizar pedido</a></div>");
                                     out.println("<div><a href=''>Acompanhar pedido</a></div>");
                                     out.println("<div><a href=''>Editar meu perfil</a></div>");
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
