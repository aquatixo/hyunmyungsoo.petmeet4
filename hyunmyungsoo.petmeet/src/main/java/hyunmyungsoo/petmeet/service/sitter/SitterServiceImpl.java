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
	public List<Sitter> getSpecSitters(String sitterLocDong, String sitterStart, String sitterPetType, String sitterPetSize) {
		String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z]";
        sitterLocDong = sitterLocDong.replaceAll(match, "");
		List<Sitter> getSitters = null;
		if (sitterPetType.equals("강아지"))
			getSitters = sitterDao.selectSpecDogSitters(sitterLocDong, LocalDate.parse(sitterStart), sitterPetType, sitterPetSize);
		else
			getSitters = sitterDao.selectSpecCatSitters(sitterLocDong, LocalDate.parse(sitterStart), sitterPetType, sitterPetSize);
		
		return getSitters;
	}
	
	@Override
	public boolean addSitter(Sitter sitter) {
		return sitterDao.insertSitter(sitter);
	}
	
	@Override
	public void assignSitter(HttpSession session, String sitterTitle, 
			String sitterContent, 
			String sitterPetType, String sitterPetSize, String sitterPostNum, String sitterLocOrg, 
			String daterange, String fileName) throws ParseException {
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
		
		String sitterLocSi = null;
		String sitterLocGu = null;
		String sitterLocDong = null;
		
		String[] tokens = sitterLocOrg.split(" ");
		
		for(String token: tokens) {
			if(tokens[0] == token)
				sitterLocSi = token;
			
			if(token.endsWith("시"))
				sitterLocSi = token;
			else if(token.endsWith("구"))
				sitterLocGu = token;
			else if(token.endsWith("동"))
				sitterLocDong = token;
		}
		
		sitter.setUserId(userId);
		sitter.setSitterTitle(sitterTitle);
		sitter.setSitterContent(sitterContent);
		sitter.setSitterPetType(sitterPetType);
		sitter.setSitterPetSize(sitterPetSize);
		sitter.setSitterPostNum(sitterPostNum);
		sitter.setSitterLocOrg(sitterLocOrg);
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
			String sitterPetType, String sitterPetSize, String sitterPostNum, String sitterLocOrg, 
			String daterange, String fileName) throws ParseException {
		
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
		
		String sitterLocSi = null;
		String sitterLocGu = null;
		String sitterLocDong = null;
		
		String[] tokens = sitterLocOrg.split(" ");
		
		for(String token: tokens) {
			if(tokens[0] == token)
				sitterLocSi = token;
			
			if(token.endsWith("시"))
				sitterLocSi = token;
			else if(token.endsWith("구"))
				sitterLocGu = token;
			else if(token.endsWith("동"))
				sitterLocDong = token;
		}
		
		sitter.setUserId(userId);
		sitter.setSitterTitle(sitterTitle);
		sitter.setSitterContent(sitterContent);
		sitter.setSitterPetType(sitterPetType);
		sitter.setSitterPetSize(sitterPetSize);
		sitter.setSitterPostNum(sitterPostNum);
		sitter.setSitterLocOrg(sitterLocOrg);
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
	
	@Override
	public String getSitterDate(String userId, int num) throws ParseException {
		String date = null;
		
		SimpleDateFormat beforeFormat = new SimpleDateFormat("yyyy-mm-dd");
		SimpleDateFormat afterFormat = new SimpleDateFormat("mm/dd/yyyy");
		
		if(num == 1) {
			LocalDate sitterStart = sitterDao.selectSitter(userId).getSitterStart();
			
			Date before = beforeFormat.parse((sitterStart).toString());
			String after = afterFormat.format(before);
			
			date = after;
		} else {
			LocalDate sitterFinish = sitterDao.selectSitter(userId).getSitterFinish();
			
			Date before = beforeFormat.parse((sitterFinish).toString());
			String after = afterFormat.format(before);
			
			date = after;
		}
		
		return date;
	}
	
	@Override
	public int getSitterCnt() {
		return sitterDao.selectSitterCnt();
	}
}