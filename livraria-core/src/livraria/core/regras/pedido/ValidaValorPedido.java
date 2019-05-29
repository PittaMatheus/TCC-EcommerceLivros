/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.pedido;

import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.PagamentoCartaoCredito;
import ecommerce.dominio.pedido.Pedido;
import java.util.ArrayList;
import java.util.List;
import livraria.core.regras.AbstractStrategy;
import livraria.core.util.LivroUtils;
import livraria.core.util.PrecoUtils;

/**
 *
 * @author matheus
 */
public class ValidaValorPedido extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
        Pedido pedido = (Pedido) entidade;
        PagamentoCartaoCredito pgCartao = new PagamentoCartaoCredito();
        List<PagamentoCartaoCredito> valoresCartoes = new ArrayList<>();
        String str ="";
        double valorTotal = pedido.getPagamento().getValorTotal();
        valoresCartoes = pedido.getPagamento().getPagamentosCartao();
        int aux = 0;
        double somaValorCartao = 0;
        
        for(PagamentoCartaoCredito pgto: valoresCartoes) {
            pgCartao = valoresCartoes.get(aux);
                aux++;             
                somaValorCartao += pgCartao.getValor();
        }
        somaValorCartao = PrecoUtils.arredondarPreco(somaValorCartao);
        valorTotal = PrecoUtils.arredondarPreco(valorTotal);

        if(somaValorCartao != valorTotal){
            str="<li>O valor está incorreto</li>";
        }
        return str;
    }
    
}
