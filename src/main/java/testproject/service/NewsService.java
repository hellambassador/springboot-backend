package testproject.service;

import testproject.model.News;
import testproject.model.User;
import org.springframework.data.domain.Page;

/**
 *  интерфейс для NewsServiceImpl
 */
public interface NewsService {
    News saveNews(News news,User user);
    public Page<News> findAllBySearch(String query, Integer page, Integer pageSize) ;
    Page<News> getNewsPage(Integer page, Integer pageSize);
    News getNewsById(long id);
    News updateNews(News news, long id,User user);
    void deleteNews(long id, User user);
}