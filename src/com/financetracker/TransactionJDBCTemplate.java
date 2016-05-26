package com.financetracker;

import java.util.Date;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

public class TransactionJDBCTemplate implements TransactionDAO {
   private DataSource dataSource;
   private JdbcTemplate jdbcTemplateObject;
   
   public void setDataSource(DataSource dataSource) {
      this.dataSource = dataSource;
      this.jdbcTemplateObject = new JdbcTemplate(dataSource);
   }

   public void create(String name, String description, String type, Float amount, Date date) {
      String SQL = "insert into Transactions (name, description, type, amount, date) values (?, ?, ?, ?, ?)";
      
      jdbcTemplateObject.update( SQL, name, description, type, amount, date);
      System.out.println("Created Record Name = " + name + " Age = " + amount);
      return;
   }

   public Transaction getTransaction(Integer id) {
      String SQL = "select * from Transaction where id = ?";
      Transaction transaction = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, new TransactionMapper());
      return transaction;
   }

   public List<Transaction> listTransactions() {
      String SQL = "select * from transactions";
      List <Transaction> transactions = jdbcTemplateObject.query(SQL, new TransactionMapper());
      return transactions;
   }

   public void delete(Integer id){
      String SQL = "delete from transactions where id = ?";
      jdbcTemplateObject.update(SQL, id);
      System.out.println("Deleted Record with ID = " + id );
      return;
   }

   public void update(Integer id, Float amount){
      String SQL = "update transactions set amount =  where id = ?";
      jdbcTemplateObject.update(SQL, amount, id);
      System.out.println("Updated Record with ID = " + id );
      return;
   }

}