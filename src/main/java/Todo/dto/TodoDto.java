package Todo.dto;

public class TodoDto {
	private long id;
	private String title;
	private String name;
	private int sequence;
	private String type;
	private String regdate;
	
	public TodoDto() {
	}
	public TodoDto(long id, String title, String name, int sequence, String type, String regdate) {
		super();
		this.id=id;
		this.title=title;
		this.name=name;
		this.sequence=sequence;
		this.type=type;
		this.regdate=regdate;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSequence() {
		return sequence;
	}
	public void setSequence(int sequence) {
		this.sequence = sequence;
	}
	@Override
	public String toString() {
		return "TodoDto [id=" + id + ", title=" + title + ", name=" + name + ", sequence=" + sequence + ", type=" + type
				+ ", regdate=" + regdate + "]";
	}
}
