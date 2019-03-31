package br.com.fatecmogidascruzes.CRUDCLIENTE.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BancoDadosOracle {
    
    public static Connection getConexao() throws ClassNotFoundException, SQLException {
        // Define um driver de conexao com o banco.
        // Class.forName("org.postgresql.Driver");
        Class.forName("com.mysql.jdbc.Driver"); 
        // Abre uma conexao com o banco.
        Connection conexao;
        // return DriverManager.getConnection("jdbc:postgresql://localhost:5432/contato", "postgres", "123Fatec");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_livros","root","root");
    }

        public void devolverConexao(Connection conexao) throws SQLException {
        conexao.close();
    }
}