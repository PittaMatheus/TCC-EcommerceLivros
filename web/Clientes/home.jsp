<%-- 
    Document   : home
    Created on : Mar 22, 2019, 10:24:36 AM
    Author     : matheus
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado"%>
<%@page import="br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        <%  
            if(session.getAttribute("usuarioLogado") == null){
                response.sendRedirect("../login.jsp");
            }else if(session.getAttribute("usuarioLogado") != null){
                Resultado resultado = (Resultado) session.getAttribute("usuarioLogado");    
                List<Cliente> clientes = (List) resultado.getEntidades();
                        if(resultado != null) {
                             if(clientes.size() == 0) {
                                out.print("<br><br>Nenhum cliente cadastrado");
                            } else {
                               for (Cliente cliente : clientes) {         
                                 out.print("Seja bem vindo usuario" + cliente.getNome());
                                 out.print("\nO seu papel é: " + cliente.getPapel().getId());
                             }
                        }
            }
        }
         %>
        <br><br>
        
        
        <div><a href="/Ecommerce/LogoutCliente">Sair</a></div>  
    </body>
</html>
