<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar endereco de entrega</title>
    </head>
    <body>
        <%
                String id = request.getParameter("id");
            %>  
                    <h1>Adicionar endereco de entrega</h1>
        <form action="InserirEndereco" name="acao" value="inserir" method="POST">
            <label for="tipoLogradouro" data-error="Informe o tipo do endereco"  >Endereço de: </label>
            <select id="tipoLogradouro" name="tipoLogradouro"class="validate"   >
                <option value="" disabled >Tipo de logradouro</option>
                <option value="vila"selected>Vila</option>
                <option value="estrada">Estrada</option>
                <option value="fazenda">Fazenda</option>
                <option value="sitio">Sitio</option>
                <option value="condominio">Condominio</option> 
                
            </select>
                <br>                       
            <input type="hidden" value="<%= id %>" name="id" id="id" required>    
                
            <label for="cep" >CEP</label>                            
            <input type="text" value="09870-090" name="cep" id="cep" required>
            <button type="button" value="Buscar CEP" class="btn col s12 l2"/>Buscar CEP</button>
        <br>
            <label for="cidade" data-error="Informe a cidade!" >Cidade</label>
            <input type="text" value="Mogi das cruzes" name="cidade" id="cidade"required>


            <label for="bairro" data-error="Informe a bairro!" >Bairro</label>
            <input type="text" value="cubas" name="bairro" id="bairro"required>

            <label for="uf" data-error="Informe o estado!" >Estado</label>
            <input type="text" value="SP" name="uf" id="uf"required>

            <label for="pais" data-error="Informe o pais!" >País</label>
            <input type="text" value="Brasil" name="pais" id="pais"required>

            

            <br>
            <label for="logradouro" data-error="Informe o endereço!">Endereço</label>
            <input type="text" value="A.V brasil" name="logradouro" id="logradouro" required>

            <label for="numero" data-error="Informe o numero da casa!">Nº</label>
            <input type="text" value="664" name="numero" id="numero"required>

            <label for="complemento" data-error="Informe o complemento!">Complemento</label>
            <input type="text" value="Apt 22" name="complemento" id="complemento">

            <label for="nomeEndereco" data-error="Informe o nome do endereco!">Nome do endereço: (Ex: Casa da avó)</label>
            <input type="text" value="Casa da vó" name="nomeEndereco" id="nomeEndereco">
<br>
            <label for="referencia"">(Opcional)Ponto de referência Ex: Proximo ao mercado X)</label>
            <input type="text" value="Proximo ao mercado" name="referencia" id="referencia">            

<br> <br> <br> <br>

           <input type="submit" name="acao" value="inserir" class="btn btn-success">                       

        </form>
        <div><a href="../index.html">Voltar</a></div>  
    </body>
</html>
