/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.livro;

import livraria.core.dao.AbstractDAO;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Livro;
import livraria.core.aplicacao.Resultado;
import livraria.core.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author matheus
 */
public class EditoraDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        try {
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            PreparedStatement declaracao = conexao.prepareStatement("UPDATE editora SET nome_editora=? WHERE id=?");
     
            declaracao.setString(1, livro.getEditora().getNome());
            declaracao.setDouble(2, livro.getEditora().getId());
            declaracao.execute();
            resultado.setStatus(true);
            resultado.setMensagem("A editora foi alterada com sucesso!");
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

    @Override
    public Resultado consultar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
