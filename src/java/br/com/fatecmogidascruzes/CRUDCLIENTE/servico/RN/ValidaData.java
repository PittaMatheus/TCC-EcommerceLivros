/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatecmogidascruzes.CRUDCLIENTE.servico.RN;

import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.Cliente;
import br.com.fatecmogidascruzes.CRUDCLIENTE.dominio.EntidadeDominio;
import br.com.fatecmogidascruzes.CRUDCLIENTE.servico.AbstractStrategy;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author matheus
 */
public class ValidaData extends AbstractStrategy{

    @Override
    public String validar(EntidadeDominio entidade) {
            String str = "";
        Cliente cliente = (Cliente) entidade;
        Date dataAtual = new Date(System.currentTimeMillis());
        Date dataLimite = new Date("01/01/2011");
        
        // Verifica se é posterior a data atual(modificar para verificar se o cliente tem no minimo 10 anos)
        if(cliente.getData_nascimento().after(dataAtual)){
            return str+="Data invalida";
        }else if(cliente.getData_nascimento().after(dataLimite)){
            return str+="Data invalida";
        }

           
        
        
        return str;
    }
    
}
