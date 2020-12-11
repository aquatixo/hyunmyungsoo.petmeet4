package hyunmyungsoo.petmeet.service.sitter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunmyungsoo.petmeet.dao.sitter.SitterDao;
import hyunmyungsoo.petmeet.domain.Sitter;

@Service
public class SitterServiceImpl implements SitterService {
	@Autowired private SitterDao sitterDao;
	@Override
	public List<Sitter> getSitters(){
		return sitterDao.selectSitters();
	}
	
	@Override
	public Sitter getSitter(String userId) {
		return sitterDao.selectSitter(userId);
	}
	
	@Override
	public boolean addSitter(Sitter sitter) {
		return sitterDao.insertSitter(sitter);
	}
	
	@Override
	public void assignSitter(HttpSession session, String sitterTitle, 
			String sitterContent, 
			String sitterPetType, String sitterPetSize, String sitterLocSi, 
			String sitterLocGu, String sitterLocDong, String daterange,
			String fileName) throws ParseException {
		Sitter sitter = new Sitter();

		int idx = daterange.indexOf("-");
		String sitterStartDate = daterange.substring(0, idx-1);
		String sitterFinishDate = daterange.substring(idx+2);
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("mm/dd/yyyy");
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
		
		Date before = beforeFormat.parse(sitterStartDate);
		String after = afterFormat.format(before);
		
		LocalDate sitterStart = LocalDate.parse(after, DateTimeFormatter.ISO_DATE);
		
		before = beforeFormat.parse(sitterFinishDate);
		after = afterFormat.format(before);
		
		LocalDate sitterFinish = LocalDate.parse(after, DateTimeFormatter.ISO_DATE);
		
		String userId = session.getAttribute("userEmail").toString();
		
		sitter.setUserId(userId);
		sitter.setSitterTitle(sitterTitle);
		sitter.setSitterContent(sitterContent);
		sitter.setSitterPetType(sitterPetType);
		sitter.setSitterPetSize(sitterPetSize);
		sitter.setSitterLocSi(sitterLocSi);
		sitter.setSitterLocGu(sitterLocGu);
		sitter.setSitterLocDong(sitterLocDong);
		sitter.setSitterStart(sitterStart);
		sitter.setSitterFinish(sitterFinish);
		sitter.setSitterFileName(fileName);
		
		addSitter(sitter);
	}
	
	@Override
	public boolean fixSitter(HttpSession session, String sitterTitle, String sitterContent, 
			String sitterPetType, String sitterPetSize, String sitterLocSi, String sitterLocGu, 
			String sitterLocDong, String daterange, String fileName) throws ParseException {
		
		Sitter sitter = new Sitter();
		int idx = daterange.indexOf("-");
		String sitterStartDate = daterange.substring(0, idx-1);
		String sitterFinishDate = daterange.substring(idx+2);
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("mm/dd/yyyy");
		SimpleDateFormat afterFormat = new SimpleDateFormat("yyyy-mm-dd");
		
		Date before = beforeFormat.parse(sitterStartDate);
		String after = afterFormat.format(before);
		
		LocalDate sitterStart = LocalDate.parse(after, DateTimeFormatter.ISO_DATE);
		
		before = beforeFormat.parse(sitterFinishDate);
		after = afterFormat.format(before);
		
		LocalDate sitterFinish = LocalDate.parse(after, DateTimeFormatter.ISO_DATE);
		
		String userId = session.getAttribute("userEmail").toString();
		
		sitter.setUserId(userId);
		sitter.setSitterTitle(sitterTitle);
		sitter.setSitterContent(sitterContent);
		sitter.setSitterPetType(sitterPetType);
		sitter.setSitterPetSize(sitterPetSize);
		sitter.setSitterLocSi(sitterLocSi);
		sitter.setSitterLocGu(sitterLocGu);
		sitter.setSitterLocDong(sitterLocDong);
		sitter.setSitterStart(sitterStart);
		sitter.setSitterFinish(sitterFinish);
		sitter.setSitterFileName(fileName);
		
		return sitterDao.updateSitter(sitter);
	}

	@Override
	public Sitter getSitterNum(int sitterNum) {
		return sitterDao.selectSitterNum(sitterNum);
	}
	
	@Override
	public boolean delSitter(String userId) {
		return sitterDao.deleteSitter(userId);
	}
}
