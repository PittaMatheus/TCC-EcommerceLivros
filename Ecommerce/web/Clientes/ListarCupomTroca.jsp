<%-- 
    Document   : ListarCupomTroca
    Created on : May 13, 2019, 9:26:57 PM
    Author     : matheus
--%>

<%@page import="livraria.core.util.PrecoUtils"%>
<%@page import="livraria.core.util.Random"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="ecommerce.dominio.pedido.CupomTroca"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Cupons Troca</title>
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
          
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/ConsultarCupomTroca?acao=consultarPorID&u=" + id_usuario + "");
			return;
		}
               
                
                
                 List<CupomTroca> cupons = (List) resultado.getEntidades();
                         
                         if(cupons.size() == 0) {
                            out.print("Nenhum cupons cadastrado");                            
                        } else {
                             
                             
%>
                            <li>Atenção: o cupom de troca tem validade de 1 Mês</li>

<%
                            for (CupomTroca cuponsTroca : cupons) {
                              if(cuponsTroca.getStatus() == 1){
%>
            <form action=''>
                <table border='1'>
                    <thead>
                        <tr>
                            <th>Pedido</th><th>Valor do cupom</th><th>Validade</th><th>Codigo</th>
                        </tr>
                    </thead>
                    <tbody>
                    
<%

                                out.println("<tr>");
                                out.println("<td>" + cuponsTroca.getPedido().getId()+ "</td>");
                                out.println("<td>" + PrecoUtils.arredondarPreco(cuponsTroca.getPedido().getPagamento().getValorTotal( ))+ "</td>");
                                Date validade =  new java.sql.Date(cuponsTroca.getDataTroca().getTime());
                                Calendar cal = Calendar.getInstance();
                                cal.setTime(validade);
                                cal.add(Calendar.MONTH, 1);
                                out.println("<td>" + FormatadorData.formatarData(cal.getTime()) + "</td>");
                                out.println("<td>" + cuponsTroca.getCodigo() + "</td>");                                
                                out.println("</tr>");
                                out.println("</br></br>");
                                
                               
                                
                                }
                            }
                        }                       
%>
            </tbody>
        </table>
            </form>
            <br><br><br>   

        
        <br><br>
        <a href='home.jsp'>Voltar</a>
    </body>
</html>
