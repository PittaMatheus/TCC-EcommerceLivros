/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.dao.livro;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.analise.AnaliseCategoriaMaisVendida;
import ecommerce.dominio.analise.AnaliseCustoReceitaLucroMes;
import ecommerce.dominio.cliente.Bandeira;
import ecommerce.dominio.livro.Categoria;
import ecommerce.dominio.livro.GrupoLivro;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.analise.AnaliseCategoriaMaisVendidaDAO;
import livraria.core.dao.analise.AnaliseCustoReceitaLucroMesDAO;
import livraria.core.dao.cliente.BandeiraDAO;

/**
 *
 * @author bocao
 */
public class Teste {
    public enum Mes {
        janeiro("JAN"), 
    fevereiro("FEV"), 
    marco("MAR");  
//        ABR, MAI, JUN, JUL, AGO, SET, OUT, NOV, DEZ;
    private final String value;

    private Mes(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
    }
    public static void main(String[] args) {
        
//        CategoriaDAO catDao = new CategoriaDAO();
//        Categoria cat = new Categoria();
//        Categoria cat2 = new Categoria();
//        Resultado resultado = new Resultado();
//        GrupoLivroDAO grupDao = new GrupoLivroDAO();
//        GrupoLivro grup = new GrupoLivro();
//        GrupoLivro grup2 = new GrupoLivro();
//        
////        cat.setId(9);
////        resultado = catDao.consultar(cat);
////        
////        for(EntidadeDominio ent2: resultado.getEntidades()){
////            cat2 = (Categoria) ent2;
////            System.out.println(cat2.toString());
////        }
//                
//        grup.setId(9);
//        resultado = grupDao.consultar(grup);
//        
//        for(EntidadeDominio ent : resultado.getEntidades()){
//            grup2 = (GrupoLivro) ent;
//            System.out.println(grup2.getNome());
//        }
//          Bandeira ba = new Bandeira();
//          Resultado band = new Resultado();
//          BandeiraDAO b = new BandeiraDAO();
//          band = b.listar(ba);
//          for(EntidadeDominio bd : band.getEntidades()){
//              Bandeira ba2 = (Bandeira) bd;
//              System.out.println(ba2.getNome());
//          }
//          AnaliseCustoReceitaLucroMes ana = new AnaliseCustoReceitaLucroMes();
//          Resultado resul = new Resultado();
//          AnaliseCustoReceitaLucroMesDAO a = new AnaliseCustoReceitaLucroMesDAO();
//          resul = a.listar(ana);
//          AnaliseCustoReceitaLucroMes an2 = new AnaliseCustoReceitaLucroMes();
//          for(EntidadeDominio ent: resul.getEntidades() ){
//              an2 = (AnaliseCustoReceitaLucroMes) ent;
//          }
//          System.out.println(ana.getDatasPedido());
          
          AnaliseCategoriaMaisVendida ana2 = new AnaliseCategoriaMaisVendida();
          Resultado resul2 = new Resultado();
          AnaliseCategoriaMaisVendidaDAO a2 = new AnaliseCategoriaMaisVendidaDAO();
          String dtInicio = "2019/05/01";
          String dtFim = "2019/06/17";
          ana2.setDtInicio(new Date(dtInicio));
          ana2.setDtFim(new Date(dtFim));
          resul2 = a2.listar(ana2);
          AnaliseCategoriaMaisVendida an3 = new AnaliseCategoriaMaisVendida();
          for(EntidadeDominio ent: resul2.getEntidades() ){
              an3 = (AnaliseCategoriaMaisVendida) ent;
          }
          System.out.println(an3.getRowsGrafico());
          
//          System.out.println(an2.getResultadoCusto());
//          System.out.println(an2.getResultadoReceita());
//            String aux = "01";
//            int i;
//            i = Integer.valueOf(aux);
//            for(Enum e : Mes.values()){
//                if(e.ordinal() == i)
//                    System.out.println(e.ordinal());
//            }
                
    }
}