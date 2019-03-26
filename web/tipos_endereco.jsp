<%-- 
    Document   : tipos_endereco
    Created on : Mar 26, 2019, 11:34:26 AM
    Author     : matheus
--%>

<%@page import="br.com.fatecmogidascruzes.dominio.Resultado"%>
<%@page import="br.com.fatecmogidascruzes.dominio.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Endereços do cliente</title>
    </head>
    <body>
        	<%
		Resultado resultado = (Resultado) request.getAttribute("resultado");
		if(resultado == null) {
			response.sendRedirect(request.getContextPath() + "/ListarEndereco?acao=listar");
			return;
		}
	%>
       <form action='/Agenda/AtualizarContato'>
            <input type='hidden' name='id' value='' /><br />
            <label for='nome'>Nome:</label>
            <input type='text' name='nome' id='nome' value='>' /><br />
            <label for='telefone'>Telefone:</label>
            <input type='text' name='telefone' id='telefone' value='>'/><br />
            <label for='email'>Email:</label>
            <input type='text' name='email' id='email'  value='' /><br />
            <input type='submit' name='atualizar' value=' Clique para atualizar' />
            <a href='Contatos'>Voltar</a>
        </form>
       

    </body>
</html>
