
package testproject.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import testproject.model.Comment;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
/**
 * comment repository
 */
public interface CommentRepository extends PagingAndSortingRepository<Comment, Long>, CrudRepository<Comment, Long> {
    @Query("SELECT o FROM Comment o WHERE o.news.id = :idNews")
    Page<Comment> findAllByIdNews(@Param("idNews") Long idNews,Pageable pageable);
}
