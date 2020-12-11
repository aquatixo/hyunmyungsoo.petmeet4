package hyunmyungsoo.petmeet.dao.sitter;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Sitter;

public interface SitterDao {
	List<Sitter> selectSitters();
	Sitter selectSitter(String userId);
	boolean insertSitter(Sitter sitter);
	boolean updateSitter(Sitter sitter);
	boolean deleteSitter(String userId);

	Sitter selectSitterNum(int sitterNum);
}