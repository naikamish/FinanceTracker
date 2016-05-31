package com.financetracker;

import java.util.Date;
import java.util.List;
import javax.sql.DataSource;

public interface TransactionDAO {
   /** 
    * This is the method to be used to initialize
    * database resources ie. connection.
    */
   public void setDataSource(DataSource ds);
   /** 
    * This is the method to be used to create
    * a record in the Student table.
    */
   public void create(String name, String description, String type, Float amount, Date date, String status, String username);
   /** 
    * This is the method to be used to list down
    * a record from the Student table corresponding
    * to a passed student id.
    */
   public Transaction getTransaction(Integer id);
   /** 
    * This is the method to be used to list down
    * all the records from the Student table.
    */
   public List<Transaction> listTransactions(String username);
   /** 
    * This is the method to be used to delete
    * a record from the Student table corresponding
    * to a passed student id.
    */
   public void delete(Integer id);
   /** 
    * This is the method to be used to update
    * a record into the Student table.
    */
   public void update(Integer id, Float amount);
}