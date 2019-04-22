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
            <select id="bandeira" name="bandeira"class="validate" value="master ">
                <option value="" disabled>Bandeira</option>
                <option value="mastercard" selected >MasterCard</option>
                <option value="Visa">Visa</option>
                <option value="elo">Elo</option>
                
            </select>
                <br>
            <%
                String id = request.getParameter("id");
            %>                          
            <input type="hidden" value="<%= id %>" name="id" id="id" required>    
                
            <label for="numeroCartao" >Numero do cartão</label>                            
            <input type="text" value="2321321" name="numeroCartao" id="numeroCartao" required>

            <label for="nomeCartao" data-error="Informe o nome do cartão!" >Nome do cartão:</label>
            <input type="text" value="JOAO DA SILVA" name="nomeCartao" id="nomeCartao"required>
            
            <label for="dtVencimento" data-error="Informe a data Vencimento!" >Data de vencimento</label>
            <input type="text" value="2019-09-09" name="dtVencimento" id="dtValidade"required>
            
             <label for="codSeguranca" data-error="Informe o código de segurança!" >Codigo de segurança</label>
            <input type="text" value="033" name="codSeguranca" id="dtValidade"required>
            
            <br>
            <input type="submit" name="acao" value="inserir" class="btn btn-success">                       

        </form>
        <div><a href="../index.html">Voltar</a></div>  
    </body>
</html>
