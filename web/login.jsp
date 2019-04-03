<%-- 
    Document   : login
    Created on : Mar 22, 2019, 10:02:41 AM
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <form action="AutenticarUsuario" method="post">
            <br>
            <label for="id" >Login</label>                            
            <input type="text" value="email" name="email" id="usuarioLogin" required>
            <br><br>
            <label for="id" >Senha</label>                            
            <input type="password" value="senha123" name="senha" id="senha" required> 
            <br>   <br>          
            <input type="submit" name="acao" value="login" class="btn btn-success"> 
        </form>
        <br><br>
        <div><a href="cadastro_cliente.jsp">Cadastre-se</a></div>
        <div><a href="index.html">Voltar</a></div>  
    </body>
</html>
