package com.financetracker;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Controller
public class TransactionController {

   @RequestMapping(value = "/transaction", method = RequestMethod.GET)
   public ModelAndView transaction() {
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
	  TransactionJDBCTemplate transactionJDBCTemplate = (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	  List<Transaction> list = transactionJDBCTemplate.listTransactions();
	  ModelAndView model = new ModelAndView("transaction");
	  model.addObject("lists",list);
	  model.addObject("command", new Transaction());
	  return model;
   }
   
   @RequestMapping(value = "/addTransaction", method = RequestMethod.POST)
   public String addTransaction(@ModelAttribute("WebsiteProject")Transaction transaction, 
   ModelMap model) {
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

	  TransactionJDBCTemplate transactionJDBCTemplate = (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	      
	  transactionJDBCTemplate.create(transaction.getName(),transaction.getDescription(),transaction.getType(),transaction.getAmount(), transaction.getDate(), transaction.getStatus());
      
      return "transactionResult";
   }
   
   @RequestMapping(value = "/updateTransaction", method = RequestMethod.POST)
   public String updateTransaction(@ModelAttribute("WebsiteProject")Transaction transaction, 
   ModelMap model) {
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

	  TransactionJDBCTemplate transactionJDBCTemplate = (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	      
	  transactionJDBCTemplate.update(transaction.getId(),transaction.getRepaid());
      
      return "transactionResult";
   }
}