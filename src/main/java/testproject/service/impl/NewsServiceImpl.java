package testproject.service.impl;


import testproject.exception.NoRightsException;
import testproject.exception.ResourceNotFoundException;
import testproject.model.News;
import testproject.model.User;
import testproject.repository.NewsRepository;
import testproject.service.NewsService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;


import java.sql.Date;
import java.time.LocalDate;

/**
 * service for working with comments
 */
@Service
public class NewsServiceImpl implements NewsService {
    private NewsRepository newsRepository;
    /**
     * constructor
     */
    public NewsServiceImpl(NewsRepository newsRepository) {
        super();
        this.newsRepository = newsRepository;
    }
    /**
     * saving comments
     * @param news what we save
     * @param user Who
     * @return news
     */
    @Override
    public News saveNews(News news, User user) {
        news.setInsertedById(user);
        news.setUpdatedById(user);
        news.setCreationDate(Date.valueOf(LocalDate.now()));
        news.setLastEditDate(Date.valueOf(LocalDate.now()));
        return newsRepository.save(news);
    }

    /**
     * news where a certain text
     * @param page which page
     * @param query what are we looking for
     * @param pageSize page size
     * @return news page
     */
    @Override
    public Page<News> findAllBySearch(String query, Integer page, Integer pageSize) {
        return newsRepository.findAllBySearch(query, PageRequest.of(page, pageSize));
    }
    /**
     * get the news page
     * @param page which page
     * @param pageSize page size
     * @return news page
     */
    @Override
    public Page<News> getNewsPage(Integer page, Integer pageSize) {
        return newsRepository.findAll(PageRequest.of(page, pageSize));
    }
    /**
     * get news
     * @param id id news
     * @return news
     */
    @Override
    public News getNewsById(long id) {
        return newsRepository.findById(id).orElseThrow(() ->
                new ResourceNotFoundException("News", "Id", id));

    }
    /**
     * news change
     * @param news what to change
     * @param id id news
     * @param user user
     * @return changed news
     */
    @Override
    public News updateNews(News news, long id, User user) {
        News existingNews = newsRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("News", "Id", id));
        if (user.getRole().toString().equals("Admin")) {
            existingNews.setLastEditDate(Date.valueOf(LocalDate.now()));
            existingNews.setText(news.getTitle());
            existingNews.setTitle(news.getText());
            existingNews.setUpdatedById(user);
            newsRepository.save(existingNews);
            return existingNews;
        }
        if (existingNews.getInsertedById().equals(user)) {
            existingNews.setLastEditDate(Date.valueOf(LocalDate.now()));
            existingNews.setText(news.getTitle());
            existingNews.setTitle(news.getText());
            newsRepository.save(existingNews);
            return existingNews;
        } else {
            throw new NoRightsException("News", "Id", id);
        }
    }
    /**
     * deleting news
     * @param id id news
     * @param user user
     */
    @Override
    public void deleteNews(long id, User user) {
        if (user.getRole().toString().equals("Admin")) {
            newsRepository.findById(id).orElseThrow(() ->
                    new ResourceNotFoundException("News", "Id", id));
            newsRepository.deleteById(id);
            return;
        }
        News news = newsRepository.findById(id).orElseThrow(() ->
                new ResourceNotFoundException("News", "Id", id));
        if (news.getInsertedById().equals(user)) {
            newsRepository.deleteById(id);
        } else {
            throw new NoRightsException("News", "Id", id);
        }
    }

}