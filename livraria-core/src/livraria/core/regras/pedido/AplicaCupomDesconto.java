/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.regras.pedido;

import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import ecommerce.dominio.EntidadeDominio;
import ecommerce.dominio.pedido.Cupom;
import ecommerce.dominio.pedido.Pedido;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import livraria.core.aplicacao.Resultado;
import livraria.core.dao.pedido.CupomDescontoDAO;
import livraria.core.regras.AbstractStrategy;

/**
 *
 * @author matheus
 */
public class AplicaCupomDesconto extends AbstractStrategy {

    @Override
    public String validar(EntidadeDominio entidade) {
        String str="";
        Pedido pedido = (Pedido) entidade;
        ValidaCupomDesconto validaCupom = new ValidaCupomDesconto();
        CupomDescontoDAO cupomDescDAO = new CupomDescontoDAO();
        Cupom cupom = new Cupom();
        Resultado resultado = new Resultado();
        
        double valorTotal = pedido.getPagamento().getValorTotal();
        double desconto = 0;
        cupom.setCodigo(pedido.getCupom().getCodigo());
        str = validaCupom.validar(pedido);
        if(str.equals("")){
            resultado = cupomDescDAO.consultar(cupom);
             List<Cupom> cupons = (List) resultado.getEntidades();
             for (Cupom cup : cupons) {
                 desconto = cup.getValorDesconto();
             }
             valorTotal = valorTotal - (valorTotal * desconto / 100);
             //pedido.getPagamento().setValorTotal(valorTotal);
        }
        str = String.valueOf(valorTotal);
        
        return str;
    }
    
}
