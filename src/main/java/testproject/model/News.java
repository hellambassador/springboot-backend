package testproject.model;





import java.sql.Date;

import java.util.List;

import jakarta.persistence.*;
import lombok.Data;

/**
 *  Модель новости
 */
@Data
@Entity
@Table(name = "News")
public class News {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "title", nullable = false)
	private String title;
	
	@Column(name = "Text")
	private String Text;

	@Column(name = "creationDate")
	private Date creationDate;
	
	@Column(name = "lastEditDate")
	private Date lastEditDate;
	
	@ManyToOne
	@JoinColumn(name = "insertedById", referencedColumnName = "id")
	//@Column(name = "insertedById")
	private User insertedById;
	
	@ManyToOne
	@JoinColumn(name = "updatedById", referencedColumnName = "id")
	//@Column(name = "updatedById")
	private User updatedById;

	@OneToMany(mappedBy = "news")
	//@Column(name = "updatedById")
	private List<Comment> comments;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getText() {
		return Text;
	}

	public void setText(String text) {
		Text = text;
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

	public User getInsertedById() {
		return insertedById;
	}

	public void setInsertedById(User insertedById) {
		this.insertedById = insertedById;
	}

	public User getUpdatedById() {
		return updatedById;
	}

	public void setUpdatedById(User updatedById) {
		this.updatedById = updatedById;
	}
	
}

