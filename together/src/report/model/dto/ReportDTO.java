package report.model.dto;

import java.sql.Timestamp;

public class ReportDTO {

	private Integer report_num;
	private String writer;
	private String id;
	private Integer sel;
	private String detail;
	private Integer status;
	private Integer result;
	private String reason;
	private Timestamp reg;
	
	public Integer getReport_num() {
		return report_num;
	}
	public void setReport_num(Integer report_num) {
		this.report_num = report_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getSel() {
		return sel;
	}
	public void setSel(Integer sel) {
		this.sel = sel;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getResult() {
		return result;
	}
	public void setResult(Integer result) {
		this.result = result;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Timestamp getReg() {
		return reg;
	}
	public void setReg(Timestamp reg) {
		this.reg = reg;
	}
	
	
}
