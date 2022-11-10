import java.sql.*;
import java.util.Scanner;

public class Login {
    public static void main(String[] args) {
        Connection connection = null;
        //申明下文中的resultSet, statement
        Statement statement = null;
        ResultSet resultSet = null;

        Scanner input = new Scanner(System.in);

        System.out.print("请输入用户名：");
        String loginName = input.nextLine();
        System.out.print("请输入密码：");
        String loginPass = input.nextLine();

        try {
            Class.forName("org.postgresql.Driver");
            String userName = "gaussdb";
            String passWord = "Passwd123@123";
            String url = "jdbc:postgresql://localhost:5432/postgres";
           
            connection = DriverManager.getConnection(url, userName, passWord);
          
            //connection = DriverManager.getConnection(url, userName, passWord);
            // 补充实现代码:
            statement = connection.createStatement();
            String SQL = "select * from client where c_mail = '"+loginName+"' ;";
            resultSet = statement.executeQuery(SQL);
            if(resultSet.next()){
                if(resultSet.getString("c_password").trim().equals(loginPass))
                    System.out.println("登录成功。");
                else System.out.println("用户名或密码错误！");
            }
            else System.out.println("用户名或密码错误！");

         } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }

                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}

