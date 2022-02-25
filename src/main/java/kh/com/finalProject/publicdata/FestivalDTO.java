package kh.com.finalProject.publicdata;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FestivalDTO {
	private String contentid;
	private String addr1;
	private String addr2;
	private String firstimage;
	private String firstimage2;
	private String eventenddate;
	private String eventstartdate;
	private String modifiedtime;
	private int readcount;
	private String title;
	private String tel;
	private String content;

	public FestivalDTO() {
	}

	public FestivalDTO(String contentid, String addr1, String addr2, String firstimage, String firstimage2,
			String eventenddate, String eventstartdate, String modifiedtime, int readcount, String title, String tel,
			String content) {
		super();
		this.contentid = contentid;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.eventenddate = eventenddate;
		this.eventstartdate = eventstartdate;
		this.modifiedtime = modifiedtime;
		this.readcount = readcount;
		this.title = title;
		this.tel = tel;
		this.content = content;
	}

	public String getContentid() {
		return contentid;
	}

	public void setContentid(String contentid) {
		this.contentid = contentid;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public String getFirstimage2() {
		return firstimage2;
	}

	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}

	public String getEventenddate() {
		return eventenddate;
	}

	public void setEventenddate(String eventenddate) {
		this.eventenddate = eventenddate;
	}

	public void setEventenddate(Date eventenddate) {
		this.eventenddate = getEnd(eventenddate);
	}

	public String getEventstartdate() {
		return eventstartdate;
	}

	public void setEventstartdate(String eventstartdate) {
		this.eventstartdate = eventstartdate;
	}

	public void setEventstartdate(Date eventstartdate) {
		this.eventstartdate = getStart(eventstartdate);
	}

	public String getModifiedtime() {
		return modifiedtime;
	}

	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = getModi(modifiedtime);
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "FestivalDTO [contentid=" + contentid + ", addr1=" + addr1 + ", addr2=" + addr2 + ", firstimage="
				+ firstimage + ", firstimage2=" + firstimage2 + ", eventenddate=" + eventenddate + ", eventstartdate="
				+ eventstartdate + ", modifiedtime=" + modifiedtime + ", readcount=" + readcount + ", title=" + title
				+ ", tel=" + tel + ", content=" + content + "]";
	}

	public String getModi(Date modifiedtime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 kk:mm:ss");
		return sdf.format(modifiedtime);
	}

	public String getStart(Date eventstartday) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sdf.format(eventstartday);
	}

	public String getEnd(Date eventendday) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		return sdf.format(eventendday);
	}

}
