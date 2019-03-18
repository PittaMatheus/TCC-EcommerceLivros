<!DOCTYPE html>
<html>
    <head>
        <meta charset='UTF-8' />
        <title>Resultado da Operação</title>
    </head>
    <body>
        <h1>A <%= request.getAttribute("operacao")%> foi realizada com sucesso!</h1>
        <a href='${pageContext.request.contextPath}/Contatos'>Voltar</a>
    </body>
</html>
