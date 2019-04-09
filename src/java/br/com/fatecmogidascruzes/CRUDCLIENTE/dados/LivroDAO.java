/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.dados;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Categoria;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Livro;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Resultado;
import br.com.fatecmogidascruzes.CRUDCLIENTE.util.BancoDadosOracle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author matheus
 */
public class LivroDAO extends AbstractDAO{

    @Override
    public Resultado inserir(EntidadeDominio entidade) {
         List<EntidadeDominio> ListEntidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            
            // Inserindo a editora e recuperando ID para colocar na inserção do LIVRO
             PreparedStatement declaracao = conexao.prepareStatement(
                    "INSERT INTO editora "
                    + "(nome_editora) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
             declaracao.setString(1, livro.getEditora().getNome());
             declaracao.execute();
             ResultSet rs = declaracao.getGeneratedKeys(); 
             livro.getEditora().setId((rs.next())?rs.getInt(1):0);
             
             // Inserir categoria
             PreparedStatement declaracao2 = conexao.prepareStatement(
                    "INSERT INTO dimensoes "
                    + "(altura, largura, peso, profundidade) VALUES (?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
             declaracao2.setDouble(1, livro.getDimensoes().getAltura());
             declaracao2.setDouble(2, livro.getDimensoes().getLargura());
             declaracao2.setDouble(3, livro.getDimensoes().getPeso());
             declaracao2.setDouble(4, livro.getDimensoes().getProfundidade());
             declaracao2.execute();
             rs = declaracao2.getGeneratedKeys(); 
             livro.getDimensoes().setId((rs.next())?rs.getInt(1):0);
             
  
            PreparedStatement declaracao3 = conexao.prepareStatement(
                    "INSERT INTO livro "
                    + "(codigo_barras, autor, titulo, ano, edicao, numero_paginas, sinopse, ativo, preco, nome_editora,id_dimensao, id_isbn, id_grupolivro("
                   + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            declaracao3.setString(1, livro.getCodigoBarras());
            declaracao3.setString(2, livro.getAutor());
            declaracao3.setString(3, livro.getTitulo());
            declaracao3.setString(4, livro.getAno());
            declaracao3.setString(5, livro.getEdicao());
            declaracao3.setString(6, livro.getNumeroPaginas());
            declaracao3.setString(7, livro.getSinopse());
            declaracao3.setBoolean(8, livro.getAtivo());
            declaracao3.setDouble(9, livro.getPreco());
            declaracao3.setInt(10, livro.getEditora().getId());
            declaracao3.setInt(11, livro.getDimensoes().getId());
            declaracao3.setInt(12, livro.getIsbn().getId());
            declaracao3.setInt(13, livro.getGrupoLivro().getId());
            declaracao3.execute();

            rs = declaracao3.getGeneratedKeys(); 
            livro.setId((rs.next())?rs.getInt(1):0);

            for(Categoria categoria: livro.getCategorias()){
                 PreparedStatement declaracao4 = conexao.prepareStatement(
                    "INSERT INTO livro "
                    + "(id_livro, id_categoria VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
               declaracao4.setInt(1, livro.getId());
               declaracao4.setInt(2, categoria.getId());
                declaracao3.execute();
            }
          
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Resultado alterar(EntidadeDominio entidade) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
