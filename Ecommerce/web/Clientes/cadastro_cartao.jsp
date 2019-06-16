<%@page import="ecommerce.dominio.cliente.Bandeira"%>
<%@page import="java.util.List"%>
<%@page import="ecommerce.dominio.EntidadeDominio"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Adicionar cartão</title>
    </head>
    <body>
        <%
            List<EntidadeDominio> bandeiras = (List<EntidadeDominio>) getServletContext().getAttribute("bandeira");
            String id = request.getParameter("id");
            if(bandeiras.size() == 0){
                response.sendRedirect(request.getContextPath() + "/Clientes/ListarCartao?acao=consultarPorID&id=" + id);
		return;
            
            }
	%>

        
        
            <form action="InserirCartao" method="GET">
                    
            <input type="hidden" value="<%= id %>" name="id" id="id" required> 
           
        <br> <br>
        <div class ="container row">
            <h5 class="forma_redonda negrito center">Informe os dados do cartão</h5>
            <br>
            <div class="input-field col s6">
                <label for="nomeCartao" data-error="Informe o nome do cartão!" >Nome do cartão:</label>
                <input type="text" value="JOAO DA SILVA" name="nomeCartao" id="nomeCartao"required>
            </div>
            
            <div class="input-field col s6">
                <label for="dtVencimento" data-error="Informe a data Vencimento!" >Data de vencimento</label>
                <input type="date" name="dtVencimento" id="dtValidade"required> 
            </div>
            
            
            <div class="input-field col s12">
                <label>Bandeira do cartão: </label>
                <select name="bandeira" id="cbBandeira">
                 <option value="" disabled>Selecione uma bandeira...</option>
                     <%for(EntidadeDominio edBandeira : bandeiras){
                         Bandeira bandeira = (Bandeira) edBandeira;%>
                 <option id ="cbBandeira<%=bandeira.getId()%>" value="<%=bandeira.getId()%>"><%=bandeira.getNome()%></option>
                     <%}%>	
                 </select>
            </div>
                 
            <div class="input-field col s6">
                   
                <label for="numeroCartao">Numero do cartão</label>                            
                <input type="text" value="2321321" name="numeroCartao" id="numeroCartao" required>  
            </div>
           
            <div class="input-field col s6">
                <label for="codSeguranca" data-error="Informe o código de segurança!" >Codigo de segurança</label>
                <input type="text" value="033" name="codSeguranca" id="dtValidade"required>
            </div>
              
            <div class="input-field col s12">
            <button type="submit" name="acao" value="inserir" class="btn-border">Cadastrar cartão</button>
            </div>
        </div>
        </form>

        
        <!--Import jQuery before materialize.js-->
<!--        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../js/materialize.js"></script>
        <script src="../js/Custom.js"></script>
         Compiled and minified CSS 
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
         Compiled and minified JavaScript 
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>-->
        
        
        
        
    </body>
</html>
