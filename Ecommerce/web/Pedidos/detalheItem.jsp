<%-- 
    Document   : detalheItem
    Created on : Apr 30, 2019, 9:28:59 AM
    Author     : matheus
--%>

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
         <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center">DETALHES DO LIVRO</a>
                  <ul id="nav-mobile" class="right hide-on-med-and-down">
                      <li><button type="submit" class="btn-border" value="Realizar pedido">Realizar pedido</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="../index.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
         
         <br><br><br><br><br><br><br>
        <div class="centro">
<%
            int id_livro = Integer.parseInt(request.getParameter("l"));
            String id_usuario = request.getParameter("u");
            List<EntidadeDominio> livros = (List<EntidadeDominio>) getServletContext().getAttribute("livros"); 
            for(EntidadeDominio liv :livros){
                Livro livro = (Livro)liv; 
                if(id_livro == livro.getId()){
%>
                    <h4> <%=livro.getTitulo()%></h4>
                    <img src="../imagens/<%=livro.getImagem()%>">
                    <li class="livro"><%=livro.getAutor()%></li>
                    <li><%=livro.getSinopse()%></li>
                    <li>R$ <%=livro.getPreco()%> </li>
                    <li>Paginas: <%= livro.getNumeroPaginas()%></li>
                    <li>Categoria(s): <ul>
<%
                    for(int i = 0; i < livro.getCategorias().size(); i++){
                        out.println(livro.getCategorias().get(i).getNome() + "<br>");
                    }
%>
                    </ul>
                    </li> 
                    <hr>
                    <h4>Dimensões</h4>
                    <li>Altura(cm): <%= livro.getDimensoes().getAltura() %> </li>
                    <li>Peso(g): <%= livro.getDimensoes().getPeso()%> </li>
                    <li>Profundidade(cm): <%= livro.getDimensoes().getProfundidade()%> </li>
                    <li>largura(cm): <%= livro.getDimensoes().getLargura() %> </li>
                    
                    <a href="../Pedidos/add_carrinho_sessao.jsp?l=<%=id_livro%>">Adicionar ao carrinho via sessao</a>
        </div>                    
<%
                }
            }
            if(session.getAttribute("usuarioLogado") == null){
%>
             
<%
           }else if(session.getAttribute("usuarioLogado") != null){
                Resultado resultado = (Resultado) session.getAttribute("usuarioLogado");    
                List<Cliente> clientes = (List) resultado.getEntidades();
                if(resultado != null) {
                    if(clientes.size() == 0) {
                        response.sendRedirect("../login.jsp");
                    }
                    else {
                        for (Cliente cliente : clientes) {         
%>
                            <a href="../Pedidos/add_carrinho.jsp?l=<%=id_livro%>&u=<%=id_usuario%>">Adicionar ao carrinho</a>
                   
<%
                }
            }
        }
    }



%>
        <br><br>
        <a href="../Livros/prateleira.jsp">Voltar</a>
    </body>
</html>
