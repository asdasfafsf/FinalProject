package com.spring.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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
		
		@RequestMapping("/loginasdsadsadsadsadsadsadsadsadadadadadsdsadsasadsasda/{userNo}")
		public String getSession(@PathVariable int userNo, Model model) {
			model.addAttribute("userNo", userNo);
			
			return "main";
		}

		
			
		
		
		
		
		
		@RequestMapping(value = "/main", method = RequestMethod.GET)
		public String main() {
			
			return "reward_list";
		}
		
		@RequestMapping(value = "/account_balance_inquiry", method = RequestMethod.GET)
		public String account() {
			

			return "html/confirmBalanceModal";
		}
		
		@RequestMapping(value = "/account_authorize", method = RequestMethod.GET)
		public String authorize() {
			

			return "registerAccountModal";
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
			

			return "withdrawalTransfer";
		}
		
		@RequestMapping(value = "/deposit_transfer", method = RequestMethod.GET)
		public String depositTransfer() {
			

			return "depositTransfer";
		}
		
		@RequestMapping(value = "/transactional_information", method = RequestMethod.GET)
		public String transactionalInformation() {
			

			return "html/transactionalInformation";
		}
		
		@RequestMapping(value = "/account_close", method = RequestMethod.GET)
		public String accountClose() {
			

			return "html/accountClose";
		}
		@RequestMapping(value = "/admin", method = RequestMethod.GET)
		public String admin() {
			

			return "admin/admin_main";
		}
		@RequestMapping(value = "/admin_notice", method = RequestMethod.GET)
		public String admin_notice() {
			

			return "admin/admin_notice";
		}
		@RequestMapping(value = "/admin_event", method = RequestMethod.GET)
		public String admin_event() {
			

			return "admin/admin_event";
		}
		@RequestMapping(value = "/admin_member", method = RequestMethod.GET)
		public String admin_member() {
			

			return "admin/admin_member";
		}
		@RequestMapping(value = "/admin_report", method = RequestMethod.GET)
		public String admin_report() {
			

			return "admin/admin_report";
		}
		@RequestMapping(value = "/admin_admin", method = RequestMethod.GET)
		public String admin_admin() {
			

			return "admin/admin_admin";
		}
		@RequestMapping(value = "/admin_reward_index", method = RequestMethod.GET)
		public String admin_reward_index() {
			

			return "admin/admin_reward_index";
		}
		@RequestMapping(value = "/admin_reward_application", method = RequestMethod.GET)
		public String admin_reward_application() {
			

			return "admin/admin_reward_application";
		}
		@RequestMapping(value = "/admin_reward_advertisement", method = RequestMethod.GET)
		public String admin_reward_advertisement() {
			

			return "admin/admin_reward_advertisement";
		}
		
}


