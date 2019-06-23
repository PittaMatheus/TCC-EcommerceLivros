<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.lang.String"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="java.util.List"%>
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
        <title>Listagem de pedidos</title>
    </head>
    <body>
        
<%
        Resultado resultado = (Resultado) request.getAttribute("resultado");
        if(resultado == null) {
                response.sendRedirect(request.getContextPath() + "/adm/ListarPedidos?acao=listar&tipoUsuario=2");
                return;
        }
        List<Pedido> pedidos = (List) resultado.getEntidades();
        if(pedidos.size() == 0) {
            out.print("<br><br>Nenhum pedido registrado");
        } else {
%>
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
             <form action="gerenciar_pedido.jsp" method="POST">
                <nav>
                    <div class="nav-wrapper indigo darken-4">
                      <a href="#" class="brand-logo center maiusculo">Pedidos registrados</a>
                      <ul id="nav-mobile" class="right">      
                          <li><button type="submit" name="acao" value="gerenciar" class="btn-border"><i class='material-icons left'>done</i>Gerenciar pedido</button></li>
                      </ul>
                      <ul class="left">
                          <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                      </ul>
                    </div>
                  </nav>
            </div>
            <br> <br> <br>
            <div class ="container2 row">
                <table class="bordered highlight centered responsive-table">
                    <tr class="black white-text maiusculo center negrito">
                        <th>#</th>
                        <th>Id do pedido</th>
                        <th>Email</th>
                        <th>Nome</th>
                        <th>data do pedido</th>
                        <th>Status do pedido</th>
                        <th>Endereco de entrega</th>
                        <th>Valor total</th>
                        <th>Itens</th>
                        <th>Pagamento</th>
                    </tr>       
<%
                    String stPedido = "";
                    session.setAttribute("resultado",  resultado); 
                    for (Pedido pedido : pedidos) {
                        if(pedido.getStatusPedido().getId() == 1){
                            stPedido = "EM PROGRESSO";
                        }else if(pedido.getStatusPedido().getId() == 2){
                             stPedido = "EM_TRANSPORTE";
                        }else if(pedido.getStatusPedido().getId() == 3){
                            stPedido = "ENTREGUE";
                        }else if(pedido.getStatusPedido().getId() == 4){
                             stPedido = "EM TROCA";
                        }
                        else if(pedido.getStatusPedido().getId() == 5){
                             stPedido = "TROCA APROVADA";
                        }
                        else if(pedido.getStatusPedido().getId() == 6){
                             stPedido = "TROCA REPROVADA";
                        }else if(pedido.getStatusPedido().getId() == 7){
                           stPedido = "TROCA FINALIZADA";
                        }
%>
                        <tr class="text-pequeno">
                            <td><input type='radio' required name='id' value="<%=pedido.getId()%>" id="<%=pedido.getId() %>" /><label for="<%=pedido.getId() %>"></label></td>
                            <td><%=pedido.getId()%></td>
                            <td><%=pedido.getCliente().getEmail()%></td>
                            <td><%=pedido.getCliente().getNome()%></td>
<%
                            SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                            String dataFormatPedido = formato.format(pedido.getDtPedido());
%>
                            <td><%=dataFormatPedido%></td>
                            <td><%=stPedido%></td>
                            <td><a class='btn orange' href="../adm/listar_enderecoEntrega.jsp?id_end=<%=pedido.getEndereco().getId()%>&id_ped=<%=pedido.getId()%>"><i class='material-icons'>list</i></a></td>
                            <td><%=LivroUtils.formatarPreco(pedido.getPagamento().getValorTotal())%></td>
                            <td><a class='btn orange' href="../Clientes/itensPedido.jsp?p=<%=pedido.getId()%>"><i class='material-icons'>list</i></a></td>
                            <td><a class='btn orange' href="listar_pagamento.jsp?id_ped=<%=pedido.getId()%>"><i class='material-icons'>list</i></a></td>
                        </tr>
<%                  }
        }
%>
                </table>
            </form>
<br><br>
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
