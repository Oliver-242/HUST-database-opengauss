import java.sql.*;
import java.util.Scanner;

public class Transfer {
    static final String JDBC_DRIVER = "org.postgresql.Driver";
    static final String DB_URL = "jdbc:postgresql://127.0.0.1:5432/postgres?";
    static final String USER = "gaussdb";
    static final String PASS = "Passwd123@123";
    /**
     * 转账操作
     *
     * @param connection 数据库连接对象
     * @param sourceCard 转出账号
     * @param destCard 转入账号
     * @param amount  转账金额
     * @return boolean
     *   true  - 转账成功
     *   false - 转账失败
     */
    public static boolean transferBalance(Connection connection,
                             String sourceCard,
                             String destCard, 
                             double amount){
        PreparedStatement pstmt = null;
        ResultSet resultSet = null;
        boolean n = true;
        try {
        connection.setAutoCommit(false);
        String sql = null;
        sql = "update bank_card set b_balance = b_balance - ? where b_number = ?;";
        pstmt = connection.prepareStatement(sql);
        pstmt.setDouble(1,amount);
		pstmt.setString(2,sourceCard);
        pstmt.executeUpdate();

	    sql = "update bank_card set b_balance = b_balance + ? where b_number = ? and b_type = '储蓄卡';";
		pstmt = connection.prepareStatement(sql);
        pstmt.setDouble(1,amount);
		pstmt.setString(2,destCard);
        pstmt.executeUpdate();

		sql = "update bank_card set b_balance = b_balance - ? where b_number = ? and b_type = '信用卡';";
		pstmt = connection.prepareStatement(sql);
        pstmt.setDouble(1,amount);
		pstmt.setString(2,destCard);
        pstmt.executeUpdate();

	    sql = "select * from bank_card where b_number = ? and b_type = '储蓄卡';";
		pstmt = connection.prepareStatement(sql);
		pstmt.setString(1,sourceCard);
        resultSet = pstmt.executeQuery();
        if(resultSet.next()==false) {
			n = false;
			connection.rollback();
		}
		else {
			if(resultSet.getDouble("b_balance") < 0){
				n = false;
				connection.rollback();
			}
			else{
				sql = "select * from bank_card where b_number = ?;";
				pstmt = connection.prepareStatement(sql);
				pstmt.setString(1,destCard);
				resultSet = pstmt.executeQuery();
				if(resultSet.next()==false) {
					n = false;
					connection.rollback();
				}
				else connection.commit();
			}
		}
 
        }catch (SQLException throwables) {
        throwables.printStackTrace();
        n = false;
    } finally {
        try {
            if (pstmt != null) {
                pstmt.close();
            }
            if (resultSet != null) {
                resultSet.close();
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            n = false;
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
            String payerCard = commands[0];
            String  payeeCard = commands[1];
            double  amount = Double.parseDouble(commands[2]);
            if (transferBalance(connection, payerCard, payeeCard, amount)) {
              System.out.println("转账成功。" );
            } else {
              System.out.println("转账失败,请核对卡号，卡类型及卡余额!");
            }
        }
    }

}

