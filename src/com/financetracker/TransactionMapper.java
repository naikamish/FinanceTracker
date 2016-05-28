package com.financetracker;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class TransactionMapper implements RowMapper<Transaction> {
   public Transaction mapRow(ResultSet rs, int rowNum) throws SQLException {
      Transaction transaction = new Transaction();
      transaction.setAmount(rs.getFloat("amount"));
      transaction.setName(rs.getString("name"));
      transaction.setDescription(rs.getString("description"));
      transaction.setType(rs.getString("type"));
      transaction.setDate(rs.getDate("date"));
      transaction.setId(rs.getInt("id"));
      return transaction;
   }
}