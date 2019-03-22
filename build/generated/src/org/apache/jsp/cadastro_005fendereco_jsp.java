package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class cadastro_005fendereco_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Adicionar endereco de entrega</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("                    <h1>Endereco</h1>\n");
      out.write("        <form action=\"InserirEndereco\" name=\"acao\" value=\"inserir\" method=\"POST\">\n");
      out.write("            <label for=\"tipoLogradouro\" data-error=\"Informe o tipo do endereco\"  >Endereço de: </label>\n");
      out.write("            <select id=\"tipoLogradouro\" name=\"tipoLogradouro\"class=\"validate\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['tipoLogradouro']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\">\n");
      out.write("                <option value=\"\" disabled selected>Tipo de logradouro</option>\n");
      out.write("                <option value=\"vila\">Vila</option>\n");
      out.write("                <option value=\"estrada\">Estrada</option>\n");
      out.write("                <option value=\"fazenda\">Fazenda</option>\n");
      out.write("                <option value=\"sitio\">Sitio</option>\n");
      out.write("                <option value=\"condominio\">Condominio</option> \n");
      out.write("                \n");
      out.write("            </select>\n");
      out.write("                <br>\n");
      out.write("            <label for=\"id\" >ID do cliente</label>                            \n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['id']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"id\" id=\"id\" required>    \n");
      out.write("                \n");
      out.write("            <label for=\"cep\" >CEP</label>                            \n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['cep']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"cep\" id=\"cep\" required>\n");
      out.write("\n");
      out.write("            <label for=\"cidade\" data-error=\"Informe a cidade!\" >Cidade</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['cidade']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"cidade\" id=\"cidade\"required>\n");
      out.write("\n");
      out.write("\n");
      out.write("            <label for=\"bairro\" data-error=\"Informe a bairro!\" >Bairro</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['bairro']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"bairro\" id=\"bairro\"required>\n");
      out.write("\n");
      out.write("            <label for=\"uf\" data-error=\"Informe o estado!\" >Estado</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['uf']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"uf\" id=\"uf\"required>\n");
      out.write("\n");
      out.write("            <label for=\"pais\" data-error=\"Informe o pais!\" >País</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['pais']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"pais\" id=\"pais\"required>\n");
      out.write("\n");
      out.write("            <button type=\"button\" value=\"Buscar CEP\" class=\"btn col s12 l2\"/>Buscar CEP</button>\n");
      out.write("\n");
      out.write("            <br>\n");
      out.write("            <label for=\"logradouro\" data-error=\"Informe o endereço!\">Endereço</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['logradouro']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"logradouro\" id=\"logradouro\" required>\n");
      out.write("\n");
      out.write("            <label for=\"numero\" data-error=\"Informe o numero da casa!\">Nº</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['numero']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"numero\" id=\"numero\"required>\n");
      out.write("\n");
      out.write("            <label for=\"complemento\" data-error=\"Informe o complemento!\">Complemento</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['complemento']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"complemento\" id=\"complemento\">\n");
      out.write("\n");
      out.write("            <label for=\"nomeEndereco\" data-error=\"Informe o nome do endereco!\">Nome do endereço: (Ex: Casa da avó)</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['nomeEndereco']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"nomeEndereco\" id=\"nomeEndereco\">\n");
      out.write("<br>\n");
      out.write("            <label for=\"referencia\"\">(Opcional)Ponto de referência Ex: Proximo ao mercado X)</label>\n");
      out.write("            <input type=\"text\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${param['referencia']}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("\" name=\"referencia\" id=\"referencia\">            \n");
      out.write("\n");
      out.write("<br> <br> <br> <br>\n");
      out.write("\n");
      out.write("           <input type=\"submit\" name=\"acao\" value=\"inserir\" class=\"btn btn-success\">                       \n");
      out.write("\n");
      out.write("        </form>\n");
      out.write("        <div><a href=\"index.html\">Voltar</a></div>  \n");
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
