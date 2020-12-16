package hyunmyungsoo.petmeet.dao.comment;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Comment;

public interface CommentDao {
	List<Comment> selectComments(int boardNum);
	
	int insertComment(Comment comment);

	Comment selectComment(int commentNum);
	
	int updateComment(Comment comment);
	int deleteComment(int commentNum);
}