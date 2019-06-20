/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.analise;

import ecommerce.dominio.EntidadeDominio;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author bocao
 */

public class AnaliseCustoReceitaLucroMes extends EntidadeDominio{
    
    private Map<String, Double> resultadoCusto;
    private Map<String, Double> resultadoReceita;
    private Map<String, Double> resultadoLucro;
    private List<String> datasCusto;
    private List<String> datasPedido;
    
    public enum Mes {
        JANEIRO("JAN"), 
        FEVEREIRO("FEV"), 
        MARCO("MAR"), 
        ABRIL("ABR"), 
        MAIO("MAI"), 
        JUNHO("JUN"), 
        JULHO("JUL"), 
        AGOSTO("AGO"), 
        SETEMBRO("SET"), 
        OUTUBRO("OUT"), 
        NOVEMBRO("NOV"), 
        DEZEMBRO("DEZ");
        
        private final String value;

        private Mes(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }
    }
    
    public AnaliseCustoReceitaLucroMes() {
        resultadoCusto = new HashMap<String, Double>();
        resultadoReceita = new HashMap<String, Double>();
        resultadoLucro = new HashMap<String, Double>();
        datasCusto = new ArrayList<String>();
        datasPedido = new ArrayList<String>();
    }

    public Map<String, Double> getResultadoCusto() {
        return resultadoCusto;
    }

    public void setResultadoCusto(Map<String, Double> resultadoCusto) {
        this.resultadoCusto = resultadoCusto;
    }

    public Map<String, Double> getResultadoReceita() {
        return resultadoReceita;
    }

    public void setResultadoReceita(Map<String, Double> resultadoReceita) {
        this.resultadoReceita = resultadoReceita;
    }

    public Map<String, Double> getResultadoLucro() {
        return resultadoLucro;
    }

    public void setResultadoLucro(Map<String, Double> resultadoLucro) {
        this.resultadoLucro = resultadoLucro;
    }

    public List<String> getDatasCusto() {
        return datasCusto;
    }

    public void setDatasCusto(List<String> datasCusto) {
        this.datasCusto = datasCusto;
    }

    public List<String> getDatasPedido() {
        return datasPedido;
    }

    public void setDatasPedido(List<String> datasPedido) {
        this.datasPedido = datasPedido;
    }
    
    
    public Map<String, Double> getMapa(String nomeOperacao){
        
        if(nomeOperacao.equals("Custo"))
            return resultadoCusto;
        
        if(nomeOperacao.equals("Receita"))
            return resultadoReceita;
        
        if(nomeOperacao.equals("Lucro"))
            return resultadoLucro;
        
        return null;
    }
    
    public String getRowsGrafico() {
        StringBuilder sb = new StringBuilder();
        int contadorResultados = 1;
        BigDecimal bd;
        
        try{
            double contValorCusto = 0;
            double contValorReceita = 0;
            double contValorLucro = 0;
            
            for(Enum m : Mes.values()){
                Mes ms = (Mes) m; 
                int i = 0;
                i = ms.ordinal() + 1;
                
                for(String entDomCusto: getDatasCusto()){
                    String mes[] = entDomCusto.split("/");
                    int aux;
                    aux = Integer.valueOf(mes[1]);
                    
                    if(i == aux){
                        contValorCusto+= getRow("Custo", entDomCusto);
                    }
                }
                
                for(String entDomPedido: getDatasPedido()){
                    String mes[] = entDomPedido.split("/");
                    int aux;
                    aux = Integer.valueOf(mes[1]);
                    
                    if(i == aux){
                        contValorReceita+= getRow("Receita", entDomPedido);
                    }
                }
                bd = new BigDecimal((contValorReceita - contValorCusto));
                
                
                getMapa("Lucro").put(ms.getValue(), bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue());
                contValorCusto = 0;
                contValorReceita = 0;
            }

            sb.append("[['MÊS', 'CUSTO', 'VENDA', 'LUCRO'],");
            for(Enum m : Mes.values()){
                Mes ms = (Mes) m; 
                int i = 0;
                i = ms.ordinal() + 1;
                sb.append("['").append(ms.getValue()).append("',");
                
                for(String entDomCusto: getDatasCusto()){
                    String mes[] = entDomCusto.split("/");
                    int aux;
                    aux = Integer.valueOf(mes[1]);
                    
                    if(i == aux){
                        contValorCusto+= getRow("Custo", entDomCusto);
                    }
                }
                sb.append(contValorCusto).append(",");
                for(String entDomPedido: getDatasPedido()){
                    String mes[] = entDomPedido.split("/");
                    int aux;
                    aux = Integer.valueOf(mes[1]);
                    
                    if(i == aux){
                        contValorReceita+= getRow("Receita", entDomPedido);
                    }
                }
                sb.append(contValorReceita).append(",");
                
                for(String entDomLucro : getResultadoLucro().keySet()){
                    if(ms.getValue().equals(entDomLucro)){
                        contValorLucro = getRow("Lucro", entDomLucro);
                    }
                }
                
                sb.append(contValorLucro).append("]");
                if(contadorResultados < Mes.values().length) {
                    sb.append(",");
                    contadorResultados++;
                }
                contValorCusto = contValorLucro = contValorReceita = 0;
            }
            sb.append("]");

        }catch(Exception e){
            e.printStackTrace();
        }
        return sb.toString();
    }
    
    private Double getRow(String nomeCategoria, String dataPedido) {
        Double valor = getMapa(nomeCategoria).get(dataPedido);
        return valor == null ? 0 : valor;
    }
    
}