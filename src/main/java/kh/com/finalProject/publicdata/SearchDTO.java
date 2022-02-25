package kh.com.finalProject.publicdata;

public class SearchDTO {
	private String contentid;
	private String addr1;
	private String firstimage2;
	private String modifiedtime;
	private int readcount;
	private String title;
	private String content;

	public SearchDTO() {
	}

	public SearchDTO(String contentid, String addr1, String firstimage2, String modifiedtime, int readcount,
			String title, String content) {
		super();
		this.contentid = contentid;
		this.addr1 = addr1;
		this.firstimage2 = firstimage2;
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

	public String getFirstimage2() {
		return firstimage2;
	}

	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}

	public String getModifiedtime() {
		return modifiedtime;
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
		return "SearchDTO [contentid=" + contentid + ", addr1=" + addr1 + ", firstimage2=" + firstimage2
				+ ", modifiedtime=" + modifiedtime + ", readcount=" + readcount + ", title=" + title + ", content="
				+ content + "]";
	}

}
