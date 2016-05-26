package com.financetracker;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

@Controller
public class TransactionController {

   @RequestMapping(value = "/transaction", method = RequestMethod.GET)
   public ModelAndView transaction() {
      return new ModelAndView("transaction", "command", new Transaction());
   }
   
   @RequestMapping(value = "/addTransaction", method = RequestMethod.POST)
   public String addTransaction(@ModelAttribute("WebsiteProject")Transaction transaction, 
   ModelMap model) {
	   ApplicationContext context = 
	             new ClassPathXmlApplicationContext("beans.xml");

	      TransactionJDBCTemplate transactionJDBCTemplate = 
	      (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	      
	      System.out.println("------Records Creation--------" );
	      transactionJDBCTemplate.create(transaction.getName(),transaction.getDescription(),transaction.getType(),transaction.getAmount(), transaction.getDate());
      model.addAttribute("name", transaction.getName());
      model.addAttribute("description", transaction.getDescription());
      model.addAttribute("amount", transaction.getAmount());
      model.addAttribute("type", transaction.getType());
      model.addAttribute("date", transaction.getDate());
      
      return "transactionResult";
   }
}