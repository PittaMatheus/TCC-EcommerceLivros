<%-- 
    Document   : preAlterarEndereco
    Created on : Mar 29, 2019, 11:45:14 AM
    Author     : matheus
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Endereco"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Resultado"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alterar endereco</title>
    </head>
    <body>
       <h1>Alterar endereco de entrega</h1>
       <%
                String id = request.getParameter("id");    
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/Clientes/AlterarEndereco?acao=consultarPorID&id=" + id);
			return;
		}

                         List<Endereco> enderecos = (List) resultado.getEntidades();
                         
                         if(enderecos.size() == 0) {
                            out.print("Erro");                   
                        } else { 

                            for (Endereco endereco : enderecos) {


	%>
       
       
       
       
       
        <form action="AlterarEndereco" name="acao" value="alterar" method="POST">
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
            <input type="hidden" value="<%= endereco.getId()%>" name="id" id="id" required>    
                
            <label for="cep" >CEP</label>                            
            <input type="text" value="<%= endereco.getCep()%>" name="cep" id="cep" required>
            <button type="button" value="buscarCep>" class="btn col s12 l2"/>Buscar CEP</button>
        <br>
            <label for="cidade" data-error="Informe a cidade!" >Cidade</label>
            <input type="text" value="<%= endereco.getCidade()%>" name="cidade" id="cidade"required>


            <label for="bairro" data-error="Informe a bairro!" >Bairro</label>
            <input type="text" value="<%= endereco.getBairro()%>" name="bairro" id="bairro"required>

            <label for="uf" data-error="Informe o estado!" >Estado</label>
            <input type="text" value="<%= endereco.getUf()%>" name="uf" id="uf"required>
          

            <br>
            <label for="logradouro" data-error="Informe o endereço!">Endereço</label>
            <input type="text" value="<%= endereco.getLogradouro()%>" name="logradouro" id="logradouro" required>

            <label for="numero" data-error="Informe o numero da casa!">Nº</label>
            <input type="text" value="<%= endereco.getNumero()%>" name="numero" id="numero"required>

            <label for="complemento" data-error="Informe o complemento!">Complemento</label>
            <input type="text" value="<%= endereco.getComplemento()%>" name="complemento" id="complemento">

            <label for="nomeEndereco" data-error="Informe o nome do endereco!">Nome do endereço: (Ex: Casa da avó)</label>
            <input type="text" value=<%= endereco.getNomeEndereco()%>"" name="nomeEndereco" id="nomeEndereco">
<br>
            <label for="referencia"">(Opcional)Ponto de referência Ex: Proximo ao mercado X)</label>
            <input type="text" value=
                   "<%=endereco.getReferencia()%>" 
                   name="referencia" id="referencia">            

<br> <br> <br> <br>

           <input type="submit" name="acao" value="alterar" class="btn btn-success">                       

        </form>
             <%
                                            }
                         }        %>
        <div><a href="../index.html">Voltar</a></div>  
    </body>
</html>
