package testproject.service.impl;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import testproject.exception.NoRightsException;
import testproject.model.User;
import testproject.service.CommentService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import testproject.exception.ResourceNotFoundException;
import testproject.model.Comment;
import testproject.repository.CommentRepository;

/**
 * * service for working with comments
 */
@Service
public class CommentServiceImpl  implements CommentService {

	private CommentRepository commentRepository;

	/**
	 * constructor
	 */
	public CommentServiceImpl(CommentRepository commentRepository) {
		super();
		this.commentRepository = commentRepository;
	}
	/**
	 * * saving a comment
	 * @param comment what are we saving
	 * @param user Who
	 * @return comment
	 */
	@Override
	public Comment saveComment(Comment comment, User user) {
		return commentRepository.save(comment);
	}
	/**
	 * * get all comments
	 * @return comment sheet
	 */
	@Override
	public List<Comment> getAllComments() {
		return commentRepository.findAll(PageRequest.ofSize(100000000)).toList();
	}
	/**
	 * * get comment
	 * @param id comment
	id * @return comment
	 */
	@Override
	public Comment getCommentById(long id) {
		return commentRepository.findById(id).orElseThrow(() -> 
						new ResourceNotFoundException("Comment", "Id", id));
		
	}
	/**
	 * * get all comments related to the news
	 * @param page which page
	 * @param idNews id news
	 * @param pageSize page size
	 * @return comment page
	 */
	@Override
	public Page<Comment> getCommentPage(Long idNews, Integer page, Integer pageSize) {
		return commentRepository.findAllByIdNews(idNews,PageRequest.of(page, pageSize));
	}
	/**
	 * * comment change
	 * @param comment what to change
	 * @param id comment
	 * @param user user
	 * @return modified comment
	 */
	@Override
	public Comment updateComment(Comment comment, long id, User user) {
		
		// we need to check whether comment with given id is exist in DB or not
		Comment existingComment = commentRepository.findById(id).orElseThrow(
				() -> new ResourceNotFoundException("Comment", "Id", id));
		existingComment.setUpdatedById(user);
		existingComment.setText(comment.getText());
		existingComment.setLastEditDate(Date.valueOf(LocalDate.now()));
		if (user.getRole().toString().equals("Admin")) {
			commentRepository.save(existingComment);
			return existingComment;
		}
		if (comment.getUpdatedById().equals(user)) {
			commentRepository.save(existingComment);
		} else { throw new NoRightsException("News","Id",id); }
		return existingComment;
	}
	/**
	 * * deleting a comment
	 * @param id comment
	id * @param user user
	 */
	@Override
	public void deleteComment(long id, User user) {
		if (user.getRole().toString().equals("Admin")) {
			commentRepository.findById(id).orElseThrow(() ->
					new ResourceNotFoundException("News", "Id", id));
			commentRepository.deleteById(id);
			return;
		}
		Comment comment = commentRepository.findById(id).orElseThrow(() ->
				new ResourceNotFoundException("News", "Id", id));
		if (comment.getUpdatedById().equals(user)) {
			commentRepository.deleteById(id);
		} else { throw new NoRightsException("News","Id",id); }

		commentRepository.findById(id).orElseThrow(() -> 
								new ResourceNotFoundException("Comment", "Id", id));
		commentRepository.deleteById(id);
	}
	
}