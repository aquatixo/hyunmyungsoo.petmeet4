package hyunmyungsoo.petmeet.service.comment;

import java.util.List;

import hyunmyungsoo.petmeet.domain.Comment;

public interface CommentService {
	List<Comment> getComments(int boardNum);
	
	boolean addComment(Comment comment);

	Comment getComment(int commentNum);
	
	boolean fixComment(Comment comment);
	boolean delComment(int commentNum);
	
	void addCommentHelper(String commentContent,String userId, int BoardNum);
	void deleteCommentHelper(int boardNum);
}