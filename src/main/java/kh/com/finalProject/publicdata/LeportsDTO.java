package kh.com.finalProject.publicdata;

import java.text.SimpleDateFormat;
import java.util.Date;

public class LeportsDTO {
	private String contentid;
	private String addr1;
	private String addr2;
	private String firstimage;
	private String firstimage2;
	private String mapx;
	private String mapy;
	private String modifiedtime;
	private int readcount;
	private String title;
	private String content;

	public LeportsDTO() {
	}

	public LeportsDTO(String contentid, String addr1, String addr2, String firstimage, String firstimage2, String mapx,
			String mapy, String modifiedtime, int readcount, String title, String content) {
		super();
		this.contentid = contentid;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.mapx = mapx;
		this.mapy = mapy;
		this.modifiedtime = modifiedtime;
		this.readcount = readcount;
		this.title = title;
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

	public String getMapx() {
		return mapx;
	}

	public void setMapx(String mapx) {
		this.mapx = mapx;
	}

	public String getMapy() {
		return mapy;
	}

	public void setMapy(String mapy) {
		this.mapy = mapy;
	}

	public String getModifiedtime() {
		return modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = getModi(modifiedtime);
	}

	public void setModifiedtime(String modifiedtime) {
		this.modifiedtime = modifiedtime;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "LeportsDTO [contentid=" + contentid + ", addr1=" + addr1 + ", addr2=" + addr2 + ", firstimage="
				+ firstimage + ", firstimage2=" + firstimage2 + ", mapx=" + mapx + ", mapy=" + mapy + ", modifiedtime="
				+ modifiedtime + ", readcount=" + readcount + ", title=" + title + ", content=" + content + "]";
	}

	public String getModi(Date modifiedtime) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 kk:mm:ss");
		return sdf.format(modifiedtime);
	}

	public Date getDate(String modifiedtime) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddkkmmss");
			return sdf.parse(modifiedtime);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
