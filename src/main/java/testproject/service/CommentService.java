package testproject.service;

import testproject.model.Comment;
import testproject.model.User;
import org.springframework.data.domain.Page;

import java.util.List;
/**
 *  интерфейс для CommentServiceImpl
 */
public interface CommentService {
    Comment saveComment(Comment comment, User user);
    List<Comment> getAllComments();
    Comment getCommentById(long id);
    Comment updateComment(Comment comment, long id, User user);
    void deleteComment(long id, User user);
    Page<Comment> getCommentPage(Long idNews, Integer page, Integer pageSize);
}