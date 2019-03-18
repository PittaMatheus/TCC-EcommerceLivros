<%-- 
    Document   : cadastro_cliente
    Created on : Mar 9, 2019, 10:54:27 AM
    Author     : matheus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastre -se </title>
    </head>
    <body>
        <h1>Informe seus dados pessoais</h1>
        <form action="InserirCliente" name="acao" value="inserir" method="POST">
                   
                        <label for="nome" data-error="Informe o nome!">Nome</label>
                        <input type="text" name="nome" id="nome" value="${param['nome']}" class="validate" required>
                        
                        <label for="sobrenome" data-error="Informe o sobrenome!" >Sobrenome</label>
                        <input type="text" name="sobrenome" id="sobrenome" value="${param['sobrenome']}" class="validate" required>

                        <label for="cpf" data-error="Informe o CPF!">CPF</label>
                        <input type="text" name="cpf" id="cpf" value="${param['cpf']}" class="validate" required>

                        <label for="rg" data-error="Informe o RG!" >RG</label>
                        <input type="text" name="rg" id="rg" value="${param['rg']}" class="validate" required>

                        <label for="data_nascimento" data-error="Informe a data de nascimento!" >Data de nascimento</label>
                       <input type="text" name="data_nascimento" id="data_nascimento" value="${param['data_nascimento']}"class="validate"  required>
                       <br>
                       <br>
                       <label for="email" data-error="Informe o email!" >Email</label>
                       <input type="email" name="email" id="email" value="${param['email']}" class="validate" required>
                       
                       <label for="telefone" data-error="Informe o telefone!" >Telefone</label>
                       <input type="text" name="numTelefone" id="numTelefone" value="${param['numTelefone']}" class="validate" required>
                       
                       <label for="senha" data-error="Informe a senha" >Senha</label>
                       <input type="password" name="senha" id="senha" value="${param['senha']}" class="validate" required>

                       <label for="senhaConfirmada" data-error="Informe a senha confirmada">Confirme a senha</label>
                       <input type="password" name="senhaConfirmada" id="senhaConfirmada" value="${param['senhaConfirmada']}" class="validate" required>                       
                       
                        <label for="sexo" data-error="Informe o sexo"  >Sexo:</label>
                        <select id="sexo" name="sexo"class="validate" value="${param['sexo']}">
                            <option value="" disabled selected>Informe o sexo</option>
                            <option value="M">Masculino</option>
                            <option value="F">Feminino</option>
                        </select>
                            
                     <!-- DADOS ENDERECO-->       
                     <br> 
                        <h1>Endereco</h1>
                        
                        <label for="tipoEndereco" data-error="Informe o tipo do endereco"  >Endereço de: </label>
                        <select id="tipoEndereco" name="tipoEndereco"class="validate" value="${param['tipoEndereco']}">
                            <option value="" disabled selected>Tipo de endereço</option>
                            <option value="cobranca">Cobrança</option>
                            <option value="entrega">Entrega</option>
                        </select>
                            
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
                                                     
                        <br> <br> <br> <br>                         
                       <input type="submit" name="acao" value="inserir" class="btn btn-success">                                  
        </form>
                       
           <div><a href="index.html">Voltar</a></div>      

    </body>
</html>
