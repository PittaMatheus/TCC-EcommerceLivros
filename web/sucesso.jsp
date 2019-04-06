<!DOCTYPE html>
<html>
    <head>
        <meta charset='UTF-8' />
        <title>Resultado da Operação</title>
    </head>
    <body>
        <h1>A 
            <%= 
                
               request.getAttribute("acao")
            
            
            %> 
            
            
            foi realizada com sucesso!</h1>
        <a href='${pageContext.request.contextPath}/Clientes/home.jsp'>Voltar</a>
    </body>
</html>
