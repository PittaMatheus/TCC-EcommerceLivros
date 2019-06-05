package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import ecommerce.dominio.livro.Livro;
import ecommerce.dominio.EntidadeDominio;
import java.util.List;
import livraria.core.aplicacao.Resultado;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Home</title>\n");
      out.write("        <!--Import Google Icon Font-->\n");
      out.write("        <link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">\n");
      out.write("        <!--Import materialize.css-->\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"../css/materialize.min.css\"  media=\"screen,projection\"/>\n");
      out.write("        <link type=\"text/css\" rel=\"stylesheet\" href=\"../css/Custom.css\"  media=\"screen,projection\"/>\n");
      out.write("         <!-- CSS CAROUSEL-->\n");
      out.write("         <link type=\"text/css\" rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick-theme.css\" media=\"screen,projection\"/>\n");
      out.write("         <link type=\"text/css\" rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.css\" media=\"screen,projection\"/>\n");
      out.write("        <!--Let browser know website is optimized for mobile-->\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\"/>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("       \n");
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body class=\"preto\">\n");
      out.write("    <!-- DROPDOWN DO LOGIN -->\n");
      out.write("        <ul id=\"dropdown1\" class=\"dropdown-content\">\n");
      out.write("            <li><a href=\"../login.jsp\">Login</a></li>\n");
      out.write("            <li class=\"divider\"></li>\n");
      out.write("            <li><a href=\"../Clientes/cadastro_cliente.jsp\">Cadastre-se</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <nav class=\"indigo darken-4\">\n");
      out.write("          <div class=\"nav-wrapper\">\n");
      out.write("            <a href=\"#!\" class=\"brand-logo\">Livraria</a>\n");
      out.write("            <ul class=\"right hide-on-med-and-down\">\n");
      out.write("              <li><a href=\"../Pedidos/carrinhoSessao.jsp\">Carrinho</a></li>\n");
      out.write("              <!-- DROPDOWN DO LOGIN -->\n");
      out.write("              <li><a class=\"dropdown-button\" href=\"#!\" data-activates=\"dropdown1\">Entre ou cadastre-se<i class=\"material-icons right\">arrow_drop_down</i></a></li>\n");
      out.write("            </ul>\n");
      out.write("          </div>\n");
      out.write("        </nav>\n");
      out.write("<!--FIM NAVBAR-->\n");
      out.write("\n");
      out.write("    ");

            if(session.getAttribute("mensagem") != null){ 
      out.write("\n");
      out.write("                    <input type=\"text\" class=\"btn\" id=\"mensagem\" onclick=\"Materialize.toast('O livro foi adicionado ao carrinho', 4000, 'green rounded')\">\n");
      out.write("                    <script>\n");
      out.write("                        window.onload = function(){\n");
      out.write("                            document.getElementById(\"mensagem\").click();\n");
      out.write("                        }\n");
      out.write("\n");
      out.write("                    </script>\n");
      out.write("                    \n");
      out.write("    ");

        }
        
    
      out.write("\n");
      out.write("    \n");
      out.write("    <br><br><br><br>\n");
      out.write("    <div class=\"container2 carousel_livros\">\n");
      out.write("        <div><img src=\"../imagens/pele.jpg\" width=\"200px\" alt=\"js\" /></div>\n");
      out.write("        <div><img src=\"../imagens/exorcista.jpg\" width=\"200px\" alt=\"java\" /></div>\n");
      out.write("        <div><img src=\"../imagens/java.jpg\" width=\"212px\" alt=\"python\"/></div>\n");
      out.write("        <div><img src=\"../imagens/pele.jpg\" width=\"200px\" alt=\"kotlin\" /></div>\n");
      out.write("        <div><img src=\"../imagens/pele.jpg\" width=\"200px\" alt=\"scala\" /></div>\n");
      out.write("        <div><img src=\"../imagens/pele.jpg\" width=\"200px\" alt=\"C#\" /></div>\n");
      out.write("        <div><img src=\"../imagens/pele.jpg\" width=\"200px\" alt=\"PHP\" /></div>\n");
      out.write("        <div><img src=\"../imagens/pele.jpg\"  width=\"200px\" alt=\"dotnet\" /></div>\n");
      out.write("    </div>\n");
      out.write("        \n");
      out.write("    <br><br><br><br>\n");
      out.write("        <div class=\"container2 carousel_livros\">\n");
      out.write("       ");
 
    Resultado resultado = (Resultado) request.getAttribute("resultado");
    if(resultado == null) {
            response.sendRedirect(request.getContextPath() + "/Livros/ListarLivros?acao=listar&status=1&menu=ok");
            return;
    }

    List<Livro> livros = (List) resultado.getEntidades();
                         
    if(livros.size() == 0) {
       out.print("<br><br>Nenhum livro cadastrado");
    }else { 
        for (Livro livro : livros) {
            
      out.write("\n");
      out.write("            <a href=\"../Pedidos/detalheItem.jsp?l=");
      out.print(livro.getId());
      out.write("\"> <div><img src=\"../imagens/");
      out.print(livro.getImagem());
      out.write("\"  width=\"200px\" /></div></a>\n");
      out.write("            ");

        }
    }
request.getSession().removeAttribute("mensagem");


      out.write("\n");
      out.write("    </div>\n");
      out.write("      \n");
      out.write("\n");
      out.write("    \n");
      out.write("\n");
      out.write("\n");
      out.write("        <br><br><br>\n");
      out.write("\n");
      out.write("\n");
      out.write("        \n");
      out.write("        <!-- JS CAROUSEL-->\n");
      out.write("        <script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-1.11.0.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-migrate-1.2.1.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.7.1/slick.js\"></script>\n");
      out.write("        <script>\n");
      out.write("           $('.carousel_livros').slick({\n");
      out.write("               slidesToShow: 5,\n");
      out.write("               slidesToScroll: 1,\n");
      out.write("               autoplay: true,\n");
      out.write("               autoplaySpeed: 2000,\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("        <!--Import jQuery before materialize.js-->\n");
      out.write("        <script type=\"text/javascript\" src=\"https://code.jquery.com/jquery-3.2.1.min.js\"></script>\n");
      out.write("        <script type=\"text/javascript\" src=\"../js/materialize.min.js\"></script>\n");
      out.write("        <script src=\"../js/Custom.js\"></script>\n");
      out.write("        <!-- Compiled and minified CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css\">\n");
      out.write("        <!-- Compiled and minified JavaScript -->\n");
      out.write("        <script src=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js\"></script>\n");
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
