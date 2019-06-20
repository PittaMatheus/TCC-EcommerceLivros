<%@page import="ecommerce.dominio.estoque.Fornecedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
//        Resultado resultado = (Resultado) request.getAttribute("resultado");
        
        
        List<Fornecedor> fornecedores = (List<Fornecedor>) getServletContext().getAttribute("fornecedor");
        
//        if(resultado == null) {
//            response.sendRedirect(request.getContextPath() + "/Estoque/ListarEstoqueLivros?acao=listar");
//            return;
//        }
	%>
        <h4>Listar fornecedores</h4>
        
            <%
         
         
         
         if(fornecedores.size() == 0) {
            out.print("<br><br>Nenhum fornecedor foi cadastrado");
         }else {
        %> 
        <table border="1" style ="width: 100%">
        <tr>
            <th>Nome fornecedor</th>
            <th>CNPJ</th>
            <th>Razao social</th>
        </tr> 
        <%
            
            for(Fornecedor forn: fornecedores){
                Fornecedor fornecedor = (Fornecedor) forn;
        %>
            <tr>
                <td><%=fornecedor.getNome()%></td>
                <td><%=fornecedor.getCnpj()%></td>
                <td><%=fornecedor.getRazaoSocial()%></td>
            </tr>
            <%}
         }%>
        </table>
        
        <br>
        <a href='../Clientes/home.jsp'>Voltar</a>
    </body>
</html>