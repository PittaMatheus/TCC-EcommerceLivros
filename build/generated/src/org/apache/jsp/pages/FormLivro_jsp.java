package org.apache.jsp.pages;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Livro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import java.util.List;

public final class FormLivro_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Cadastro de livros</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("       ");
//List<EntidadeDominio> categorias = (List<EntidadeDominio>) getServletContext().getAttribute("categorias");
      out.write("\n");
      out.write("       ");
//List<EntidadeDominio> grupoLivros = (List<EntidadeDominio>) getServletContext().getAttribute("grupoLivros");
      out.write("\n");
      out.write("       ");
//Livro livro = (Livro)request.getAttribute("livro");
       
       //if(livro ==null){
        
      out.write("\n");
      out.write("            <form action=\"InserirLivro\" method=\"post\">\n");
      out.write("                 <h2>Cadastro de Livro</h2>\n");
      out.write("                 ");
 
                     //String mensagem = (String) request.getAttribute("mensagem");

                    // if (mensagem != null) {
                    //     out.print(mensagem);
                     //}
                 
      out.write("\n");
      out.write("\n");
      out.write("                 <input type=\"checkbox\" name=\"checkAtivo\" value=\"ativo\" checked=\"true\">Ativo<br>\n");
      out.write("\n");
      out.write("                 <label for=\"txtCodigo\">Código:</label> \n");
      out.write("                 <input type=\"text\" id=\"txtCodigo\" name=\"txtCodigo\" /> <br> \n");
      out.write("\n");
      out.write("                 <label for=\"txtAutor\">Autor:</label> \n");
      out.write("                 <input type=\"text\" id=\"txtAutor\" name=\"txtAutor\" /> <br> \n");
      out.write("\n");
      out.write("                 <label for=\"txtTitulo\">Título:</label> \n");
      out.write("                 <input type=\"text\" id=\"txtTitulo\" name=\"txtTitulo\" /> <br> \n");
      out.write("\n");
      out.write("                 <label for=\"txtAno\">Ano:</label>\n");
      out.write("                 <input type=\"text\" id=\"txtAno\" name=\"txtAno\" />\n");
      out.write("\n");
      out.write("                 <label for=\"txtEdicao\">Edição:</label> <input type=\"text\" id=\"txtEdicao\" name=\"txtEdicao\" /> <br>\n");
      out.write("\n");
      out.write("                 <label for=\"txtNumPaginas\">Número de páginas:</label> \n");
      out.write("                 <input type=\"text\" id=\"txtNumPaginas\" name=\"txtNumPaginas\" /> <br>\n");
      out.write("                 <label for=\"txtSinopse\">Sinopse:</label> \n");
      out.write("                 <input type=\"text\" id=\"txtSinopse\" name=\"txtSinopse\" /> <br>\n");
      out.write("                 <label for=\"txtEditora\">Editora:</label> \n");
      out.write("                 <input type=\"text\" id=\"txtEditora\" name=\"txtEditora\" /> <br>\n");
      out.write("\n");
      out.write("                 <label for=\"txtAltura\">Altura:</label>\n");
      out.write("                 <input type=\"text\" id=\"txtAltura\" name=\"txtAltura\" /> <br>\n");
      out.write("\n");
      out.write("                 <label for=\"txtLargura\">Largura:</label> \n");
      out.write("                 <input type=\"text\" id=\"txtLargura\" name=\"txtLargura\" /> <br>\n");
      out.write("\n");
      out.write("                 <label for=\"txtPeso\">Peso:</label>\n");
      out.write("                 <input type=\"text\" id=\"txtPeso\" name=\"txtPeso\" /> <br>\n");
      out.write("\n");
      out.write("                 <label for=\"txtProfundidade\">Profundidade:</label>\n");
      out.write("                 <input type=\"text\" id=\"txtProfundidade\" name=\"txtProfundidade\" /> <br>\n");
      out.write("\n");
      out.write("                 <label for=\"txtIsbn\">ISBN:</label>\n");
      out.write("                 <input type=\"text\" id=\"txtIsbn\" name=\"txtIsbn\" /> <br>\n");
      out.write("                 \n");
      out.write("\n");
      out.write("                 <label for=\"txtPreco\">Preço:</label> \n");
      out.write("                 <input type=\"text\" id=\"txtPreco\" name=\"txtPreco\" /> <br>\n");
      out.write("\n");
      out.write("                 <label>Categoria:</label><br>\n");
      out.write("\n");
      out.write("                 ");
/*for(EntidadeDominio edCat:categorias){
                     Categoria categoria = (Categoria)edCat;*/ 
      out.write("\n");
      out.write("                     <input type=\"checkbox\" name=\"categoria\" id =\"\"value=\"\"><><br>\n");
      out.write("\n");
      out.write("                 ");
//}
      out.write("\n");
      out.write("\n");
      out.write("                 <label>Grupo de Precificação:</label>\n");
      out.write("                 <select name=\"grupoLivro\" id=\"cbPrecificacao\">\n");
      out.write("                 <option value=\"\">Selecione um grupo...</option>\n");
      out.write("                     ");
//for(EntidadeDominio edGrupo:grupoLivros){
                         // GrupoLivro grupoLivro = (GrupoLivro)//edGrupo;
      out.write("\n");
      out.write("                 <option id =\"\"value=\"\"><></option>\n");
      out.write("                     ");
//}
      out.write("\t\n");
      out.write("                 </select>\n");
      out.write("\n");
      out.write("                 <br> \n");
      out.write("                 <input type=\"submit\" name=\"operacao\" value=\"salvar\" placeholder=\"SALVAR\" id=\"btSalvar\"/>\n");
      out.write("             </form>\n");
      out.write("        \n");
      out.write("        ");
//}}{
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
