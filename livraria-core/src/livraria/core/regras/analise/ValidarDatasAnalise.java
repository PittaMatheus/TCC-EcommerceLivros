/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.analise;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.analise.AnaliseCategoriaMaisVendida;
import java.util.Date;
import livraria.core.IStrategy;

/**
 *
 * @author bocao
 */
public class ValidarDatasAnalise implements IStrategy {

    @Override
    public String validar(EntidadeDominio entidade) {
        AnaliseCategoriaMaisVendida analise = (AnaliseCategoriaMaisVendida) entidade;
        String str= "";
        
        if(analise.getDtInicio() == null || analise.getDtFim() == null || 
            analise.getDtInicio().after(analise.getDtFim()) || analise.getDtInicio().after(new Date()))
            return "<li>Por favor, preencha as datas com valores válidos!</li>";

        return str;
    }

}