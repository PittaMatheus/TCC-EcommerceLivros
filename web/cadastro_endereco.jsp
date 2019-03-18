<%-- 
    Document   : cadastro_endereco
    Created on : Mar 17, 2019, 3:14:16 PM
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar endereco de entrega</title>
    </head>
    <body>
                    <h1>Endereco</h1>
        <form action="InserirEndereco" name="acao" value="inserir" method="POST">
            <label for="tipoLogradouro" data-error="Informe o tipo do endereco"  >Endereço de: </label>
            <select id="tipoLogradouro" name="tipoLogradouro"class="validate" value="${param['tipoLogradouro']}">
                <option value="" disabled selected>Tipo de logradouro</option>
                <option value="vila">Vila</option>
                <option value="estrada">Estrada</option>
                <option value="fazenda">Fazenda</option>
                <option value="sitio">Sitio</option>
                <option value="condominio">Condominio</option> 
                
            </select>
                <br>
            <label for="id" >ID do cliente</label>                            
            <input type="text" value="${param['id']}" name="id" id="id" required>    
                
            <label for="cep" >CEP</label>                            
            <input type="text" value="${param['cep']}" name="cep" id="cep" required>

            <label for="cidade" data-error="Informe a cidade!" >Cidade</label>
            <input type="text" value="${param['cidade']}" name="cidade" id="cidade"required>


            <label for="bairro" data-error="Informe a bairro!" >Bairro</label>
            <input type="text" value="${param['bairro']}" name="bairro" id="bairro"required>

            <label for="uf" data-error="Informe o estado!" >Estado</label>
            <input type="text" value="${param['uf']}" name="uf" id="uf"required>

            <label for="pais" data-error="Informe o pais!" >País</label>
            <input type="text" value="${param['pais']}" name="pais" id="pais"required>

            <button type="button" value="Buscar CEP" class="btn col s12 l2"/>Buscar CEP</button>

            <br>
            <label for="logradouro" data-error="Informe o endereço!">Endereço</label>
            <input type="text" value="${param['logradouro']}" name="logradouro" id="logradouro" required>

            <label for="numero" data-error="Informe o numero da casa!">Nº</label>
            <input type="text" value="${param['numero']}" name="numero" id="numero"required>

            <label for="complemento" data-error="Informe o complemento!">Complemento</label>
            <input type="text" value="${param['complemento']}" name="complemento" id="complemento">

            <label for="nomeEndereco" data-error="Informe o nome do endereco!">Nome do endereço: (Ex: Casa da avó)</label>
            <input type="text" value="${param['nomeEndereco']}" name="nomeEndereco" id="nomeEndereco">
<br>
            <label for="referencia"">(Opcional)Ponto de referência Ex: Proximo ao mercado X)</label>
            <input type="text" value="${param['referencia']}" name="referencia" id="referencia">            

<br> <br> <br> <br>

           <input type="submit" name="acao" value="inserir" class="btn btn-success">                       

        </form>
        <div><a href="index.html">Voltar</a></div>  
    </body>
</html>
