package com.financetracker;

import java.util.Date;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class UserJDBCTemplate implements UserDAO {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	   
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	
	public void create(String username, String password) {
		String SQL = "insert into users (username, password, enabled) values (?, ?, ?)";
		jdbcTemplateObject.update( SQL, username, password, true);
		
		SQL = "insert into userRoles(username, role) values (?, ?)";
		jdbcTemplateObject.update( SQL, username, "ROLE_USER");
        return;
   }

   public User getUser(Integer id) {
      String SQL = "select * from Users where id = ?";
      User user = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new UserMapper());
      return user;
   }

   public List<User> listUsers(String username) {
      String SQL = "select * from transactions where username=? and amount-repaid>0 order by date, name";
      List <User> users = jdbcTemplateObject.query(SQL, new String[]{username},  new UserMapper());
      return users;
   }

   public void delete(Integer id){
      String SQL = "delete from transactions where id = ?";
      jdbcTemplateObject.update(SQL, id);
      System.out.println("Deleted Record with ID = " + id );
      return;
   }

   public void update(Integer id, Float repaid){
      String SQL = "update transactions set status = (case when amount = repaid + ? then 'Closed' else 'Open' end), repaid = repaid + ? where id = ?";
      jdbcTemplateObject.update(SQL, repaid, repaid, id);
      return;
   }
}
