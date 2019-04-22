package livraria.web.controle;

import livraria.web.commands.ICommand;
import livraria.web.commands.CommandListar;
import livraria.web.commands.CommandInserir;
import livraria.web.commands.CommandAlterar;
import livraria.web.commands.CommandDesativar;
import livraria.web.commands.CommandAtivar;
import livraria.web.commands.CommandAutenticar;
import livraria.web.commands.CommandConsultar;
import livraria.web.commands.CommandLogout;
import livraria.core.dao.cliente.ClienteDAO;
import ecommerce.dominio.livro.Categoria;
import livraria.web.view.IViewHelper;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.GrupoLivro;
import livraria.core.aplicacao.Resultado;
import ecommerce.dominio.cliente.Telefone;
import ecommerce.dominio.Usuario;
import ecommerce.dominio.livro.Livro;
import livraria.core.util.ExcecaoAcessoDados;
import livraria.core.util.ExcecaoLimiteTentativas;
import livraria.web.view.cliente.ViewCartao;
import livraria.web.view.livro.ViewCategoria;
import livraria.web.view.cliente.ViewCliente;
import livraria.web.view.cliente.ViewEndereco;
import livraria.web.view.livro.ViewGrupoLivro;
import livraria.web.view.livro.ViewLivro;
import livraria.web.view.carrinho.ViewCarrinho;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class Control extends HttpServlet {
    
    private static Map<String, IViewHelper> viewHelper;
    private static Map<String, ICommand> commands;
    
    // Construtor que inicializará os caminhos de URL
    public Control(){
        super();
        
        //Mapa dos commands
        commands = new HashMap<String, ICommand>();
        commands.put("inserir", new CommandInserir());
        commands.put("listar", new CommandListar());
        commands.put("consultarPorID", new CommandConsultar());
        commands.put("alterar", new CommandAlterar());
        commands.put("desativar", new CommandDesativar());
        commands.put("ativar", new CommandAtivar());
        commands.put("login", new CommandAutenticar());
        commands.put("logout", new CommandLogout());
        
        // MAPA DAS VIEWS DO SISTEMA
        // Views Cliente
         viewHelper = new HashMap<String,IViewHelper>();
         viewHelper.put("/Ecommerce/Clientes/InserirCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/ListarClientes", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/PreAlterarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/AlterarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/DesativarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/Clientes/AtivarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/AutenticarCliente", new ViewCliente());
         viewHelper.put("/Ecommerce/LogoutCliente", new ViewCliente());
         // Views Endereco
         viewHelper.put("/Ecommerce/Clientes/InserirEndereco", new ViewEndereco());
         viewHelper.put("/Ecommerce/Clientes/ListarEndereco", new ViewEndereco());
         viewHelper.put("/Ecommerce/Clientes/AlterarEndereco", new ViewEndereco());   
         // Views Cartao
         viewHelper.put("/Ecommerce/Clientes/InserirCartao", new ViewCartao());
         viewHelper.put("/Ecommerce/Clientes/ListarCartao", new ViewCartao());
         viewHelper.put("/Ecommerce/Clientes/ExcluirCartao", new ViewCartao());
         // livro
        viewHelper.put("/Ecommerce/Livros/InserirLivro", new ViewLivro());
        viewHelper.put("/Ecommerce/Livros/ListarLivros", new ViewLivro());
        viewHelper.put("/Ecommerce/Livros/PreAlterarLivro", new ViewLivro());
        viewHelper.put("/Ecommerce/Livros/AlterarLivro", new ViewLivro());            
        viewHelper.put("/Ecommerce/Livros/DesativarLivro", new ViewLivro());
        viewHelper.put("/Ecommerce/Livros/AtivarLivro", new ViewLivro());
        // Categoria
        viewHelper.put("/Ecommerce/Livros/InserirCategoria", new ViewCategoria());
        viewHelper.put("/Ecommerce/Livros/AlterarCategoria", new ViewCategoria());
        viewHelper.put("/Ecommerce/Livros/ListarCategorias", new ViewCategoria());
        viewHelper.put("/Ecommerce/Livros/PreAlterarCategoria", new ViewCategoria());
        // ViewGrupo
        viewHelper.put("/Ecommerce/Livros/InserirGrupoLivro", new ViewGrupoLivro());
        viewHelper.put("/Ecommerce/Livros/ListarGrupoLivros", new ViewGrupoLivro());
        viewHelper.put("/Ecommerce/Livros/AlterarGrupoLivro", new ViewGrupoLivro());
        viewHelper.put("/Ecommerce/Livros/PreAlterarGrupoLivro", new ViewGrupoLivro());
        // ViewCarrinho
        viewHelper.put("/Ecommerce/Livros/AdicionarCarrinho", new ViewCarrinho());
        

    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uri = request.getRequestURI();
        String acao = request.getParameter("acao");
       // doPost(request, response);
        EntidadeDominio entidade = viewHelper.get(uri).getEntidade(request);
        Resultado resultado = commands.get(acao).executar(entidade);
        System.out.println("URL: " + uri + "  ACAO: " + acao);
        viewHelper.get(uri).setEntidade(resultado, request, response);
    	}
    
   @Override
    public void init() throws ServletException {
        super.init();
        
        //consultar estados e cidades e botar no contexto da aplicação (similar à session) salvar o map de Estados e cidades
		 
        ICommand commandListar = new CommandListar();

        Resultado resultado = commandListar.executar(new Categoria());
        List<EntidadeDominio> categorias = resultado.getEntidades();
        getServletContext().setAttribute("categorias", categorias);
        
        resultado = commandListar.executar(new GrupoLivro());
        List<EntidadeDominio> grupoLivros = resultado.getEntidades();
        getServletContext().setAttribute("grupoLivros", grupoLivros);
        
        resultado = commandListar.executar(new Livro());
        List<EntidadeDominio> livros = resultado.getEntidades();
        getServletContext().setAttribute("livros", livros);
    }

}