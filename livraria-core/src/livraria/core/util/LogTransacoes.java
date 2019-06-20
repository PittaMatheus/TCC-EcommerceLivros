/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.util;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.core.LoggerContext;


public class LogTransacoes {
   private static final Logger log = LogManager.getLogger(LogTransacoes.class);
            
	
    public static void executaLog(String texto) {
        try{
            LoggerContext context = (org.apache.logging.log4j.core.LoggerContext) LogManager.getContext(false);
            // Quando for rodar o log, mudar o path de localização do arq ../log4j2.properties
            //Edner
            //File file = new File("/home/bocao/Documentos/6_sem/Lab Rodrigo/TrabRodrigo/Ecommerce_livro/Livraria/livraria-core/log4j2.properties");
            //Matteus
            //
            
            File file = new File("/home/bocao/Documentos/6_sem/Lab Rodrigo/TrabalhoRodrigo4/livros/livraria-core/log4j2.properties");
            
            // this will force a reconfiguration
            context.setConfigLocation(file.toURI());
            log.info(texto);
        }catch(Exception e){
            e.printStackTrace();
        }
		
    } 
}
