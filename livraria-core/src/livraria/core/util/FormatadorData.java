/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.util;

import java.util.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/**
 *
 * @author bocao
 */
public class FormatadorData {
    private static SimpleDateFormat sdf;

    public static String formatarData(Date data) {
        return formatarData(data, "dd/MM/yyyy");

    }
    
    public static String formatarData(Date data, String padrao) {
        
        if(data == null)
            return "";
        
        sdf = new SimpleDateFormat(padrao);
        return sdf.format(data);

    }
    
    public static String formatarDataTimeSt(Timestamp tsData) {
        return formatarDataTimeSt(tsData, "dd/MM/yyyy-HH:mm:ss");

    }

    public static String formatarDataTimeSt(Timestamp tsData, String padrao) {
        
        if(tsData == null)
            return "";
        
        sdf = new SimpleDateFormat(padrao);
        return sdf.format(tsData);

    }
}