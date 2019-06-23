<%@page import="livraria.core.util.LivroUtils"%>
<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="ecommerce.dominio.estoque.Fornecedor"%>
<%@page import="ecommerce.dominio.livro.Livro"%>
<%@page import="ecommerce.dominio.estoque.Estoque"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Import Google Icon Font-->
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="navbar-fixed indigo darken-4">
                <nav>
                    <div class="nav-wrapper indigo darken-4">
                      <a href="#" class="brand-logo center maiusculo">Estoque de livros</a>
                      <ul class="left">
                          <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                      </ul>
                    </div>
                  </nav>
        </div>
<%
        Resultado resultado = (Resultado) request.getAttribute("resultado");
        
        List<Livro> livros = (List<Livro>) getServletContext().getAttribute("livros");
        List<Fornecedor> fornecedores = (List<Fornecedor>) getServletContext().getAttribute("fornecedor");
        
        if(resultado == null) {
            response.sendRedirect(request.getContextPath() + "/Estoque/ListarEstoqueLivros?acao=listar");
            return;
        }
	%>
        <br><br>
        <form action="AlterarEstoque" method="POST">
            <%
         
         List<Estoque> estoques = (List) resultado.getEntidades();
         
         if(estoques.size() == 0 || livros.size() == 0 || fornecedores.size() == 0) {
            out.print("<br><br>Nenhum estoque de livro foi cadastrado");
         }else {
        %> 
        <div class ="container2 row">
            <table class="bordered highlight centered responsive-table">
            <tr class="black white-text maiusculo center negrito">
                <th>Título do livro</th>
                <th>Nome fornecedor</th>
                <th>CNPJ</th>
                <th>Razao social</th>
                <th>Preco de custo</th>
                <th>Data de entrada</th>
                <th>Quantidade</th>
                <th>Alterar a Quantidade</th>
            </tr> 
            <%

                for(Estoque est: estoques){
                    Estoque estoque = (Estoque) est;
                    int i = estoque.getItem().getLivro().getId();
                    int j = estoque.getItem().getFornecedor().getId();



                    %>
                <tr class="text-pequeno">
                    <td><%=livros.get(i-1).getTitulo()%></td>
                    <td><%=fornecedores.get(j-1).getNome()%></td>
                    <td><%=fornecedores.get(j-1).getCnpj()%></td>
                    <td><%=fornecedores.get(j-1).getRazaoSocial()%></td>
                    <td><%=LivroUtils.formatarPreco(estoque.getItem().getCusto())%></td>
                    <td><%out.print(FormatadorData.formatarData(estoque.getDataCadastro()));%></td>
                    <%if(estoque.getItem().getQuantidade() == 0){%>
                        <td bgcolor="RED"><%=estoque.getItem().getQuantidade()%></td>
                    <%}else{%>
                        <td><%=estoque.getItem().getQuantidade()%></td>
                    <%}%>
                    <td><a href="preAlterar_estoqueLivro.jsp?id=<% out.print(estoque.getId()); %>">Editar Quantiadade</a></td>
                </tr>
                <%}
             }%>
            </table>
        </form>
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