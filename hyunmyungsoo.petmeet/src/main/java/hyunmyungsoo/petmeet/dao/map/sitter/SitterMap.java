package hyunmyungsoo.petmeet.dao.map.sitter;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.domain.Sitter;

@Repository
public interface SitterMap {
	List<Sitter> selectSitters();
	Sitter selectSitter(String userId);
	List<Sitter> selectSpecDogSitters(@Param("sitterLocDong") String sitterLocDong, @Param("sitterStart") LocalDate sitterStart, 
			@Param("sitterPetType") String sitterPetType, @Param("sitterPetSize") String sitterPetSize);
	List<Sitter> selectSpecCatSitters(@Param("sitterLocDong") String sitterLocDong, @Param("sitterStart") LocalDate sitterStart, 
			@Param("sitterPetType") String sitterPetType, @Param("sitterPetSize") String sitterPetSize);
	boolean insertSitter(Sitter sitter);
	boolean updateSitter(Sitter sitter);
	boolean deleteSitter(String userId);
	
	Sitter selectSitterNum(int sitterNum);
	int selectSitterCnt();
}