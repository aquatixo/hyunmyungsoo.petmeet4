package hyunmyungsoo.petmeet.service.sitter;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import hyunmyungsoo.petmeet.domain.Sitter;

public interface SitterService {
	List<Sitter> getSitters();
	Sitter getSitter(String userId);
	List<Sitter> getSpecSitters(String sitterLocDong, String sitterStart, String sitterPetType, String sitterPetSize);
	boolean addSitter(Sitter sitter);
	void assignSitter(HttpSession session, String sitterTitle, String sitterContent, String sitterPetType,
			String sitterPetSize, String sitterPostNum, String sitterLocOrg, String daterange,
			String fileName) throws ParseException;
	boolean fixSitter(HttpSession session, String sitterTitle, String sitterContent, 
			String sitterPetType, String sitterPetSize, String sitterPostNum, String sitterLocOrg,
			String daterange, String fileName) throws ParseException;

	Sitter getSitterNum(int sitterNum);
	boolean delSitter(String userId);
	String getSitterDate(String userId, int num) throws ParseException;
	int getSitterCnt();
}