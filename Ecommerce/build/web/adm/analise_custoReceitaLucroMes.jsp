<%-- 
    Document   : analise_custoReceitaLucroMes
    Created on : 07/06/2019, 16:36:28
    Author     : bocao
--%>

<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page import="ecommerce.dominio.analise.AnaliseCustoReceitaLucroMes"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
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
        <title>Analise de custo-venda-lucro</title>
    </head>
    <body>
        <form action="Analisar" method="post">
         <!-- NAV FIXO DO TOPO-->
        <div class="navbar-fixed indigo darken-4">
            <form action='InserirGrupoLivro' method='POST'>
            <nav>
                <div class="nav-wrapper indigo darken-4">
                  <a href="#" class="brand-logo center maiusculo">Análise de custo-venda-lucro</a>
                  <ul class="left">
                      <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                  </ul>
                </div>
              </nav>
        </div>
         <br><br>
         <div class="container center">
        
        <%
        List<AnaliseCustoReceitaLucroMes> analises = (List<AnaliseCustoReceitaLucroMes>) getServletContext().getAttribute("analise");
        if(analises == null) {
            out.print("Erro");
        }else{

        AnaliseCustoReceitaLucroMes analise = new AnaliseCustoReceitaLucroMes();
        for(EntidadeDominio entdDominio : analises){
            analise = (AnaliseCustoReceitaLucroMes) entdDominio;

        }
        if(analise.getDatasCusto().size() != 0 || analise.getDatasPedido().size() != 0){%>
        
        <div id="chartCategorias1"></div>
        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">

            google.charts.load('current', {'packages':['bar']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

            var data = google.visualization.arrayToDataTable(
                    <%=analise.getRowsGrafico()%>
            );
                    
            var dataInicio =  'JANEIRO';
            var dataFim = 'DEZEMBRO';
            var subtitulo = 'período de ' + dataInicio + ' até ' + dataFim;
            var options = {
              chart: {
                title: 'Custo - Venda - Lucro por mês',
                subtitle: subtitulo,
              },
              bars: 'vertical',
              bar: {groupWidth: '55%'},
              vAxis: {format: '#,###,##0.00',
                  gridlines: { count: 7}
              },
              hAxis: {
                  titleTextStyle: {color: '#2F4F4F', fontName: 'Roboto', fontSize: '16'}
              },
              width: 1100,
              height: 500,
              colors: ['#1b9e77', '#d95f02', '#7570b3'],
              axes: {
                y: {
                  0: {label: 'CUSTO-VENDA-LUCRO em R$'},
                }
              }
            };
            var chart = new google.charts.Bar(document.getElementById('chartCategorias1'));

            chart.draw(data, google.charts.Bar.convertOptions(options));
            }
        </script>
        <%}else{
            out.print("<h1>O sistema não encontrou nenhuma análise!");
        }}%>
        <br><br>
        
    </body>
</html>