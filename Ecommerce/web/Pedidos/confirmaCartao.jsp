<%-- 
    Document   : confirmaCartao
    Created on : Apr 28, 2019, 12:11:55 PM
    Author     : matheus
--%>

<%@page import="livraria.core.util.FormatadorData"%>
<%@page import="ecommerce.dominio.cliente.Bandeira"%>
<%@page import="livraria.core.util.PrecoUtils"%>
<%@page import="ecommerce.dominio.cliente.Cliente"%>
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
            
            int id_usuario;
            if(session.getAttribute("usuarioLogado") == null){
                response.sendRedirect("../login.jsp");
            }else if(session.getAttribute("usuarioLogado") != null){
                Resultado resultadoLogin = (Resultado) session.getAttribute("usuarioLogado");    
                List<Cliente> clientes = (List) resultadoLogin.getEntidades();
                        if(resultadoLogin != null) {
                             if(clientes.size() == 0) {
                                response.sendRedirect("../login.jsp");
                            } else {
                               for (Cliente cliente : clientes) {         
                                  id_usuario = cliente.getId();
                              
                                             
                                 
            if(session.getAttribute("pedido") != null){
                Pedido pedido = (Pedido) session.getAttribute("pedido");    

                
           // String id_endereco = request.getParameter("id_endereco");
            if(null != request.getParameter("u")){
                 id_usuario = Integer.parseInt(request.getParameter("u"));
            }
            double valorTotal = 0;

            Resultado resultado = (Resultado) request.getAttribute("resultado");
            List<Bandeira> bandeiras = (List<Bandeira>) getServletContext().getAttribute("bandeira");
            
            

            if(resultado == null || bandeiras.size() == 0) {
                response.sendRedirect(request.getContextPath() + "/Clientes/ListarCartao?acao=consultarPorID&id=" + id_usuario + "&conf=1");
            }
            else{
             List<Cartao> cartoes = (List) resultado.getEntidades();
              
                         if(cartoes.size() == 0) {
                            out.print("Nenhum cartão cadastrado");
                        } else {
                             %>
                          <form action="AdicionarPedido" name="formCartao" id="formCartao" method="POST">
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
                                out.println("<td><input type='checkbox' onclick='DividePorCartao()' id='id"+cartao.getId() + "' name='id_cartao' value=" + cartao.getId() + " /></td>");
                                out.println("<td class='tdNomeCartao"+cartao.getId()+"'>" + bandeiras.get(cartao.getBandeira().getId()-1).getNome() + "</td>");
                                out.println("<td>" + cartao.getNome()+ "</td>");
                                out.println("<td class ='tdValidade"+cartao.getId()+"'>" + FormatadorData.formatarData(cartao.getDtVencimento())+ "</td>");
                                out.println("<td class='tdNumeroCartao"+cartao.getId()+"'>"  + cartao.getNumeroCartao()+ "</td>");
                                out.println("<td>" + cartao.getCodSeguranca()+ "</td>");
                                out.println("</tr>");
                                id_usuario = cartao.getCliente().getId();
                            }
                    }
                    // out.println("Valor total: " + pedido.getPagamento().getValorTotal());
                    // out.println("id do cliente: " + pedido.getCliente().getId());
                    // out.println("id do endereco " + pedido.getEndereco().getClienteId());

                    
                                   if(session.getAttribute("aplicado") != null){
                                   //Com cupom recupera o valor descontado
                                        valorTotal = pedido.getPagamento().getValorTotal();
                                 }else if(session.getAttribute("aplicado") == null){
                                        //Sem cupom recupera o valor Original
                                         if(session.getAttribute("pedidoOriginal") != null){
                                             valorTotal = (double) session.getAttribute("pedidoOriginal");  
                                         }
                                         else{
                                              valorTotal = pedido.getPagamento().getValorTotal();
                                          }                                   
                                    }
                    }


     
            
%>
                                </tbody>
                             </table>
                                <br><br>
                               
                                
                                o valor total é: <%=PrecoUtils.arredondarPreco(valorTotal) %><br><br>
      
                <div id="DivideValor" style="height:auto;width:auto;">
                    
                </div>  

                <div id="alertaValor" style="height:auto;width:auto;">
                    
                </div>
                
                
                        <br><br>
                        <input type="hidden" name="u" value="<%=id_usuario%>">
                         <input type="hidden" name="id_endereco" value="<%=pedido.getEndereco().getId()%>">
                         <input type="hidden" id="valorTotal" name="valorTotal" value="<%=pedido.getPagamento().getValorTotal()%>">
                         <button name="acao" value="inserir">Confirmar pedido</button>
                        </form>
                         <br><br>
                          <form action="AplicarDesconto">
                                    <label for="cupomDesconto">Cupom de desconto</label><br>
                                    <input <%
                                        if(session.getAttribute("aplicado") != null){
                                            Resultado aplicado = (Resultado)session.getAttribute("aplicado"); 
                                            if(aplicado != null) {
                                                if(aplicado.getMensagem().equals("cupomAplicado"))
                                            {%>
                                        disabled 
                                         <%}
                                          }
                                        }%>type="text" name="cupomDesconto">
                                    
                                    
                                     <button type="submit" name="acao" value="aplicarDesconto"
                                    <%
                                        if(session.getAttribute("aplicado") != null){
                                            Resultado aplicado = (Resultado)session.getAttribute("aplicado"); 
                                            if(aplicado != null) {
                                                if(aplicado.getMensagem().equals("cupomAplicado"))
                                            {%>
                                            disabled
                                            
                                            <%}
                                          }
                                        }%>
                                   >Aplicar</button>
                                   
                                   
                                </form>
                                        <br>
<%
                                   if(session.getAttribute("aplicado") != null){
                                       %>
                                   <form action="RetirarDesconto">
                                       
                                       <button type="submit" name="acao" value="retirarDesconto">Retirar cupom</button>
                                       
                                   </form>
                                          <% }
%>
                                   
                                   <br>
                                    <hr>
                                   
                                   
                                <br>

        <a href='cadastro_cartao.jsp?id=<%=id_usuario%> '>Adicionar cartão</a>
<%
    }
 }
                             }

                        }
            }
            
            
%>
<br><br>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
    <script src="../js/Custom.js"></script>
    </body>
</html>
