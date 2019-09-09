package livraria.core.util;

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
        //Trocar quando for usar
        //Matteus
        //return DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_livros","root","root");
        //Edner
        //return DriverManager.getConnection("jdbc:mysql://localhost:3306/Ecommerce","root","admin123");

            return DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce_livros","root","admin123");

    }

        public void devolverConexao(Connection conexao) throws SQLException {
        conexao.close();
    }
}