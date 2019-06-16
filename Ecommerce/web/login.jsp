<%@page import="ecommerce.dominio.pedido.Pedido"%>
<%@page import="livraria.core.aplicacao.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/Custom.css"  media="screen,projection"/>
        <!--Let browser know website is optimized for mobile-->
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
 
    </head>
    <body>
         <div class="center box-login espacamento_div">
        <%

            String valorTotal = request.getParameter("valorTotal");
            
            Pedido pedido = (Pedido) request.getSession().getAttribute("pedido");
            if(pedido != null){
                valorTotal = String.valueOf(pedido.getPagamento().getValorTotal());
                
            }
            %>
        
            
<%            // se o valorTotal não é nulo, apos o login o cliente será redirecionado para continuar a compra
            if(valorTotal != null){ 
%>              
            <br><br>
                <form action="AutenticarClienteCompra" method="post">
                    <img src="https://img.icons8.com/clouds/150/000000/literature.png">
                    <br>
                    <div class="container-login">
                        <input type='hidden' value='<%=valorTotal%>' name='valorTotal'>
                        <label for="id">Login</label>                            
                        <input type="text" value="emailteste@teste.com" name="email" id="usuarioLogin" required>
                        <br><br>
                        <label for="id">Senha</label>                            
                        <input type="password" value="SenhaValida!@#" name="senha" id="senha" required> 
                        <br>   <br>          
                        <input type="submit" name="acao" value="login" class="btn grey darken-3 espacamento_button">
                    </div>
                </form>
              
<%
            }else{
%>
            <form action="AutenticarCliente" method="post">
                <br><br>
                <div class="container-login">
                    <img src="https://img.icons8.com/clouds/150/000000/literature.png">
                    <br>
                    <label for="id">Login</label>                            
                    <input type="text" value="emailteste@teste.com" name="email" id="usuarioLogin" required>
                    <br><br>
                    <label for="id">Senha</label>                            
                    <input type="password" value="SenhaValida!@#" name="senha" id="senha" required> 
                    
                    <%
                            Resultado resultado = (Resultado) request.getAttribute("resultado");
        if(resultado != null) {
                if(!resultado.isStatus() && !resultado.getMensagem().isEmpty()) {
                        out.print("<div class='container2 forma_redonda_vermelho'>");
                        out.print(resultado.getMensagem());
                        out.print("</div>");
                } else {
                        if(!resultado.getMensagem().isEmpty()) {
                                out.print("<div class='container2 forma_redonda_vermelho'>");
                                out.print(resultado.getMensagem());
                                out.print("</div>");
                        }
                }
        }
                    %>
                    <br>
                    <input type="submit" name="acao" value="login" class="btn grey darken-3 espacamento_button">
                </div>
            </form>
                
<%
}
%>
        
    

            
       
            <a href="Clientes/cadastro_cliente.jsp">Cadastre-se</a> | <a href="index.jsp">Voltar</a>
        </div>
         
        <!-- PLANO DE FUNDO COM CSS -->
        <div class="box-image"></div>
        
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.js"></script>
        <script src="../js/Custom.js"></script>
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    </body>
</html>
