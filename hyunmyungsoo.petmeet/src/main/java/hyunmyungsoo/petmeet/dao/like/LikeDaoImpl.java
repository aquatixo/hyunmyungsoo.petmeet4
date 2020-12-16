package hyunmyungsoo.petmeet.dao.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.dao.map.like.LikeMap;
import hyunmyungsoo.petmeet.domain.Like;

@Repository
public class LikeDaoImpl implements LikeDao{
	@Autowired private LikeMap likeMap;
	
	@Override
	public List<Like> selectLikes() {
		return likeMap.selectLikes();
	}

	@Override
	public boolean insertLike(Like like) {
		return likeMap.insertLike(like);
	}

	@Override
	public boolean deleteLike(int likeNum) {
		return likeMap.deleteLike(likeNum);
	}	
}