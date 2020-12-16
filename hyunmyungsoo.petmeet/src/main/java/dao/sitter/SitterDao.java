package hyunmyungsoo.petmeet.dao.sitter;

import java.time.LocalDate;
import java.util.List;

import hyunmyungsoo.petmeet.domain.Sitter;

public interface SitterDao {
	List<Sitter> selectSitters();
	Sitter selectSitter(String userId);
	List<Sitter> selectSpecDogSitters(String sitterLocDong, LocalDate sitterStart, String sitterPetType, String sitterPetSize);
	List<Sitter> selectSpecCatSitters(String sitterLocDong, LocalDate sitterStart, String sitterPetType, String sitterPetSize);
	boolean insertSitter(Sitter sitter);
	boolean updateSitter(Sitter sitter);
	boolean deleteSitter(String userId);

	Sitter selectSitterNum(int sitterNum);
	int selectSitterCnt();
}