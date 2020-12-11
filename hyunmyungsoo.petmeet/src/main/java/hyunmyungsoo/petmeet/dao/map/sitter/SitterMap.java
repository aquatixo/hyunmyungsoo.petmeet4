package hyunmyungsoo.petmeet.dao.map.sitter;

import java.util.List;

import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.domain.Sitter;

@Repository
public interface SitterMap {
	List<Sitter> selectSitters();
	Sitter selectSitter(String userId);
	boolean insertSitter(Sitter sitter);
	boolean updateSitter(Sitter sitter);
	boolean deleteSitter(String userId);
	
	Sitter selectSitterNum(int sitterNum);
}
