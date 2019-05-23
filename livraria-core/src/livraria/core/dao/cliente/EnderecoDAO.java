/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.cliente;

import livraria.core.dao.AbstractDAO;
import ecommerce.dominio.cliente.Cliente;
import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.cliente.Endereco;
import ecommerce.dominio.EntidadeDominio;
import livraria.core.aplicacao.Resultado;
import livraria.core.util.ExcecaoAcessoDados;
import livraria.core.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import static java.sql.Statement.RETURN_GENERATED_KEYS;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author matheus
 */
public class EnderecoDAO extends AbstractDAO {
    
    
    @Override
    public Resultado inserir(EntidadeDominio entidade){
    
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Endereco endereco = (Endereco) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("INSERT INTO endereco (logradouro, numero, bairro, cep, cidade, uf, tipoLogradouro, nomeEndereco,"
                    + "complemento, referencia, id_cliente) VALUES(?,?,?,?,?,?,?,?,?,?,?)");
                    declaracao.setString(1, endereco.getLogradouro());
                    declaracao.setString(2, endereco.getNumero());
                    declaracao.setString(3, endereco.getBairro());
                    declaracao.setString(4, endereco.getCep());           // inicia com 50 pontos                    
                    declaracao.setString(5, endereco.getCidade());
                    declaracao.setString(6, endereco.getUf());                    
                    declaracao.setString(7, endereco.getTipoLogradouro());
                    declaracao.setString(8, endereco.getNomeEndereco());
                    declaracao.setString(9, endereco.getComplemento());
                    declaracao.setString(10, endereco.getReferencia());
                    declaracao.setInt(11, endereco.getClienteId());
                   

            declaracao.execute();
            resultado.setStatus(true);
            
            resultado.setMensagem("O Endereco foi inserido com sucesso");
            // Fecha a conexao.
            conexao.close();
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();
            resultado.setStatus(false);
            resultado.setMensagem("Ocorreu um erro ao inserir o Endereco");
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
            Endereco endereco = (Endereco) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT e.id, e.logradouro, e.numero, e.bairro, e.cep, e.cidade, e.uf, "
                    + "e.tipoLogradouro, e.nomeEndereco, e.complemento, e.referencia, e.tipoEndereco "
                    + "FROM endereco e WHERE e.id_cliente = ?" );
            declaracao.setInt(1, endereco.getClienteId());
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Endereco end = new Endereco();
                end.setId(rs.getInt("id"));
                end.setLogradouro(rs.getString("logradouro"));
                end.setNumero(rs.getString("numero"));
                end.setBairro(rs.getString("bairro"));
                end.setCep(rs.getString("cep"));
                end.setCidade(rs.getString("cidade"));
                end.setUf(rs.getString("uf"));
                end.setTipoLogradouro(rs.getString("tipoLogradouro"));
                end.setNomeEndereco(rs.getString("nomeEndereco"));
                end.setComplemento(rs.getString("complemento"));
                end.setReferencia(rs.getString("referencia"));
                end.setTipoEndereco(rs.getString("tipoEndereco"));
                resultado.setAcao("listar");
                entidades.add(end);
		resultado.setStatus(true);
            }
            if(resultado.getAcao() == null){
                resultado.setAcao("inserir");
            }
           if(!endereco.isStatus()){
               resultado.setAcao("confirma");
           }
           conexao.close();
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o endereco");
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
            Endereco endereco = (Endereco) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("SELECT e.id, e.logradouro, e.numero, e.bairro, e.cep, e.cidade, e.uf, "
                    + "e.tipoLogradouro, e.nomeEndereco, e.complemento, e.referencia, e.tipoEndereco "
                    + "FROM endereco e WHERE e.id = ?" );
            declaracao.setInt(1, endereco.getClienteId());
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Endereco end = new Endereco();
                end.setId(rs.getInt("id"));
                end.setLogradouro(rs.getString("logradouro"));
                end.setNumero(rs.getString("numero"));
                end.setBairro(rs.getString("bairro"));
                end.setCep(rs.getString("cep"));
                end.setCidade(rs.getString("cidade"));
                end.setUf(rs.getString("uf"));
                end.setTipoLogradouro(rs.getString("tipoLogradouro"));
                end.setNomeEndereco(rs.getString("nomeEndereco"));
                end.setComplemento(rs.getString("complemento"));
                end.setReferencia(rs.getString("referencia"));
                end.setTipoEndereco(rs.getString("tipoEndereco"));
                entidades.add(end);
            }
        //if(resultado.getAcao() == null){
          //  resultado.setAcao("inserir");
       // }
        conexao.close();
        resultado.setAcao("listarEndereco");
        resultado.setStatus(true);    
        resultado.setMensagem("Listado com sucesso");
        }catch(ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao listar o endereco");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        resultado.setEntidades(entidades);
       return resultado;
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
       List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Endereco endereco = (Endereco) entidade;
            PreparedStatement declaracao = conexao.prepareStatement(""
                                                + "UPDATE endereco SET logradouro = ?, numero=?,bairro=?"
						+ ", cep=?,cidade=?, uf=?, tipoLogradouro=?, nomeEndereco=?,"
                                                + "complemento=?, referencia=? "
						+ " WHERE id=?");
            
				declaracao.setString(1, endereco.getLogradouro());
                                declaracao.setString(2, endereco.getNumero());
                                declaracao.setString(3, endereco.getBairro());
                                declaracao.setString(4, endereco.getCep());
                                declaracao.setString(5, endereco.getCidade());
                                declaracao.setString(6, endereco.getUf());
				declaracao.setString(7, endereco.getTipoLogradouro());
				declaracao.setString(8, endereco.getNomeEndereco());
                                declaracao.setString(9, endereco.getComplemento());
                                declaracao.setString(10, endereco.getReferencia());
				declaracao.setInt(11, endereco.getClienteId());

				declaracao.execute();
            System.out.print("EXECUTEI A QUERY CLIENTE");
            resultado.setStatus(true);
            resultado.setMensagem("O Cliente foi inserido com sucesso!");  
            resultado.setAcao("alterar");
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado ativar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }


 
    

}
