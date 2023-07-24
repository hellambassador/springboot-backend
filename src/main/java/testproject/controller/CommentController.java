package testproject.controller;

import testproject.model.Comment;
import testproject.model.User;
import testproject.service.CommentService;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;

import org.springframework.web.bind.annotation.*;


/**
 * controller responsible for interacting with comments related to the counter-news
 */
@RestController
@RequestMapping("/api/news/{newsId}/comments")
public class CommentController {
    static int pageSize = 4;
    private CommentService commentService;
    /**
     * constructor
     */
    public CommentController(CommentService commentService) {
        super();
        this.commentService = commentService;
    }
    /**
     * adding a comment
     * @param comment what comment
     * @param user who wrote
     * @return information about whether it turned out or not
     */
    @PostMapping()
    public ResponseEntity<Comment> saveComment(@RequestBody Comment comment, @AuthenticationPrincipal User user){
        return new ResponseEntity<Comment>(commentService.saveComment(comment,user), HttpStatus.CREATED);
    }
    /**
     *  get all comments related to the news
     * @param page page no.
     * @param newsId what news
     * @return page with comments
     */
    @GetMapping()
    public Page<Comment> getCommentPage(@RequestParam(defaultValue = "0") int page, @PathVariable Long newsId) {
        return commentService.getCommentPage(newsId,page, pageSize);
    }

    /**
     * information on a specific comment
     * @param commentId comment id
     * @return comment
     */
    @GetMapping("{id}")
    public ResponseEntity<Comment> getCommentById(@PathVariable("id") long commentId){
        return new ResponseEntity<Comment>(commentService.getCommentById(commentId), HttpStatus.OK);
    }

    /**
     * changing the comment
     * @param comment what to replace the comment with
     * @param user who changed
     * @param id id news
     * @return information about whether it turned out or not
     */
    @PutMapping("{id}")
    public ResponseEntity<Comment> updateComment(@PathVariable("id") long id,@RequestBody Comment comment,
                                                 @AuthenticationPrincipal User user){
        return new ResponseEntity<Comment>(commentService.updateComment(comment, id,user), HttpStatus.OK);
    }

    /**
     * deleting a comment
     * @param id comment id
     * @param user who deleted
     * @return information about whether it turned out or not
     */
    @DeleteMapping("{id}")
    public ResponseEntity<String> deleteComment(@PathVariable("id") long id,@AuthenticationPrincipal User user){
        commentService.deleteComment(id,user);
        return new ResponseEntity<String>("Comment deleted successfully!.", HttpStatus.OK);
    }

}
