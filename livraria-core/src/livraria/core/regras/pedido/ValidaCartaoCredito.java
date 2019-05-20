/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.PagamentoCartaoCredito;
import ecommerce.dominio.pedido.Pedido;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author matheus
 */
public class ValidaCartaoCredito extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
        Pedido pedido = (Pedido) entidade;
        PagamentoCartaoCredito pgCartao = new PagamentoCartaoCredito();
        List<PagamentoCartaoCredito> cartoesCompra = new ArrayList<>();
        String str ="";
        int aux = 0;
        String dataValidade;
        cartoesCompra = pedido.getPagamento().getPagamentosCartao();
         for(PagamentoCartaoCredito pgto: cartoesCompra) {
            pgCartao = cartoesCompra.get(aux);
                aux++;             
                dataValidade = pgCartao.getCartaoCredito().getDtVencimento();
        }
         
         
        return str;
    }
    
}
