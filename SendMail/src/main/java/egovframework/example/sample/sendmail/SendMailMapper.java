package egovframework.example.sample.sendmail;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;


@Mapper("sendMailMapper")
public interface SendMailMapper {
	
	void sendMail(SendMailVO vo) throws Exception;
	
	void insertUserInfo(SendMailVO vo) throws Exception;
	
	String selectLoginCheck(SendMailVO vo);
	
	List<?> selectMailList(SendMailVO vo) throws Exception;


}
