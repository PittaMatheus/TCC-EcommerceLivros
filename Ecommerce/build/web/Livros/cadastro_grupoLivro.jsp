<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Cadastrar um novo grupo de livro</h1>
        <form action='InserirGrupoLivro' method='POST'>
            <label for="nome">Nome do grupo</label> 
            <input type="text" id="nomeGrupo" value="" name="nomeGrupo" /> <br>
            <label for="nome">Margem de lucro</label> 
            <input type="text" id="margemLucro" value="" name="margemLucro" /> <br>
                <br>
            <input type="submit" name="acao" value="inserir" placeholder="SALVAR" id="btSalvar"/>
        </form>
        <br><br>
        <a href='${pageContext.request.contextPath}/Clientes/home.jsp'>Voltar</a>
    </body>
</html>
