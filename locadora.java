import java.sql.*;


public class locadora {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        String url = "jdbc:mysql://localhost:3306/locadora";
        String user = "root";
        String password = "";
        
        Connection conn = (Connection) DriverManager.getConnection(url, user, password);
        Statement stm = conn.createStatement();
        ResultSet res = stm.executeQuery("select * from cliente");
        while(res.next()){
            System.out.println(res.getString("nome"));
        }
        stm.close();
        conn.close();

	}

}
