<%-- 
    Document   : confirmaCartao
    Created on : Apr 28, 2019, 12:11:55 PM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.cliente.Cartao"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Escolha o cartão de credito</h1>
        <%
   
            if(session.getAttribute("pedido") != null){
                Pedido pedido = (Pedido) session.getAttribute("pedido");    

            
            
           // String id_endereco = request.getParameter("id_endereco");
            String id_usuario = request.getParameter("u");
            

            Resultado resultado = (Resultado) request.getAttribute("resultado");
            if(resultado == null) {
                response.sendRedirect(request.getContextPath() + "/Clientes/ListarCartao?acao=consultarPorID&id=" + id_usuario + "&conf=1");
            }
            else{
             List<Cartao> cartoes = (List) resultado.getEntidades();
              
                         if(cartoes.size() == 0) {
                            out.print("Nenhum cartão cadastrado");
                        } else {
                             %>
                        <form action="AdicionarPedido" method="POST">
                             <table border='1'>
                                <thead>
                                    <tr>
                                         <th>#</th><th>Bandeira</th> <th>Nome</th><th>Data de vencimento</th><th>Numero</th><th>Codigo</th>
                                    </tr>
                                </thead>
                                <tbody>
                             <%
                            for (Cartao cartao : cartoes) {
                                out.println("<tr>");
                                out.println("<td><input type='radio' required name='id_cartao' value=" + cartao.getId() + " /></td>");
                                out.println("<td>" + cartao.getBandeira().getNome() + "</td>");
                                out.println("<td>" + cartao.getNome()+ "</td>");
                                out.println("<td>" + cartao.getDtVencimento()+ "</td>");
                                out.println("<td>" + cartao.getNumeroCartao()+ "</td>");
                                out.println("<td>" + cartao.getCodSeguranca()+ "</td>");
                                out.println("</tr>");
                                id_usuario = String.valueOf(cartao.getCliente().getId());
                        }
                }
        }
            
%>
                                </tbody>
                             </table>
                                <br><br>
                                <input type="hidden" name="u" value="<%=id_usuario%>">
                                 <input type="hidden" name="id_endereco" value="<%=pedido.getEndereco().getClienteId()%>">
                                 <button name="acao" value="inserir">Confirmar pedido</button>
                                
                        </form>
                                <br>

        <a href='cadastro_cartao.jsp?id=<%=id_usuario%> '>Adicionar cartão</a>
<%
    }
%>
        
 
    </body>
</html>
