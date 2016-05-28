package com.financetracker;

import java.util.Date;

public class Transaction {
   private Float amount;
   private String name;
   private String description;
   private String type;
   private Date date;
   private String status;
   private Integer id;
   private Float repaid;

   public void setAmount(Float amount) {
      this.amount = amount;
   }
   public Float getAmount() {
      return amount;
   }
   
   public void setName(String name) {
      this.name = name;
   }
   public String getName() {
      return name;
   }
   
   public void setDescription(String description) {
	   	this.description = description;
   }
   public String getDescription() {
	   	return description;
   }

   public void setType(String type) {
      this.type = type;
   }
   public String getType() {
      return type;
   }
   
   public void setDate(Date date) {
      this.date = date;
   }
   public Date getDate() {
	  return date;
   }
   
   public void setStatus(String status) {
      this.status = status;
   }
   public String getStatus() {
	  return status;
   }
   
   public void setId(Integer id) {
      this.id = id;
   }
   public Integer getId() {
	  return id;
   }
   
   public void setRepaid(Float repaid) {
      this.repaid = repaid;
   }
   public Float getRepaid() {
	  return repaid;
   }
}