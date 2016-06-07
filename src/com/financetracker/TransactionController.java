package com.financetracker;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

@Controller
public class TransactionController {

   @RequestMapping(value = "/transaction", method = RequestMethod.GET)
   public ModelAndView transaction() {
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
	  TransactionJDBCTemplate transactionJDBCTemplate = (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	  List<Transaction> list = transactionJDBCTemplate.listTransactions(getPrincipal());
	  ModelAndView model = new ModelAndView("transaction");
	  model.addObject("lists",list);
	  model.addObject("command", new Transaction());
	  return model;
   }
	
   @RequestMapping(value = "/transactions", method = RequestMethod.GET)
   public @ResponseBody List<Transaction> transactionJSON() {
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");
	  TransactionJDBCTemplate transactionJDBCTemplate = (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	  List<Transaction> list = transactionJDBCTemplate.listTransactions(getPrincipal());
	  return list;
   }
   
   @RequestMapping(value = "/addTransaction", method = RequestMethod.POST)
   public String addTransaction(@ModelAttribute("WebsiteProject")Transaction transaction, 
   ModelMap model) {
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

	  TransactionJDBCTemplate transactionJDBCTemplate = (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	      
	  transactionJDBCTemplate.create(transaction.getName(),transaction.getDescription(),transaction.getType(),transaction.getAmount(), transaction.getDate(), transaction.getStatus(), getPrincipal());
      
      return "redirect:/transaction";
   }
   
   @RequestMapping(value = "/updateTransaction", method = RequestMethod.POST)
   public String updateTransaction(@ModelAttribute("WebsiteProject")Transaction transaction, 
   ModelMap model) {
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

	  TransactionJDBCTemplate transactionJDBCTemplate = (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	      
	  transactionJDBCTemplate.update(transaction.getId(),transaction.getRepaid());
      
      return "redirect:/transaction";
   }
   
   @RequestMapping(value = "/deleteTransaction", method = RequestMethod.POST)
   public String deleteTransaction(HttpServletRequest request) {
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

	  TransactionJDBCTemplate transactionJDBCTemplate = (TransactionJDBCTemplate)context.getBean("transactionJDBCTemplate");
	      
	  transactionJDBCTemplate.delete(Integer.parseInt(request.getParameter("id")));
      
      return "redirect:/transaction";
   }
   
   @RequestMapping(value = "/register", method = RequestMethod.POST)
   public String register(HttpServletRequest request, Model model) {
	  System.out.println("hello");
	  ApplicationContext context = new ClassPathXmlApplicationContext("beans.xml");

	  UserJDBCTemplate userJDBCTemplate = (UserJDBCTemplate)context.getBean("userJDBCTemplate");
	      
	  try{
		  userJDBCTemplate.create(request.getParameter("username"), request.getParameter("password"));
		  Authentication auth = new UsernamePasswordAuthenticationToken( request.getParameter("username"), request.getParameter("password") );
		  SecurityContextHolder.getContext().setAuthentication( auth );
		  return "redirect:/transaction";
	  }
	  
	  catch(DuplicateKeyException e){
		  model.addAttribute("error", "Username already exists");
		  return "register";
	  }      
   }
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public String loginPage() {
       return "login";
   }
   
   
   
   @RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
   public String homePage(ModelMap model) {
       model.addAttribute("greeting", "Hi, Welcome to mysite. ");
       return "welcome";
   }

   @RequestMapping(value = "/admin", method = RequestMethod.GET)
   public String adminPage(ModelMap model) {
       model.addAttribute("user", getPrincipal());
       return "admin";
   }

   @RequestMapping(value = "/db", method = RequestMethod.GET)
   public String dbaPage(ModelMap model) {
       model.addAttribute("user", getPrincipal());
       return "dba";
   }

   @RequestMapping(value="/logout", method = RequestMethod.GET)
      public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
         Authentication auth = SecurityContextHolder.getContext().getAuthentication();
         if (auth != null){    
            new SecurityContextLogoutHandler().logout(request, response, auth);
         }
         return "welcome";
      }

   @RequestMapping(value = "/Access_Denied", method = RequestMethod.GET)
   public String accessDeniedPage(ModelMap model) {
       model.addAttribute("user", getPrincipal());
       return "accessDenied";
   }
    
   private String getPrincipal(){
       String userName = null;
       Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

       if (principal instanceof UserDetails) {
           userName = ((UserDetails)principal).getUsername();
       } else {
           userName = principal.toString();
       }
       return userName;
   }
}