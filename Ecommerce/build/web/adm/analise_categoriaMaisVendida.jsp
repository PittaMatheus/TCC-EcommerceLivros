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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Analisar" method="post">
        
        <h2>Análises de Vendas</h2>
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
        <a href='../Clientes/home.jsp'>Voltar</a>  
    </body>
</html>