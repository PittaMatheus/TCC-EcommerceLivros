<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="ecommerce.dominio.pedido.Carrinho"%>
<%@page import="java.util.List"%>
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
        <title>Carrinho</title>
    </head>
    <body>
        <%
            int id_usuario = 0;
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
                                 id_usuario = cliente.getId();
                               }
                             }
                        }
            }

            double preco = 0;
            Livro livro = new Livro();
            Resultado resultado = (Resultado) request.getAttribute("resultado");
            if(resultado == null) {
                    response.sendRedirect(request.getContextPath() + "/Pedidos/VerCarrinho?acao=consultarPorID&u=" + id_usuario);
                    return; 
                }
            List<Carrinho> carrinhos = (List) resultado.getEntidades();
                         
                         if(carrinhos.size() == 0) {
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
                        } else { %>
                 
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
                      <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>

            <div class="container">
                <table border="1" style ="width: 50%">
                        <tr>
                            <th>Título</th>
                            <th>Autor</th>
                            <th>Ano</th>
                            <th>Edição</th>
                            <th>Preço</th>
                            <th>Ação</th>
                       </tr>   
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
                        int i = 0;
                             for (Carrinho carrinho : carrinhos) { 
                            
                            %>
                         <tr>  
                                        <input type="hidden" name="qt" value="<%=carrinho.getQt_itens()%>">
                                       <input type="hidden" name="livros" value="<%=carrinho.getLivro().getId()%>">
                        <td><%=carrinho.getLivro().getTitulo()%></td>
                        <td><%=carrinho.getLivro().getAutor()%></td>
                        <td><%=carrinho.getLivro().getAno()%></td>
                        <td><%=carrinho.getLivro().getEdicao()%></td>
                        <% livro.setPreco(carrinho.getLivro().getPreco()); %>
                        <td><%=LivroUtils.formatarPreco(carrinho.getLivro().getPreco())%></td>
                        <td><img width="70" src="../imagens/<%=carrinho.getLivro().getImagem()%>"></td> 
                        
                        <td><button class="material-icons grey" formaction="AddItem?l=<%=carrinho.getLivro().getId()%>&acao=alterar&a=a" >keyboard_arrow_up</button>
                        <%=carrinho.getQt_itens()%>
<%                        
                        String valido = "";
                        if(carrinho.getQt_itens() == 1){
                             valido = "disabled";
                        }else{
                            valido = "";
                        }
%>
                        <button <%=valido%> formaction="RemItem?l=<%=carrinho.getLivro().getId()%>&acao=alterar&a=r"class="material-icons grey">keyboard_arrow_down</button> </td>

                        <td><a href="RemoverCarrinho?l=<%=carrinho.getLivro().getId()%>&u=<%=carrinho.getCliente().getId()%>&acao=desativar">Remover</a></td>
                     </tr>
<%                      
                        preco += carrinho.getLivro().getPreco();
                        i++;
                             }
                         
%>
        </table>
       <br>
            <table class="bordered highlight centered">
                <tr>
                    <td class="grey darken-4 white-text" colspan="3">
        
        <%
            livro.setPreco(preco);

        %>
            Valor total da compra:

                    <td colspan="3"><b><%=LivroUtils.formatarPrecoLivro(livro)%></b></td>
                </tr>
            </table>
        <br><br>
        
            <input type="hidden" name="u" id="id_usuario" value="<%=id_usuario%>">
            <input type="hidden" name="valorTotal" value="<%= livro.getPreco() %>">
        </form>
           
        </div>
        <%}%>
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
