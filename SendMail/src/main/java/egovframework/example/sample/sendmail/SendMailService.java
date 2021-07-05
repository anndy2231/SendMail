package egovframework.example.sample.sendmail;

import java.util.List;

public interface SendMailService {

	String sendMail(SendMailVO vo) throws Exception;
	
	String insertUserInfo(SendMailVO vo) throws Exception;
	
	String selectLoginCheck(SendMailVO vo);
	
	List<?> selectMailList(SendMailVO vo) throws Exception;
}
