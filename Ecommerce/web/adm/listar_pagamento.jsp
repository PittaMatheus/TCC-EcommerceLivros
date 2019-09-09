<%-- 
    Document   : listar_pagamento.jsp
    Created on : May 12, 2019, 4:31:41 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="livraria.core.util.PrecoUtils"%>
<%@page import="ecommerce.dominio.pedido.ItemPedido"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <title>Pagamento</title>
    </head>
    <body
<%  
            int id_cliente = 0;
            int papel = 0;
            int houveCupom = 0;
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
                                id_cliente = cliente.getId();
                                out.println(cliente.getNome());
                                papel = cliente.getPapel().getId();
                           }
                         }
                    }
            }
            Resultado resultado = (Resultado) session.getAttribute("resultado");    
            List<Pedido> pedidos = (List) resultado.getEntidades();
            String id_pedido = request.getParameter("id_ped");
            
            Resultado resultado2 = (Resultado) request.getAttribute("resultado2");
		if(resultado2 == null) {
			response.sendRedirect(request.getContextPath() + "/adm/ListarPagamentoPedido?p="+id_pedido+"&acao=listar");
			return;
		}
                
%>
<!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
             <form action="gerenciar_pedido.jsp" method="POST">
                <nav>
                    <div class="nav-wrapper indigo darken-4">
                      <a href="#" class="brand-logo center maiusculo">Pagamento do pedido</a>
                      <ul class="left">
                

<%
                List<Pedido> pagamentos = (List) resultado2.getEntidades();
                for(Pedido ped : pagamentos){
                    id_pedido = String.valueOf(ped.getId());
%>
 
<%
                        if(papel == 1){
%>
                            <li><a href="../Clientes/listar_meusPedidos.jsp"><i class="material-icons">arrow_back</i></a></li>
<%
                        }else{
%>
                            <li><a href="listar_pedidos.jsp"><i class="material-icons">arrow_back</i></a></li>
<%

                        }
%>
 
                      </ul>
                    </div>
                  </nav>
            </div>
                    <br>
        <div class="container">
                    <h5>Detalhes do pedido</h5>
        <table border="1" class="highlight striped centered responsive-table">
            <thead>
                <tr>
                   <th>Bandeira</th><th>Nome do cartão</th><th>Data de validade</th> <th>Valor</th>
                </tr>
            </thead>
            <tbody>
                <td><%=ped.getPagamento().getCartao().getBandeira().getNome() %></td>  
                <td><%=ped.getPagamento().getCartao().getNome() %></td>
                <td><%=FormatadorData.formatarData(ped.getPagamento().getCartao().getDtVencimento())%></td>                  
                <td><%=PrecoUtils.Sifrao(String.valueOf(ped.getPagamento().getValorTotal())) %></td>
<%
            houveCupom = ped.getPagamento().getCupom().getId();
                     
%>



<%
                }
%>
            </tbody>     
        </table>
            <%

                if(houveCupom == 1){
%>
<br>           <p>Você utilizou um cupom de desconto. <a href="CupomDescontoPagamento.jsp?p=<%=id_pedido%>">Detalhes</a></p>
<%              }

%>
           
</div>
<br><br>

    </body>
</html>
