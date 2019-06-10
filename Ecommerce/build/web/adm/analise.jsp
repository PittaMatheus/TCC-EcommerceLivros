<%-- 
    Document   : analise.jsp
    Created on : Jun 9, 2019, 9:25:08 PM
    Author     : matheus
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="ecommerce.dominio.analise.Analise"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0/dist/Chart.min.js"></script>
    </head>
    <body>
        <%
            List<String> categorias = new ArrayList<>();
            int quantidade[];
            int id_pedido[];
            int id_livro[];
        Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
                        
			response.sendRedirect(request.getContextPath() + "/adm/AnaliseVendas?acao=listar&grafico=categorias");
                        
			return;
		}
                        
                         List<Analise> analises = (List) resultado.getEntidades();
                         int aux = 0;
                         for(Analise analise : analises){
                                categorias.add(analise.getItem().getLivro().getCategoria().getNome());
                             }
                             aux++;
       
        
                            for(int i = 0; i < categorias.size(); i++){
                                out.println(categorias.get(i));
                            }
        %>
        
        
        
        
       <canvas id="bar-chart" width="800" height="450"></canvas> 
<script>
// Bar chart
new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: [2478,5267,734,784,433]
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
});
</script>
 <canvas id="pie-chart" width="800" height="450"></canvas>
   <script>

        
         
         
         new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
        data: [2478,5267,734,784,433]
      }]
    },
    options: {
      title: {
        display: true,
        text: 'Predicted world population (millions) in 2050'
      }
    }
    }); </script>
         
    </body>
</html>
