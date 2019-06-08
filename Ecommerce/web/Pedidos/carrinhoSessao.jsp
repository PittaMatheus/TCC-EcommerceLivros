<%-- 
    Document   : carrinhoSessao
    Created on : May 22, 2019, 1:22:28 PM
    Author     : matheus
--%>

<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.pedido.Carrinho"%>
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
        <title>Carrinho</title>
    </head>
    <body>
       
        <%           
            double valorTotal = 0;
            String precoFormatado="";
            Carrinho carrinho = (Carrinho) session.getAttribute("carrinho");
            if(carrinho == null){
                out.println("Não há livros no carrinho");
                out.println("<br><a href='../index.jsp'>Adicionar livros</a>");
            }else{
        %>
        
    <form action="../login.jsp" method="GET">
         <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center">CARRINHO DA SESSÃO</a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                      <li><button type="submit" class="btn-border" value="Realizar pedido">Realizar pedido</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="../index.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
         <br> <br> <br> <br>
         <div class="container">
            <table class="bordered highlight centered">
                   <tr class="black white-text">
                       <td>TÍTULO</td>
                       <td>AUTOR</td>
                       <td>ANO</td>
                       <td>EDIÇÃO</td>
                       <td>PREÇO</td>
                       <td>AÇÃO</td>
                  </tr>   
                      <%
                       for(Livro livro : carrinho.getLivs()){
                           %>
               <tr>

                   <td><%=livro.getTitulo()%></td>
                   <td><%=livro.getAutor()%></td>
                   <td><%=livro.getAno()%></td>
                   <td><%=livro.getEdicao()%></td>
                   <td><%=livro.getPreco()%></td>
                   <td><a href="">Remover</a></td>
               </tr>
<%                      
                        valorTotal += livro.getPreco();
                             }
                        
%>
 
            </table>
            <br>
            <table class="bordered highlight centered">
                <tr>
                    <td class="grey darken-4 white-text" colspan="3">
                <%

                 precoFormatado = LivroUtils.formatarPreco(valorTotal);
                 %>

                Valor total da compra:

                    <td colspan="3"><b><%=precoFormatado %></b></td>
                </tr>
            </table>
        
        <br><br>
        
            <input type="hidden" name="valorTotal" value="<%= valorTotal %>">

        
    </form>
            
            
                             <%
            }


            %>
            
            
        
     
        </div>
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        
    </body>
</html>
