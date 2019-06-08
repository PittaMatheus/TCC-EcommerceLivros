/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.Cupom;
import ecommerce.dominio.pedido.Pedido;
import java.util.List;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.pedido.CupomDescontoDAO;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author matheus
 */
public class ValidaCupomDesconto extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
        String str = "";
        Pedido pedido = (Pedido) entidade;
        Cupom cupom = new Cupom();
        Resultado resultado = new Resultado();
        CupomDescontoDAO cupomDescDAO = new CupomDescontoDAO();
        String codigoCupom = pedido.getCupom().getCodigo();
        if(codigoCupom != null){
            cupom.setCodigo(codigoCupom);
            resultado = cupomDescDAO.consultar(cupom);
            List<Cupom> cupons = (List) resultado.getEntidades();
            if(cupons.isEmpty()){
                str = "<li>Cupom inválido</li>";
            }
        }
        
        return str;
    }
    
}
