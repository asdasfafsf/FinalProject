package com.spring.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("userNo")
public class test {

		private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		/**
		 * Simply selects the home view to render by returning its name.
		 */

		
			
		
		
		@RequestMapping(value = "/gaga", method = RequestMethod.GET)
		public String gaga(Model model) {
			model.addAttribute("userNo", 1);
		


			return "main";
		}
		
		
		@RequestMapping(value = "/total", method = RequestMethod.GET)
		public String total() {
			

			return "html/gaga";
		}
		
		@RequestMapping(value = "/main", method = RequestMethod.GET)
		public String main() {
			
			return "main";
		}
		
		@RequestMapping(value = "/account_balance_inquiry", method = RequestMethod.GET)
		public String account() {
			

			return "html/confirmBalanceModal";
		}
		
		@RequestMapping(value = "/account_authorize", method = RequestMethod.GET)
		public String authorize() {
			

			return "html/registerAccountModal";
		}
		
		@RequestMapping(value = "/callback", method = RequestMethod.GET)
		public String gagam() {
			

			return "html/callback";
		}
		
		@RequestMapping(value = "/account_inquiry", method = RequestMethod.GET)
		public String accountInquiry() {
			

			return "html/accountInquiry";
		}
		
		@RequestMapping(value = "/withdrawal_transfer", method = RequestMethod.GET)
		public String withdrawalTransfer() {
			

			return "html/withdrawalTransfer";
		}
		
		@RequestMapping(value = "/deposit_transfer", method = RequestMethod.GET)
		public String depositTransfer() {
			

			return "html/depositTransfer";
		}
		
		@RequestMapping(value = "/transactional_information", method = RequestMethod.GET)
		public String transactionalInformation() {
			

			return "html/transactionalInformation";
		}
		
		@RequestMapping(value = "/account_close", method = RequestMethod.GET)
		public String accountClose() {
			

			return "html/accountClose";
		}
		
}


