/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.dominio.analise;

import ecommerce.dominio.EntidadeDominio;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

/**
 *
 * @author bocao
 */
public class AnaliseCategoriaMaisVendida extends EntidadeDominio {
    private Map<String, Integer> resultadoRomance;
    private Map<String, Integer> resultadoTerror;
    private Map<String, Integer> resultadoSuspense;
    private Map<String, Integer> resultadoAventura;
    private Map<String, Integer> resultadoComedia;
    private Map<String, Integer> resultadoFiccao;
    private Map<String, Integer> resultadoBiografia;
    private Map<String, Integer> resultadoDidatico;
    private Map<String, Integer> resultadoDrama;
    private Map<String, Integer> resultadoAcao;
    private Map<String, Integer> resultadoFaroeste;
    private Date dtInicio;
    private Date dtFim;
    private List<String> datasPedidos;

    public AnaliseCategoriaMaisVendida() {
        datasPedidos = new ArrayList<String>();
        resultadoRomance = new HashMap<String, Integer>();
        resultadoTerror = new HashMap<String, Integer>();
        resultadoSuspense = new HashMap<String, Integer>();
        resultadoAventura = new HashMap<String, Integer>();
        resultadoComedia = new HashMap<String, Integer>();
        resultadoFiccao =  new HashMap<String, Integer>();
        resultadoBiografia = new HashMap<String, Integer>();
        resultadoFaroeste = new HashMap<String, Integer>();
        resultadoAcao = new HashMap<String, Integer>();
        resultadoDrama = new HashMap<String, Integer>();
        resultadoDidatico = new HashMap<String, Integer>();
    }

    public Date getDtInicio() {
        return dtInicio;
    }

    public void setDtInicio(Date dtInicio) {
        this.dtInicio = dtInicio;
    }

    public Date getDtFim() {
        return dtFim;
    }

    public void setDtFim(Date dtFim) {
        this.dtFim = dtFim;
    }

    public Map<String, Integer> getResultadoRomance() {
        return resultadoRomance;
    }

    public void setResultadoRomance(Map<String, Integer> resultadoRomance) {
        this.resultadoRomance = resultadoRomance;
    }

    public Map<String, Integer> getResultadoTerror() {
        return resultadoTerror;
    }

    public void setResultadoTerror(Map<String, Integer> resultadoTerror) {
        this.resultadoTerror = resultadoTerror;
    }

    public Map<String, Integer> getResultadoSuspense() {
        return resultadoSuspense;
    }

    public void setResultadoSuspense(Map<String, Integer> resultadoSuspense) {
        this.resultadoSuspense = resultadoSuspense;
    }

    public Map<String, Integer> getResultadoAventura() {
        return resultadoAventura;
    }

    public void setResultadoAventura(Map<String, Integer> resultadoAventura) {
        this.resultadoAventura = resultadoAventura;
    }

    public Map<String, Integer> getResultadoComedia() {
        return resultadoComedia;
    }

    public void setResultadoComedia(Map<String, Integer> resultadoComedia) {
        this.resultadoComedia = resultadoComedia;
    }

    public Map<String, Integer> getResultadoFiccao() {
        return resultadoFiccao;
    }

    public void setResultadoFiccao(Map<String, Integer> resultadoFiccao) {
        this.resultadoFiccao = resultadoFiccao;
    }

    public Map<String, Integer> getResultadoBiografia() {
        return resultadoBiografia;
    }

    public void setResultadoBiografia(Map<String, Integer> resultadoBiografia) {
        this.resultadoBiografia = resultadoBiografia;
    }

    public List<String> getDatasPedidos() {
        return datasPedidos;
    }

    public void setDatasPedidos(List<String> datasPedidos) {
        this.datasPedidos = datasPedidos;
    }

    public Map<String, Integer> getResultadoDidatico() {
    return resultadoDidatico;
    }

    public void setResultadoDidatico(Map<String, Integer> resultadoDidatico) {
        this.resultadoDidatico = resultadoDidatico;
    }

    public Map<String, Integer> getResultadoDrama() {
        return resultadoDrama;
    }

    public void setResultadoDrama(Map<String, Integer> resultadoDrama) {
        this.resultadoDrama = resultadoDrama;
    }

    public Map<String, Integer> getResultadoAcao() {
        return resultadoAcao;
    }

    public void setResultadoAcao(Map<String, Integer> resultadoAcao) {
        this.resultadoAcao = resultadoAcao;
    }

