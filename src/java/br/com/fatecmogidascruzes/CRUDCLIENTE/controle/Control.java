package br.com.fatecmogidascruzes.CRUDCLIENTE.controle;

import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.ICommand;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandListar;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandInserir;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandAlterar;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandDesativar;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandAtivar;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandAutenticar;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandConsultar;
import br.com.fatecmogidascruzes.CRUDCLIENTE.controle.commands.CommandLogout;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dados.ClienteDAO;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.IViewHelper;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Endereco;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.GrupoLivro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Telefone;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Usuario;
import br.com.fatecmogidascruzes.CRUDCLIENTE.excecao.ExcecaoAcessoDados;
import br.com.fatecmogidascruzes.CRUDCLIENTE.excecao.ExcecaoLimiteTentativas;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.ViewCartao;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.ViewCliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.ViewEndereco;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.ViewLivro;
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
		 
        ICommand command = new CommandConsultar();

        Resultado resultado = command.executar(new Categoria());
        List<EntidadeDominio> categorias = resultado.getEntidades();
        getServletContext().setAttribute("categorias", categorias);
        
        resultado = command.executar(new GrupoLivro());
        List<EntidadeDominio> grupoLivros = resultado.getEntidades();
        getServletContext().setAttribute("grupoLivros", grupoLivros);
    }

}