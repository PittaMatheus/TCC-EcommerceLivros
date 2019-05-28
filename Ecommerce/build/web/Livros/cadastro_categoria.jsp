<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova categoria</title>
    </head>
    <body>
        <h1>Cadastrar nova categoria de livro</h1>
        <form action='InserirCategoria' method='POST'>
             <label for="nome">Nome da categoria</label> 
                 <input type="text" id="nomeCategoria" value="" name="nomeCategoria" /> <br>
                 <br>
                 <input type="submit" name="acao" value="inserir" placeholder="SALVAR" id="btSalvar"/>
                 
        </form>
        <br><br>
        <a href='${pageContext.request.contextPath}/Clientes/home.jsp'>Voltar</a>
    </body>
</html>
