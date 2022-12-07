import java.sql.*;
import java.util.Scanner;

public class RemoveCard {
    static final String JDBC_DRIVER = "org.postgresql.Driver";
    static final String DB_URL = "jdbc:postgresql://127.0.0.1:5432/postgres?";
    static final String USER = "gaussdb";
    static final String PASS = "Passwd123@123";
    
     /**
     * 删除bank_card表中数据
     *
     * @param connection 数据库连接对象
     * @param b_c_id 客户编号
     * @param c_number 银行卡号
     */
    public static int removeBankCard(Connection connection,
                                   int b_c_id, String b_number){
        PreparedStatement pstmt = null;
        int n = 0;
        try {
            String sql = "delete from bank_card where b_c_id = ? and b_number = ?;";
            pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1,b_c_id);
            pstmt.setString(2,b_number);
            n = pstmt.executeUpdate();
 
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return n;
    }

    // 不要修改main() 
    public static void main(String[] args) throws Exception {

        Scanner sc = new Scanner(System.in);
        Class.forName(JDBC_DRIVER);

        Connection connection = DriverManager.getConnection(DB_URL, USER, PASS);

        while(sc.hasNext())
        {
            String input = sc.nextLine();
            if(input.equals(""))
                break;

            String[]commands = input.split(" ");
            if(commands.length ==0)
                break;
            int id = Integer.parseInt(commands[0]);
            String carNumber = commands[1];
            
            int n = removeBankCard(connection, id, carNumber);
            if (n > 0) {
               System.out.println("已销卡数：" + n);
            } else {
               System.out.println("销户失败，请检查客户编号或银行卡号！" );
            }
        }
    }

}

