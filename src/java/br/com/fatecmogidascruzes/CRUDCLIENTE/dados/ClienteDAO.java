package br.com.fatecmogidascruzes.CRUDCLIENTE.dados;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Endereco;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import br.com.fatecmogidascruzes.CRUDCLIENTE.excecao.ExcecaoAcessoDados;
import br.com.fatecmogidascruzes.CRUDCLIENTE.excecao.ExcecaoLimiteTentativas;
import br.com.fatecmogidascruzes.CRUDCLIENTE.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static java.sql.Statement.RETURN_GENERATED_KEYS;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ClienteDAO extends AbstractDAO {

   @Override
    public Resultado inserir(EntidadeDominio    entidade){
        List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cliente cliente = (Cliente) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO cliente "
                    + "(nome,sobrenome, data_nascimento, ranking, senha, email, cpf,rg, sexo)"
                                    + " VALUES(?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
                    
                    declaracao.setString(1, cliente.getNome());
                    declaracao.setString(2, cliente.getSobrenome());
                    declaracao.setDate(3, new java.sql.Date(cliente.getData_nascimento().getTime()));
                    declaracao.setDouble(4, 50);           // inicia com 50 pontos                    
                    declaracao.setString(5, cliente.getSenha());
                    declaracao.setString(6, cliente.getEmail());                    
                    declaracao.setString(7, cliente.getCpf());
                    declaracao.setString(8, cliente.getRg());
                    declaracao.setString(9, cliente.getSexo());
            declaracao.execute();
            System.out.print("EXECUTEI A QUERY CLIENTE");
            ResultSet rs = declaracao.getGeneratedKeys();
            // Seta o ID cliente com o ID autoincrement que foi gerado no banco de dados
            cliente.setId((rs.next())?rs.getInt(1):0);
            
            //Inserir endereco de cobranca no cliente 
            PreparedStatement declaracao2 = conexao.prepareStatement("INSERT INTO endereco "
                    + "(logradouro,numero, bairro, cep, cidade, uf, tipoLogradouro,nomeEndereco, complemento, "
                    + "referencia, tipoEndereco, id_cliente)"
                        + " VALUES(?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
                    declaracao2.setString(1, cliente.getEndereco().getLogradouro());
                    declaracao2.setString(2, cliente.getEndereco().getNumero());
                    declaracao2.setString(3, cliente.getEndereco().getBairro());
                    declaracao2.setString(4, cliente.getEndereco().getCep());                  
                    declaracao2.setString(5, cliente.getEndereco().getCidade());
                    declaracao2.setString(6, cliente.getEndereco().getUf());                    
                    declaracao2.setString(7, cliente.getEndereco().getTipoLogradouro());
                    declaracao2.setString(8, cliente.getEndereco().getNomeEndereco());
                    declaracao2.setString(9, cliente.getEndereco().getComplemento());
                    declaracao2.setString(10, cliente.getEndereco().getReferencia());
                    declaracao2.setString(11, "1");
                    declaracao2.setInt(12, cliente.getId());
                    declaracao2.execute();
            
            
            resultado.setStatus(true);
            resultado.setMensagem("O Cliente foi inserido com sucesso!");
            
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao inserir o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cliente cliente = (Cliente) entidade;
            if(cliente.isStatus()){
            PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id,c.nome,c.sobrenome, c.data_nascimento, "
                    + "c.ranking, c.email, c.cpf, c.rg, c.sexo "
                    + "FROM cliente c WHERE c.status = 1");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Cliente cli = new Cliente();
                cli.setId(rs.getInt("id"));
                cli.setNome(rs.getString("nome"));
                cli.setSobrenome(rs.getString("sobrenome"));
                cli.setData_nascimento(rs.getDate("data_nascimento"));
                cli.setRanking(rs.getDouble("ranking"));
                cli.setEmail(rs.getString("email"));
                cli.setCpf(rs.getString("cpf"));
                cli.setRg(rs.getString("rg"));
                cli.setSexo(rs.getString("sexo"));
               
                entidades.add(cli);
            }
            resultado.setStatus(true);
            resultado.setAcao("listarCliente");
           }
            else if(!cliente.isStatus()){
            PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id,c.nome,c.sobrenome, c.data_nascimento, "
                    + "c.ranking, c.email, c.cpf, c.rg, c.sexo "
                    + "FROM cliente c WHERE c.status = 0");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Cliente cli = new Cliente();
                cli.setId(rs.getInt("id"));
                cli.setNome(rs.getString("nome"));
                cli.setSobrenome(rs.getString("sobrenome"));
                cli.setData_nascimento(rs.getDate("data_nascimento"));
                cli.setRanking(rs.getDouble("ranking"));
                cli.setEmail(rs.getString("email"));
                cli.setCpf(rs.getString("cpf"));
                cli.setRg(rs.getString("rg"));
                cli.setSexo(rs.getString("sexo"));
               
                entidades.add(cli);
            }
            resultado.setStatus(true);
            resultado.setAcao("listarDesativados");
            }
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        resultado.setEntidades(entidades);
       return resultado;
    }

   @Override
    public Resultado consultar(EntidadeDominio entidade) {
         List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cliente cliente = (Cliente) entidade;
            // Se o id do objeto cliente não estiver preenchido. A funcao consultar irá consultar o CPF e EMAIL
            if(cliente.getId() == null && cliente.getCpf() != null){
                        PreparedStatement declaracao = conexao.prepareStatement("SELECT c.email, c.cpf "
                            + "FROM cliente c WHERE c.status = 1 AND c.cpf = ? OR c.email = ?");
                    declaracao.setString(1, cliente.getCpf());
                    declaracao.setString(2, cliente.getEmail());

                    ResultSet rs =  declaracao.executeQuery();

                    while(rs.next()) {
                        Cliente cli = new Cliente();
                        cli.setCpf(rs.getString("cpf"));
                        cli.setEmail(rs.getString("email"));
                        entidades.add(cli);
                    }
                    resultado.setEntidades(entidades);
                    return resultado;

            }else if(cliente.getId() == null & cliente.getCpf() == null){
                        PreparedStatement declaracao = conexao.prepareStatement("SELECT c.email, c.senha "
                            + "FROM cliente c WHERE c.status = 1 AND c.email=? AND c.senha=?");
                    declaracao.setString(1, cliente.getEmail());
                    declaracao.setString(2, cliente.getSenha());

                    ResultSet rs =  declaracao.executeQuery();

                    while(rs.next()) {
                        Cliente cli = new Cliente();
                        cli.setSenha(rs.getString("senha"));
                        cli.setEmail(rs.getString("email"));
                        entidades.add(cli);
                    }

                    resultado.setEntidades(entidades);

                    return resultado;



            }else{
                    PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id,c.nome,c.sobrenome, c.data_nascimento, "
                            + "c.ranking, c.email, c.cpf, c.rg, c.sexo "
                            + "FROM cliente c WHERE c.status = 1 AND c.id = ?");
                    declaracao.setInt(1, cliente.getId());
                    ResultSet rs =  declaracao.executeQuery();
                    while(rs.next()) {
                        Cliente cli = new Cliente();
                        cli.setId(rs.getInt("id"));
                        cli.setNome(rs.getString("nome"));
                        cli.setSobrenome(rs.getString("sobrenome"));
                        cli.setData_nascimento(rs.getDate("data_nascimento"));
                        cli.setRanking(rs.getDouble("ranking"));
                        cli.setEmail(rs.getString("email"));
                        cli.setCpf(rs.getString("cpf"));
                        cli.setRg(rs.getString("rg"));
                        cli.setSexo(rs.getString("sexo"));
                        resultado.setAcao("consultarCliente");
                        entidades.add(cli);
                        resultado.setStatus(true);
                       }
                    }
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o endereco");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        resultado.setMensagem("Listado com sucesso");
        resultado.setEntidades(entidades);
        resultado.setStatus(true);
       return resultado;
    }

   @Override
    public Resultado alterar(EntidadeDominio entidade) {
         List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cliente cliente = (Cliente) entidade;
            PreparedStatement declaracao = conexao.prepareStatement(""
                                                + "UPDATE cliente SET nome = ?, sobrenome=?,data_nascimento=?"
						+ ", email=?,cpf=?, rg=?, sexo=? "
						+ " WHERE id=?");
            
				declaracao.setString(1, cliente.getNome());
                                declaracao.setString(2, cliente.getSobrenome());
                                declaracao.setDate(3, new java.sql.Date(cliente.getData_nascimento().getTime()));
                                declaracao.setString(4, cliente.getEmail());
                                declaracao.setString(5, cliente.getCpf());
				declaracao.setString(6, cliente.getRg());
				declaracao.setString(7, cliente.getSexo());
				declaracao.setInt(8, cliente.getId());
				declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("O Cliente foi inserido com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao inserir o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }
     
    @Override
    public Resultado desativar(EntidadeDominio entidade) {
         List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cliente cliente = (Cliente) entidade;
            PreparedStatement declaracao = conexao.prepareStatement(""
                                                + "UPDATE cliente SET status = ?"
						+ " WHERE id=?");
            
				declaracao.setString(1, "0");
				declaracao.setInt(2, cliente.getId());
				declaracao.execute();

            resultado.setStatus(true);
            resultado.setMensagem("O Cliente foi desativado com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao desativar o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }

    @Override
    public Resultado ativar(EntidadeDominio entidade) {
       List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Cliente cliente = (Cliente) entidade;
            PreparedStatement declaracao = conexao.prepareStatement(""
                                                + "UPDATE cliente SET status = ?"
						+ " WHERE id=?");
            
				declaracao.setString(1, "1");
				declaracao.setInt(2, cliente.getId());
				declaracao.execute();

            resultado.setStatus(true);
            resultado.setMensagem("O Cliente foi ativado com sucesso!");   
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao ativar o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
          return resultado;
    }
    
 
    
    
    
    
}
    
