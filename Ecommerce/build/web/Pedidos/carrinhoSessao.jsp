<%-- 
    Document   : carrinhoSessao
    Created on : May 22, 2019, 1:22:28 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.pedido.Item"%>
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
            if(carrinho == null || carrinho.getItens().isEmpty()){
        %>
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center">CARRINHO ESTÁ VAZIO</a>
                  <ul class="left">
                      <li><a href="../index.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
        <br><br><br><br>
    
        <div class="container center">        
            <img src="https://img.icons8.com/clouds/400/000000/add-shopping-cart.png">
        </div>
        <%
            }else{
        %>
        
    <form action="AdicionarPedido" method="POST">
        <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center">CARRINHO</a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                      <li><button type="submit" class="btn-border" value="Realizar pedido"><i class="material-icons left">done</i>Finalizar pedido</button></li>
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
                       <td>Imagem</td>
                       <td>Quantidade</td>
                       <td>AÇÃO</td>
                  </tr>   
                      <%
                       for(Item item : carrinho.getItens()){
                           %>
               <tr>
               <input type="hidden" name="livros" value="<%=item.getLivro().getId()%>">
                   <td><%=item.getLivro().getTitulo()%></td>
                   <td><%=item.getLivro().getAutor()%></td>
                   <td><%=item.getLivro().getAno()%></td>
                   <td><%=item.getLivro().getEdicao()%></td>
                   <td name="quantidade"><%=LivroUtils.formatarPreco(LivroUtils.calcularPrecoLivro(item.getLivro(), item.getQuantidade()))%></td>
                   <td><img width="70"src="../imagens/<%=item.getLivro().getImagem()%>"></td>
                   <td><button class="material-icons grey" formaction="AumentaUmItem?l=<%=item.getLivro().getId()%>&a=a" >keyboard_arrow_up</button> <%=item.getQuantidade()%>
<%
                    String valido = "";
                    if(item.getQuantidade() == 1){
                         valido = "disabled";
                    }else{
                        valido = "";
                    }
%>
                       <button <%=valido%> formaction="RetiraUmItem?l=<%=item.getLivro().getId()%>&a=r"class="material-icons grey">keyboard_arrow_down</button> </td>
                   <td><a href="RemoverLivroCarrinho?l=<%=item.getLivro().getId()%>&a=l">Remover</a></td>
               </tr>
<%                      
                        valorTotal += LivroUtils.calcularPrecoLivro(item.getLivro(), item.getQuantidade());
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
        <script type="text/javascript" src="../js/materialize.js"></script>
        <script type="text/javascript" src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
        
    </body>
</html>
