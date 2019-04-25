/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.livro;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.livro.Categoria;
import ecommerce.dominio.livro.GrupoLivro;
import java.util.ArrayList;
import java.util.List;
import livraria.core.aplicacao.Resultado;

/**
 *
 * @author bocao
 */
public class Teste {
    
    public static void main(String[] args) {
        
        CategoriaDAO catDao = new CategoriaDAO();
        Categoria cat = new Categoria();
        Categoria cat2 = new Categoria();
        Resultado resultado = new Resultado();
        GrupoLivroDAO grupDao = new GrupoLivroDAO();
        GrupoLivro grup = new GrupoLivro();
        GrupoLivro grup2 = new GrupoLivro();
        
//        cat.setId(9);
//        resultado = catDao.consultar(cat);
//        
//        for(EntidadeDominio ent2: resultado.getEntidades()){
//            cat2 = (Categoria) ent2;
//            System.out.println(cat2.toString());
//        }
                
        grup.setId(9);
        resultado = grupDao.consultar(grup);
        
        for(EntidadeDominio ent : resultado.getEntidades()){
            grup2 = (GrupoLivro) ent;
            System.out.println(grup2.getNome());
        }
    }
}
