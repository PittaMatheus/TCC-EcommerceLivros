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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
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
        <h1>Análise de custo, venda e lucro por mês.</h1>
        
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
//              width: 1000,
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
        <a href='../Clientes/home.jsp'>Voltar</a> 
    </body>
</html>