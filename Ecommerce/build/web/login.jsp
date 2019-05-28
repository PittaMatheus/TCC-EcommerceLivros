<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
        Resultado resultado = (Resultado) request.getAttribute("resultado");
        if(resultado != null) {
                if(!resultado.isStatus() && !resultado.getMensagem().isEmpty()) {
                        out.print("<div class='alert alert-danger'>");
                        out.print(resultado.getMensagem());
                        out.print("</div>");
                } else {
                        if(!resultado.getMensagem().isEmpty()) {
                                out.print("<div class='alert alert-success'>");
                                out.print(resultado.getMensagem());
                                out.print("</div>");
                        }
                }
        }
        String valorTotal = request.getParameter("valorTotal");
            %>
        
<%            // se o valorTotal não é nulo, apos o login o cliente será redirecionado para continuar a compra
            if(valorTotal != null){ 
%>
                <form action="AutenticarClienteCompra" method="post">
                    <input type='hidden' value='<%=valorTotal%>' name='valorTotal'>
                    <label for="id">Login</label>                            
                    <input type="text" value="email" name="email" id="usuarioLogin" required>
                    <br><br>
                    <label for="id">Senha</label>                            
                    <input type="password" value="SenhaValida!@#" name="senha" id="senha" required> 
                    <br>   <br>          
                    <input type="submit" name="acao" value="login" class="btn btn-success"> 
                </form>
<%
            }else{
%>
            <form action="AutenticarCliente" method="post">
                    <label for="id" >Login</label>                            
                    <input type="text" value="email" name="email" id="usuarioLogin" required>
                    <br><br>
                    <label for="id" >Senha</label>                            
                    <input type="password" value="SenhaValida!@#" name="senha" id="senha" required> 
                    <br>   <br>          
                    <input type="submit" name="acao" value="login" class="btn btn-success"> 
                </form>
<%
}
%>
        
            <br>
           

            
        </form>
        <br><br>
        <div><a href="Clientes/cadastro_cliente.jsp">Cadastre-se</a></div>
        <div><a href="index.html">Voltar</a></div>  
    </body>
</html>
