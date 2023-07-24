package testproject.controller;

import testproject.model.News;
import testproject.model.User;
import testproject.service.NewsService;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import org.springframework.security.core.annotation.AuthenticationPrincipal;

import org.springframework.web.bind.annotation.*;

/**
 *  controller responsible for interaction with new networks
 */
@RestController
@RequestMapping("/api/news")
public class NewsController {

    static int pageSize = 4;
    private NewsService newsService;
    /**
     *  конструктор коментария
     */
    public NewsController(NewsService newsService) {
        super();
        this.newsService = newsService;
    }

    /**
     * adding news
     * @param news what comment
     * @param user who wrote
     * @return information about whether it turned out or not
     */
    @PostMapping()
    public ResponseEntity<News> saveNews(@RequestBody News news, @AuthenticationPrincipal User user){
        return new ResponseEntity<News>(newsService.saveNews(news,user), HttpStatus.CREATED);
    }
    /**
     * information on a specific news
     * @param idNews id news
     * @return comment
     */
    @GetMapping("{id}")
    public ResponseEntity<News> getNewsById(@PathVariable("id") long idNews){
        return new ResponseEntity<News>(newsService.getNewsById(idNews), HttpStatus.OK);
    }
    /**
     * get all the news
     * @param page page no.
     * @param search what information should be present in the news
     * @return page with news
     */
    @GetMapping
    public Page<News> getNewsPageWithSearch(@RequestParam(defaultValue = "0") int page,
                                            @RequestParam(defaultValue = "")String search) {

        return newsService.findAllBySearch(search,page, pageSize);
    }
    /**
     * news change
     * @param id id news
     * @param news what to replace the comment with
     * @param user who changed
     * @return information about whether it turned out or not
     */
    @PutMapping("{id}")
    public ResponseEntity<News> updateNews(@PathVariable("id") long id
            ,@RequestBody News news,@AuthenticationPrincipal User user){
        return new ResponseEntity<News>(newsService.updateNews(news, id,user), HttpStatus.OK);
    }

    /**
     * deleting news
     * @param id id news
     * @param user who deleted
     * @return information about whether it turned out or not
     */
    @DeleteMapping("{id}")
    public ResponseEntity<String> deleteNews(@PathVariable("id") long id,@AuthenticationPrincipal User user){
        newsService.deleteNews(id,user);
        return new ResponseEntity<String>("News deleted successfully!.", HttpStatus.OK);
    }

}