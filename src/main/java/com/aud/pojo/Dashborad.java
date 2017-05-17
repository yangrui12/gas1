package com.aud.pojo;

public class Dashborad {
	private Integer id;
	private String type;
	private String media;
	private String volume;
	private String workingpressure;
	private String waterpressure;
	private String blastingpressure;
	private String tempeature;
	private String examiner;
	private String date;
	private String GPS;
	@Override
	public String toString() {
		return "Dashborad [id=" + id + ", type=" + type + ", media=" + media + ", volume=" + volume
				+ ", workingpressure=" + workingpressure + ", waterpressure=" + waterpressure + ", blastingpressure="
				+ blastingpressure + ", tempeature=" + tempeature + ", examiner=" + examiner + ", date=" + date
				+ ", GPS=" + GPS + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMedia() {
		return media;
	}
	public void setMedia(String media) {
		this.media = media;
	}
	public String getVolume() {
		return volume;
	}
	public void setVolume(String volume) {
		this.volume = volume;
	}
	public String getWorkingpressure() {
		return workingpressure;
	}
	public void setWorkingpressure(String workingpressure) {
		this.workingpressure = workingpressure;
	}
	public String getWaterpressure() {
		return waterpressure;
	}
	public void setWaterpressure(String waterpressure) {
		this.waterpressure = waterpressure;
	}
	public String getBlastingpressure() {
		return blastingpressure;
	}
	public void setBlastingpressure(String blastingpressure) {
		this.blastingpressure = blastingpressure;
	}
	public String getTempeature() {
		return tempeature;
	}
	public void setTempeature(String tempeature) {
		this.tempeature = tempeature;
	}
	public String getExaminer() {
		return examiner;
	}
	public void setExaminer(String examiner) {
		this.examiner = examiner;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getGPS() {
		return GPS;
	}
	public void setGPS(String gPS) {
		GPS = gPS;
	}
}
