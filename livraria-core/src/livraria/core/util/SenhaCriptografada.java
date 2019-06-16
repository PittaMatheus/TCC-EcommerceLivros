    /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package livraria.core.util;

import java.security.MessageDigest;

/**
 *
 * @author bocao
 */
public class SenhaCriptografada{
    
    public static String CriptografaSenha(String senha){
        String senhaCripto = "";
        try{
            MessageDigest algorithm = MessageDigest.getInstance("SHA-256");
            byte messageDigest[] = algorithm.digest(senha.getBytes("UTF-8"));
            
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
              hexString.append(String.format("%02X", 0xFF & b));
            }
            senhaCripto = hexString.toString();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return senhaCripto;
    }
    
}