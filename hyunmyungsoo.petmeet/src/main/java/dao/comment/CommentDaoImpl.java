package hyunmyungsoo.petmeet.dao.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import hyunmyungsoo.petmeet.dao.map.comment.CommentMap;
import hyunmyungsoo.petmeet.domain.Comment;

@Repository
public class CommentDaoImpl implements CommentDao{
	@Autowired private CommentMap mapper;
	
	@Override
	public List<Comment> selectComments(int boardNum) {
		return mapper.selectComments(boardNum);
	}

	@Override
	public int insertComment(Comment comment) {
		return mapper.insertComment(comment);
	}

	@Override
	public Comment selectComment(int commentNum) {
		return mapper.selectComment(commentNum);
	}

	@Override
	public int updateComment(Comment comment) {
		return mapper.updateComment(comment);
	}

	@Override
	public int deleteComment(int commentNum) {
		return mapper.deleteComment(commentNum);
	}
}