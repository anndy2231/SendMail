package egovframework.example.sample.sendmail;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class HomeController {
	
	
	@Resource(name = "sendMailService")
	private SendMailService sendMailService;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@RequestMapping(value = "/login.do")
	public String login(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, HttpServletRequest request, ModelMap model) throws Exception {
		return "/sendmail/login";
	}
	
	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, ModelMap model) throws Exception {
		return "/sendmail/main";
	}
	
	@RequestMapping(value = "/register.do")
	public String register(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, HttpServletRequest request, ModelMap model) throws Exception {
		return "/sendmail/register";
	}
	
	@RequestMapping(value = "/register_action.do", method = RequestMethod.POST)
	public String registerAction(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, HttpServletRequest request, ModelMap model) throws Exception {
//		request.getParameter("name");
//		request.getParameter("userId");
//		request.getParameter("password");
		sendMailService.insertUserInfo(sendMailVO);
		
		return "/sendmail/message";
	}
	
	
	@RequestMapping(value = "/write.do")
	public String write(HttpServletRequest request, ModelMap model) throws Exception {
		return "/sendmail/write";
	}
	
	@RequestMapping(value = "/write_action.do", method = RequestMethod.POST)
	public String writeAction(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, HttpServletRequest request, ModelMap model) throws Exception {
		
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		String receiver = request.getParameter("receiver");
		String sender = request.getParameter("sender");
		String password = request.getParameter("password");
		
		SendMail sm = new SendMail();
		sm.userMail = sender;
		sm.password = password;
		sm.receiver = receiver;
		sm.title = title;
		sm.contents = contents;
		sm.send();
		
		sendMailService.sendMail(sendMailVO);
		return "/sendmail/message";
	}
	

	@RequestMapping(value = "/message.do")
	public String message(ModelMap model) throws Exception {
		return "/sendmail/message";
	}
	

	@RequestMapping(value = "/sent.do")
	public String sent(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, ModelMap model) throws Exception {
		List<?> list = sendMailService.selectMailList(sendMailVO);
		model.addAttribute("resultList", list);
		return "/sendmail/sent";
	}
	
	@RequestMapping(value = "/received.do")
	public String received(ModelMap model) throws Exception {
		return "/sendmail/received";
	}
	
	@RequestMapping(value = "/trashCan.do")
	public String trashBean(ModelMap model) throws Exception {
		return "/sendmail/trashCan";
	}
	

}
