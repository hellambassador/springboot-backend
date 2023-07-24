package testproject.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import testproject.model.News;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

/**
 * news repository
 */
public interface NewsRepository extends PagingAndSortingRepository<News, Long>, CrudRepository<News, Long> {
    @Query(value = "SELECT * FROM News WHERE (title LIKE %:query%) || Text LIKE %:query%", nativeQuery = true)
    Page<News> findAllBySearch(@Param("query") String query, Pageable pageable);
}