    public Map<String, Integer> getResultadoFaroeste() {
        return resultadoFaroeste;
    }

    public void setResultadoFaroeste(Map<String, Integer> resultadoFaroeste) {
        this.resultadoFaroeste = resultadoFaroeste;
    }

    public Map<String, Integer> getMapaCategoria(String nomeCategoria) {

        if (nomeCategoria.equals("Ação"))
            return resultadoAcao;
        
        if (nomeCategoria.equals("Aventura"))
            return resultadoAventura;
        
        if (nomeCategoria.equals("Biografia"))
            return resultadoBiografia;

        if (nomeCategoria.equals("Comédia"))
            return resultadoComedia;

        if (nomeCategoria.equals("Didático"))
            return resultadoDidatico;
        
        if (nomeCategoria.equals("Drama"))
            return resultadoDrama;
        
        if (nomeCategoria.equals("Faroeste"))
            return resultadoFaroeste;

        if (nomeCategoria.equals("Ficção"))
           return resultadoFiccao;
        
        if (nomeCategoria.equals("Romance"))
            return resultadoRomance;
        
        if (nomeCategoria.equals("Suspense"))
            return resultadoSuspense;
        
        if (nomeCategoria.equals("Terror"))
            return resultadoTerror;
        
        return null;

    }


    public String getRowsGrafico() {
        StringBuilder sb = new StringBuilder();
        int contadorResultados = 1;
        Integer acao = 0, 
            aventura = 0,
            biografia = 0,
            comedia = 0,
            didatico = 0,
            drama = 0,
            faroeste = 0,
            ficcao = 0,
            romance = 0,
            suspense = 0, 
            terror =0;
        
        try{
            
            Map<String, String> quantLivrosVendCat = new HashMap<String, String>();
            Map<String, String> aux = new HashMap<String, String>();
            SortedMap reverso = new TreeMap();
            
            for(String dataPedido : getDatasPedidos()) {
                String dataPedidoFormat[] = dataPedido.split("-");
                aux.put(dataPedidoFormat[0], "");
            }
            
             
            for(String key : aux.keySet()){
                
            
                String qtde = null;
                
                for(String dataPedido : getDatasPedidos()){
                    String dataPedidoFormat[] = dataPedido.split("-");
                    String datas = dataPedidoFormat[0];
                    
                    if(key.equals(datas)){
                        acao += getRowCategoria("Ação" ,dataPedido);
                        aventura += getRowCategoria("Aventura" ,dataPedido);
                        biografia += getRowCategoria("Biografia" ,dataPedido);
                        comedia += getRowCategoria("Comédia" ,dataPedido);
                        didatico += getRowCategoria("Didático" ,dataPedido);
                        drama += getRowCategoria("Drama" ,dataPedido);
                        faroeste += getRowCategoria("Faroeste" ,dataPedido);
                        ficcao += getRowCategoria("Ficção" ,dataPedido);
                        romance += getRowCategoria("Romance" ,dataPedido);
                        suspense += getRowCategoria("Suspense" ,dataPedido);
                        terror += getRowCategoria("Terror" ,dataPedido);
                        qtde = + acao + ", " + aventura + ", " + biografia + ", " + comedia + ", " + didatico + ", "
                            + drama + ", " + faroeste + ", " + ficcao + ", " + romance + ", " + suspense + ", " + terror;
                    }
                }    
                quantLivrosVendCat.put(key, qtde);
                acao = aventura = biografia = comedia = didatico = drama = faroeste = ficcao = romance = suspense = terror =0;
//                quantLivrosVendCat
                
		 for (Iterator iter = quantLivrosVendCat.keySet().iterator(); iter.hasNext();) {
			 Object obj = iter.next();
		     reverso.put (obj, quantLivrosVendCat.get(obj));
		 }
            }
            for(Object key : reverso.keySet()){
                sb.append("['");
                sb.append(key).append("', ");
                sb.append(quantLivrosVendCat.get(key)).append("]");
                if(contadorResultados < quantLivrosVendCat.size()) {
                    sb.append(",");
                    contadorResultados++;
                }
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return sb.toString();
    }

    private Integer getRowCategoria(String nomeCategoria, String dataPedido) {
        Integer quantidade = getMapaCategoria(nomeCategoria).get(dataPedido);
        return quantidade == null ? 0 : quantidade;
    }
}