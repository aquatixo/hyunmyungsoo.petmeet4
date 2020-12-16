package hyunmyungsoo.petmeet.service.like;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hyunmyungsoo.petmeet.dao.like.LikeDao;
import hyunmyungsoo.petmeet.domain.Like;

@Service
public class LikeServiceImpl implements LikeService{
	@Autowired private LikeDao likeDao;
	
	@Override
	public List<Like> getLikes() {
		return likeDao.selectLikes();
	}

	@Override
	public boolean addLike(Like like) {
		return likeDao.insertLike(like);
	}

	@Override
	public boolean addLikeHelper(String userId, int sitterNum) {
		Like like = new Like();
		like.setUserId(userId);
		like.setSitterNum(sitterNum);
		return addLike(like);
	}

	@Override
	public boolean deleteLike(String likeNum) {
		int likeNum2 = Integer.parseInt(likeNum);
		return likeDao.deleteLike(likeNum2);
	}
}