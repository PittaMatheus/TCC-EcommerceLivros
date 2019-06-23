<%-- 
    Document   : analise_categoriaMaisVendida
    Created on : 30/05/2019, 17:04:21
    Author     : bocao
--%>

<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="ecommerce.dominio.analise.AnaliseCategoriaMaisVendida"%>
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
        <title>Analise de categorias vendidas</title>
    </head>
    <body>
        <form action="Analisar" method="post">
         <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <form action='InserirGrupoLivro' method='POST'>
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Análise de categoria vendida</a>
                  <ul id="nav-mobile" class="right">      
                      <li><button type="submit" name="acao" value="listar" id="btSalvar" class="btn-border"><i class='material-icons left'>done</i>Gerar gráfico</button></li>
                  </ul>
                  <ul class="left">
                      <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
         <br><br>
         <div class="container center">
        
        
        <% Resultado resultado = (Resultado) request.getAttribute("resultado");
        if(resultado != null){
            
        
            String mensagem = (String) resultado.getMensagem(); %>
        <%  if(mensagem != null){
                out.print(mensagem); 
            }
            AnaliseCategoriaMaisVendida analise = new AnaliseCategoriaMaisVendida();
            for(EntidadeDominio entdDominio : resultado.getEntidades()){
                analise = (AnaliseCategoriaMaisVendida) entdDominio;
                
            }
            if(analise.getDatasPedidos().size() != 0){%>
                <br>
            
                <div id="chartCategorias"></div>

                <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
                <script type="text/javascript">

                google.charts.load('current', {'packages':['corechart', 'line']});
                google.charts.setOnLoadCallback(drawChart);

                function drawChart() {

                var data = new google.visualization.DataTable();
                data.addColumn('string', 'Datas');
                data.addColumn('number', 'Ação');
                data.addColumn('number', 'Aventura');
                data.addColumn('number', 'Biografia');
                data.addColumn('number', 'Comédia');
                data.addColumn('number', 'Didático');
                data.addColumn('number', 'Drama');
                data.addColumn('number', 'Faroeste');
                data.addColumn('number', 'Ficção');
                data.addColumn('number', 'Romance');
                data.addColumn('number', 'Suspense');
                data.addColumn('number', 'Terror');


                data.addRows([
                        <%=analise.getRowsGrafico()%>
                        
                ]);
                var dataInicio = '<%=FormatadorData.formatarData(analise.getDtInicio())%>';
                var dataFim = '<%=FormatadorData.formatarData(analise.getDtFim())%>';
                var subtitulo = 'período de ' + dataInicio + ' até ' + dataFim;
                var options = {
                  chart: {
                    title: 'Vendas de Categoria por Data',
                    subtitle: subtitulo
                  },
                  vAxis: {
                        viewWindow: {
                            max: 50
                        }
                  },
                  height: 500,
                  axes: {
                    y: {
                      0: {label: 'Quantidade de livros vendidos'},
                    }
                  }

                };

                var chart = new google.charts.Line(document.getElementById('chartCategorias'));

                chart.draw(data, google.charts.Line.convertOptions(options));
                }
                </script>
                 
            <%}else{
                    out.print("<li>Não possui nenhuma análise neste período");
            }
        }else{%> 
        
        <br>

        <label
            for="txtDtInicio">Data Início:</label> <input type="date" id="txtDtInicio"
            name="txtDtInicio" /> <br>

        <label
            for="txtDtFim">Data Fim:</label> <input type="date" id="txtDtFim"
            name="txtDtFim"/> <br>

        <input type="submit" name="acao" value="listar"> <br>

        </form>		
        <%}%>
        <br><br>
        </div>
     
    </body>
</html>