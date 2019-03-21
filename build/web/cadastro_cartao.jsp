<%-- 
    Document   : cadastro_cartao
    Created on : Mar 21, 2019, 8:22:47 AM
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Adicionar cartão</h1>
        
        <form action="InserirCartao" name="acao" value="inserir" method="POST">
            <label for="bandeira" data-error="Informe a Bandeira"  >Bandeira do cartão: </label>
            <select id="bandeira" name="bandeira"class="validate" value="${param['bandeira']}">
                <option value="" disabled selected>Bandeira</option>
                <option value="vila">MasterCard</option>
                <option value="estrada">Visa</option>
                <option value="fazenda">Elo</option>
                
            </select>
                <br>
            <label for="id" >ID do cliente</label>                            
            <input type="text" value="${param['id']}" name="id" id="id" required>    
                
            <label for="numeroCartao" >Numero do cartão</label>                            
            <input type="text" value="${param['numeroCartao']}" name="numeroCartao" id="numeroCartao" required>

            <label for="nomeCartao" data-error="Informe o nome do cartão!" >Nome do cartão:</label>
            <input type="text" value="${param['nomeCartao']}" name="nomeCartao" id="nomeCartao"required>
            
            <label for="dtValidade" data-error="Informe a data de validade!" >Data de validade:</label>
            <input type="text" value="${param['dtValidade']}" name="dtValidade" id="dtValidade"required>
            
             <label for="codSeguranca" data-error="Informe o código de segurança!" >Codigo de segurança</label>
            <input type="text" value="${param['codSeguranca']}" name="codSeguranca" id="dtValidade"required>
            
            
            <input type="submit" name="acao" value="inserir" class="btn btn-success">                       

        </form>
        <div><a href="index.html">Voltar</a></div>  
    </body>
</html>
