package map.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class MapBoardDTO {
	private Integer map_num;
	private String id;
	private String title;
	private String addr;
	private String lat;
	private String lng;
	private Timestamp teg;
	private String Times;
	private Date start_date;
	private Date end_date;
	private Integer ppl_num;
	private String gender;
	private String age;
	private Integer cost;
	private String hobby;
	private String detail;
	private String ppl_avail;
	private String ppl_join;
	private String status;
	
	public Integer getMap_num() {
		return map_num;
	}
	public void setMap_num(Integer map_num) {
		this.map_num = map_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getLat() {
		return lat;
	}
	public void setLat(String lat) {
		this.lat = lat;
	}
	public String getLng() {
		return lng;
	}
	public void setLng(String lng) {
		this.lng = lng;
	}
	public Timestamp getTeg() {
		return teg;
	}
	public void setTeg(Timestamp teg) {
		this.teg = teg;
	}
	public String getTimes() {
		return Times;
	}
	public void setTimes(String times) {
		Times = times;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public Integer getPpl_num() {
		return ppl_num;
	}
	public void setPpl_num(Integer ppl_num) {
		this.ppl_num = ppl_num;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public Integer getCost() {
		return cost;
	}
	public void setCost(Integer cost) {
		this.cost = cost;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getPpl_avail() {
		return ppl_avail;
	}
	public void setPpl_avail(String ppl_avail) {
		this.ppl_avail = ppl_avail;
	}
	public String getPpl_join() {
		return ppl_join;
	}
	public void setPpl_join(String ppl_join) {
		this.ppl_join = ppl_join;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
