<%-- 
    Document   : detalheItem
    Created on : Apr 30, 2019, 9:28:59 AM
    Author     : matheus
--%>

<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="livraria.core.util.PrecoUtils"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page import="java.util.List"%>
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
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalhes Item</title>
    </head>
    <body>
        <%
                   boolean flgLogado = false;
                
                   if(session.getAttribute("usuarioLogado") != null){
                Resultado resultado = (Resultado) session.getAttribute("usuarioLogado");    
                List<Cliente> clientes = (List) resultado.getEntidades();
                if(resultado != null) {
                    if(clientes.size() == 0) {
                        response.sendRedirect("../login.jsp");
                    }
                    else {
                        for (Cliente cliente : clientes) {
                            flgLogado = true;
%>
  
<%
                }
            }
        }
    }
            

            int id_livro = Integer.parseInt(request.getParameter("l"));
            String id_usuario = request.getParameter("u");
            List<EntidadeDominio> livros = (List<EntidadeDominio>) getServletContext().getAttribute("livros"); 
            for(EntidadeDominio liv :livros){
                Livro livro = (Livro)liv; 
                if(id_livro == livro.getId()){
        %>
        
        <!-- NAV FIXO DO TOPO -->
        <div class="navbar-fixed indigo darken-4">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Detalhes do livro</a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                      
                      
               
                      
                      <%
                          if(flgLogado){
                      %>
                      <li> <a href="../Pedidos/add_carrinho.jsp?l=<%=id_livro%>&u=<%=id_usuario%>"><i class="material-icons left">add_shopping_cart</i>Adicionar ao carrinho</a> </li>
                      <%
                          }else{
                      %>
                      <li>  <a href="../Pedidos/add_carrinho_sessao.jsp?l=<%=id_livro%>"><i class="material-icons left">add_shopping_cart</i>Adicionar ao carrinho</a></li>
                      <%
                      }
                      %>
                      
                  </ul>
                  <ul class="left">
                      <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
         
                  <div class="container2">
                      <br><br>
                    <table class="">
                        <tr>
                            <td class="center zero_espacamento" width="30%">
                                <img src="../imagens/<%=livro.getImagem()%>" class="z-depth-4" style='width: 88%'>
                            </td>
                    
                            <td width="70%" style="padding: 0px; margin: 0;">
                                <ul class="collection with-header">
                                    <li class="collection-header center maiusculo"><h5 class="negrito"><%=livro.getTitulo()%></h5></li>
                                    <li class="collection-item">Impulsionado pela restauração de sua fé na humanidade e inspirado pelo ato altruísta do Superman, Bruce Wayne convoca sua nova aliada Diana Prince para o combate contra um inimigo ainda maior, recém-despertado. nova aliada Diana Prince para o combate contra um inimigo ainda maior, recém-despertado. </li>
                                </ul>
                                <ul class="collapsible" data-collapsible="accordion">
                                  <li>
                                   <table class="bordered centered">
                                            <tr class="grey lighten-3">
                                               <td colspan="8"><b>Informações Básicas</b></td>
                                            </tr>
                                            <tr>
                                                <td colspan="3"><b>Autor:</b> <%=livro.getAutor()%></td>
                                                <td colspan="4"><b>Categoria(s):</b>
                                                    <%
                                                        for(int i = 0; i < livro.getCategorias().size(); i++){
                                                            out.println(livro.getCategorias().get(i).getNome() + " | ");
                                                        }
                                                 %></td>
                                                <td colspan="1"><b>Paginas:</b> <%= livro.getNumeroPaginas()%></td>
                                                
                                            </tr>
                                            <tr class="grey lighten-3">
                                                <td colspan="8"><b>Dimensões</b></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><b>Altura(cm):</b> <%= livro.getDimensoes().getAltura() %></td>
                                                <td colspan="2"><b>Peso(g):</b> <%= livro.getDimensoes().getPeso()%></td>
                                                <td colspan="2"><b>Profundidade(cm):</b> <%= livro.getDimensoes().getProfundidade()%></td>
                                                <td colspan="2"><b>largura(cm):</b> <%= livro.getDimensoes().getLargura() %></td>
                                            </tr>
                                        </table>         
                                  </li>
                                </ul>
                                <ul class="collection with-header">
                                    <li class="collection-header right maiusculo"><h5><b class="red-text darken-4"><%=LivroUtils.formatarPreco(LivroUtils.calcularPrecoLivro(livro)) %></b></h5></li>

                                </ul>

                               
                         
                               
                           </td>
                        </tr>
                    </table>
                   </div>
<%
                }
            if(session.getAttribute("usuarioLogado") == null){
%>
              
<%
           }


}

%>
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
