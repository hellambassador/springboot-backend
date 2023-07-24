package testproject.model;

import java.sql.Date;



import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.Data;


/**
 *  Модель комментария
 */
@Data
@Entity
@Table(name = "Comments")
public class Comment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "text")
	private String text;
	
	@Column(name = "creationDate")
	private Date creationDate;
	
	@Column(name = "lastEditDate")
	private Date lastEditDate;
	
	@ManyToOne
	@JoinColumn(name = "updatedById", referencedColumnName = "id")
	private User updatedById;

	@JsonIgnore
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "id_news", referencedColumnName = "id")
	private News news;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
	public Date getLastEditDate() {
		return lastEditDate;
	}
	public void setLastEditDate(Date lastEditDate) {
		this.lastEditDate = lastEditDate;
	}
	public User getUpdatedById() {
		return updatedById;
	}
	public void setUpdatedById(User updatedById) {
		this.updatedById = updatedById;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	
}
