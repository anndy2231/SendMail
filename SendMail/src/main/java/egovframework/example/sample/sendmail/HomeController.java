package egovframework.example.sample.sendmail;

import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class HomeController {

	@Resource(name = "sendMailService")
	private SendMailService sendMailService;

	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	@RequestMapping(value = "/login.do")
	public String login(HttpServletRequest request, ModelMap model) throws Exception {
		return "sendmail/login";
	}

	@RequestMapping(value = "/loginAction.do")
	public String loginAction(@RequestParam("user_id") String user_id, @RequestParam("password") String password,
			HttpServletRequest request, ModelMap model, HttpServletResponse response) throws Exception {

		SendMailVO sendMailVO = new SendMailVO();
		sendMailVO.setUserId(user_id);
		sendMailVO.setPassword(password);
		String user_name = sendMailService.selectLoginCheck(sendMailVO);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		if (user_name != null && !"".equals(user_name)) {
			request.getSession().setAttribute("userId", user_id);
			request.getSession().setAttribute("userName", user_name);
			request.getSession().setAttribute("userPassword", password);
			request.getSession().setAttribute("isLogin", "success");
			out.println("<script>alert('로그인 성공'); </script>");
			out.flush();
		} else {
			request.getSession().setAttribute("userId", "");
			request.getSession().setAttribute("userName", "");
			out.println("<script>alert('로그인 실패'); </script>");
			out.flush();
			return "/sendmail/login";
		}
		return "/sendmail/main";
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpServletRequest request, ModelMap model, HttpServletResponse response) throws Exception {
		request.getSession().invalidate();
		return "/sendmail/success";
	}

	@RequestMapping(value = "/main.do")
	public String main(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, ModelMap model) throws Exception {
		return "/sendmail/main";
	}

	@RequestMapping(value = "/register.do")
	public String register(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, HttpServletRequest request,
			ModelMap model) throws Exception {
		return "/sendmail/register";
	}
	
	@RequestMapping(value = "/update.do")
	public String update(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
	
		String login = (String) request.getSession().getAttribute("isLogin");
		if (login != null && login.equals("success")) {
			return "/sendmail/update";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 필수'); </script>");
			out.flush();
			return "/sendmail/main";
		}
	}

	@RequestMapping(value = "/register_action.do", method = RequestMethod.POST)
	public String registerAction(@RequestParam("name") String name, @RequestParam("userId") String userId,
			@RequestParam("password") String password, HttpServletRequest request, ModelMap model) throws Exception {
		SendMailVO sendMailVO = new SendMailVO();
		sendMailVO.setName(name);
		sendMailVO.setUserId(userId);
		sendMailVO.setPassword(password);
		sendMailService.insertUserInfo(sendMailVO);
		return "/sendmail/success";
	}
	
	@RequestMapping(value = "/update_action.do", method = RequestMethod.POST)
	public String updateAction(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, HttpServletRequest request, ModelMap model) throws Exception {
		sendMailService.updateUser(sendMailVO);
		request.getSession().invalidate();
		return "/sendmail/message";
	}

	@RequestMapping(value = "/write.do")
	public String write(HttpServletRequest request, ModelMap model, HttpServletResponse response) throws Exception {
		String login = (String) request.getSession().getAttribute("isLogin");
		if (login != null && login.equals("success")) {
			return "/sendmail/write";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 필수'); </script>");
			out.flush();
			return "/sendmail/main";
		}
	}

	@RequestMapping(value = "/write_action.do", method = RequestMethod.POST)
	public String writeAction(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, HttpServletRequest request,
			ModelMap model) throws Exception {

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
		return "/sendmail/success";
	}

	@RequestMapping(value = "/message.do")
	public String message(ModelMap model) throws Exception {
		return "/sendmail/message";
	}

	@RequestMapping(value = "/sent.do")
	public String sent(@ModelAttribute("sendMailVO") SendMailVO sendMailVO, HttpServletRequest request,
			HttpServletResponse response, ModelMap model) throws Exception {

		String login = (String) request.getSession().getAttribute("isLogin");
		if (login != null && login.equals("success")) {
			List<?> list = sendMailService.selectMailList(sendMailVO);
			model.addAttribute("resultList", list);
			return "/sendmail/sent";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 필수'); </script>");
			out.flush();
			return "/sendmail/main";
		}

	}

	@RequestMapping(value = "/trashCan.do")
	public String trashBean(ModelMap model) throws Exception {
		return "/sendmail/trashCan";
	}

	@RequestMapping(value = "/success.do")
	public String success(ModelMap model) throws Exception {
		return "/sendmail/success";
	}

	@RequestMapping(value = "/fail.do")
	public String fail(ModelMap model) throws Exception {
		return "/sendmail/fail";
	}

	
	public String sha256(String msg) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(msg.getBytes());

			StringBuilder builder = new StringBuilder();
			for (byte b : md.digest()) {
				builder.append(String.format("%02x", b));
			}
			return builder.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
}
