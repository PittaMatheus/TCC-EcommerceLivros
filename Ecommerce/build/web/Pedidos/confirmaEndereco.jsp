<%-- 
    Document   : confirmaDadosCompra
    Created on : Apr 28, 2019, 10:15:33 AM
    Author     : matheus
--%>

<%@page import="ecommerce.dominio.cliente.Cliente"%>
<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="ecommerce.dominio.cliente.Cartao"%>
<%@page import="ecommerce.dominio.cliente.Endereco"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
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
        <title>JSP Page</title>
    </head>
    <body>
                                        <!-- NAV FIXO DO TOPO-->
                                <div class="navbar-fixed indigo darken-4">
                                    <nav>
                                        <div class="nav-wrapper indigo darken-4">
                                          <a href="#" class="brand-logo center maiusculo">Confirme o endereço</a>
                                          <ul class="left">
                                              <li><a href="../Clientes/home.jsp"><i class="material-icons">arrow_back</i></a></li>
                                          </ul>
                                        </div>
                                      </nav>
                                </div>
        <%
            int usuario_id = 0;
            int id =0;
            double valorTotal = 0;
            
            Resultado resultado = (Resultado) session.getAttribute("usuarioLogado");
            List<Cliente> clientes = (List) resultado.getEntidades();
            if(resultado != null) {
                         if(clientes.size() == 0) {
                            response.sendRedirect("../login.jsp");
                        } else {
                           for (Cliente cliente : clientes) {         
                              usuario_id = cliente.getId();
                           }
                         }
            }          
            Resultado resultado2 = (Resultado) request.getAttribute("resultado");
            if(resultado2 == null) {
                response.sendRedirect(request.getContextPath() + "/Clientes/ListarEndereco?acao=listar&id=" + usuario_id + "&conf=1");
            }
            else{
             List<Endereco> enderecos = (List) resultado2.getEntidades();
              
                         if(enderecos.size() == 0) {
                            out.print("Nenhum endereco cadastrado");
                        } else {
                            for (Endereco endereco : enderecos) {
  
                                %>
                                <br><br>
                                <form action="AdicionarPedido" method="POST">
                <table border='1'>
                    <thead>
                        <%
                            if(endereco.getTipoEndereco().equals("0")){         
                        %>
                            <tr><h4>Endereço de Entrega</h4></tr>
                       
                       <tr>
                                <th>#<th>Logradouro</th><th>Bairro</th><th>CEP</th><th>Numero</th><th>Cidade</th><th>UF</th>
                                <th>Tipo de logradouro</th><th>Complemento</th><th>Editar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                out.println("<tr>");
                                %>
                                <td><input type='radio' required name='id_endereco' value="<%=endereco.getId() %>" id="<%=endereco.getId() %>" /><label for="<%=endereco.getId() %>"></label></td>
                    <%            out.println("<td>" + endereco.getLogradouro()+ "</td>");
                                out.println("<td>" + endereco.getBairro()+ "</td>");
                                out.println("<td>" + endereco.getCep()+ "</td>");
                                out.println("<td>" + endereco.getNumero()+ "</td>");
                                out.println("<td>" + endereco.getCidade()+ "</td>");
                                out.println("<td>" + endereco.getUf()+ "</td>");
                                out.println("<td>" + endereco.getTipoLogradouro()+ "</td>");
                                out.println("<td>" + endereco.getComplemento()+ "</td>");
                                out.println("<td><a href='preAlterarEndereco.jsp?id=" + endereco.getId() + "'>Icone editar</a></td>");
                                out.println("</tr>");    
                                %>
            </tbody>
        </table>
      <%                     
                            }      
                        }
                    }     
                }
            
                    // Receber os dados do pedido : id_cliente + valor total
                    if(session.getAttribute("pedido") != null){
                        Pedido pedido = (Pedido) session.getAttribute("pedido");
                       // id = pedido.getCliente().getId();
                        valorTotal = pedido.getPagamento().getValorTotal();
                        }


                    %>
                    <br> <br> <br>
                    
                    
                    <a href="../Clientes/cadastro_endereco.jsp?id=<%=usuario_id%>">Adicionar endereco</a>   
                    <br><br><br>
                     <input type="hidden" name="valorTotal" value="<%=valorTotal%>">
                    <input type="hidden" name="u" value="<%=usuario_id%>">
                    <input type="submit">
        
            </form>

                      

    </body>
</html>