package egovframework.example.sample.sendmail;


import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;


@Service("sendMailService")
public class SendMailServiceImpl extends EgovAbstractServiceImpl implements SendMailService {


	private static final Logger LOGGER = LoggerFactory.getLogger(SendMailServiceImpl.class);

	/** SampleDAO */
	// TODO ibatis 사용
//	@Resource(name = "sampleDAO")
//	private SampleDAO sampleDAO;
	// TODO mybatis 사용
	@Resource(name = "sendMailMapper")
	private SendMailMapper sendMailDAO;

	/** ID Generation */
	@Resource(name = "egovIdGnrService")
	private EgovIdGnrService egovIdGnrService;
	
	
	public String sendMail(SendMailVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		sendMailDAO.sendMail(vo);
		return vo.getIdx();
	}
	
	public String insertUserInfo(SendMailVO vo) throws Exception {
		LOGGER.debug(vo.toString());

		sendMailDAO.insertUserInfo(vo);
		return vo.getIdx();
	}
	
	public List<?> selectMailList(SendMailVO vo) throws Exception {
		return sendMailDAO.selectMailList(vo);
	}
	
	public String selectLoginCheck(SendMailVO vo) {
		return sendMailDAO.selectLoginCheck(vo);
	}
	
}
