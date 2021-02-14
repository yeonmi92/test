package csboard.model.dto;

import java.sql.Timestamp;

public class CsBoardDTO {
	private Integer cs_num;
	private Integer sel;	
	private String subject;
	private String id;
	private String content;
	private String reply;
	private Integer status;
	private Timestamp reg;
	private Integer readcount;
	
	public Integer getCs_num() {
		return cs_num;
	}
	public void setCs_num(Integer cs_num) {
		this.cs_num = cs_num;
	}
	public Integer getSel() {
		return sel;
	}
	public void setSel(Integer sel) {
		this.sel = sel;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	public Integer getReadcount() {
		return readcount;
	}
	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}	
}
