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
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
             
             
            // Inserir categoria
             PreparedStatement declaracao3 = conexao.prepareStatement(
                    "INSERT INTO isbm "
                    + "(cod_barras) VALUES (?)", Statement.RETURN_GENERATED_KEYS);
             declaracao3.setString(1, livro.getIsbn().getCodBarras());
             declaracao3.execute();
             rs = declaracao3.getGeneratedKeys(); 
             livro.getIsbn().setId((rs.next())?rs.getInt(1):0); 
             
            // INSERIR LIVRO
            PreparedStatement declaracao4 = conexao.prepareStatement(
                    "INSERT INTO livro "
                    + "(codigo_barras, autor, titulo, ano, edicao, numero_paginas, sinopse, ativo, preco, id_editora,id_dimensao, id_isbn, id_grupolivro)"
                   + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            
            declaracao4.setString(1, livro.getCodigoBarras());
            declaracao4.setString(2, livro.getAutor());
            declaracao4.setString(3, livro.getTitulo());
            declaracao4.setString(4, livro.getAno());
            declaracao4.setString(5, livro.getEdicao());
            declaracao4.setString(6, livro.getNumeroPaginas());
            declaracao4.setString(7, livro.getSinopse());
            declaracao4.setBoolean(8, livro.getAtivo());
            declaracao4.setDouble(9, livro.getPreco());
            declaracao4.setInt(10, livro.getEditora().getId());
            declaracao4.setInt(11, livro.getDimensoes().getId());
            declaracao4.setInt(12, livro.getIsbn().getId());
            declaracao4.setInt(13, livro.getGrupoLivro().getId());
            declaracao4.execute();

            rs = declaracao4.getGeneratedKeys(); 
            livro.setId((rs.next())?rs.getInt(1):0);

                // INSERIR CATEGORIA N P N
            for(Categoria categoria: livro.getCategorias()){
                 PreparedStatement declaracao5 = conexao.prepareStatement(
                    "INSERT INTO livro_categoria "
                    + "(id_livro, id_categoria) VALUES (?,?)", Statement.RETURN_GENERATED_KEYS);
               declaracao5.setInt(1, livro.getId());
               declaracao5.setInt(2, categoria.getId());
                declaracao5.execute();
            }
          
        } catch (ClassNotFoundException erro) {
            erro.printStackTrace();     
            resultado.setStatus(false);
            resultado.setMensagem("Houve algum erro ao inserir o cliente");
        } catch (SQLException erro) {
            erro.printStackTrace();   
        }
        resultado.setMensagem("O Livro foi inserido com sucesso!");
        resultado.setStatus(true);
        resultado.setAcao("inserir");
        
        return resultado;
    
    }

    @Override
    public Resultado listar(EntidadeDominio entidade) {
        List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
        try {
            // Abre uma conexao com o banco.
            Connection conexao = BancoDadosOracle.getConexao();
            Livro livro = (Livro) entidade;
            if(livro.getAtivo()){
            PreparedStatement declaracao = conexao.prepareStatement("SELECT id, codigo_barras, autor, titulo, ano, edicao, numero_paginas,"
                    + " sinopse, ativo, preco, "
                    + " id_dimensao, id_editora, id_isbn, id_grupolivro "
                    + "FROM livro l WHERE l.ativo = 1");
            ResultSet rs =  declaracao.executeQuery();
            while(rs.next()) {
                Livro liv = new Livro();
                liv.setId(rs.getInt("id"));
                liv.setCodigoBarras(rs.getString("codigo_barras"));
                liv.setAutor(rs.getString("autor"));
                liv.setTitulo(rs.getString("titulo"));
                liv.setAno(rs.getString("ano"));
                liv.setEdicao(rs.getString("edicao"));
                liv.setNumeroPaginas(rs.getString("numero_paginas"));
                liv.setSinopse(rs.getString("sinopse"));
                liv.setPreco(rs.getDouble("preco"));
                
                
                System.out.println("FDP");
                
                
                liv.getDimensoes().setId(rs.getInt("id_dimensao"));
               
                liv.getEditora().setId(rs.getInt("id_editora"));
                
                liv.getIsbn().setCodBarras(rs.getString("codigo_barras"));
                liv.getIsbn().setCodBarras(rs.getString("id_isbm"));
                liv.getGrupoLivro().setId(rs.getInt("id_grupolivro"));                
                liv.setAtivo(true);   
                entidades.add(liv);
            }
            resultado.setStatus(true);
            resultado.setAcao("listarCliente");
           }
            else if(!livro.getAtivo()){
            PreparedStatement declaracao = conexao.prepareStatement("SELECT c.id,c.nome,c.sobrenome, c.data_nascimento, "
                    + "c.ranking, c.email, c.cpf, c.rg, c.sexo, c.tipo_usuario "
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
                cli.getPapel().setId(rs.getInt("tipo_usuario"));;
               
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
