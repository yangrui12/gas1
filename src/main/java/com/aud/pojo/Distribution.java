package com.aud.pojo;

public class Distribution {
	private Integer id;
    private String name;
    private String driver;
    private String carcode;
    private String note;
    private String date;
    private String transporter;
    private String dispatcher;

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public String getCarcode() {
		return carcode;
	}

	public void setCarcode(String carcode) {
		this.carcode = carcode;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTransporter() {
		return transporter;
	}

	public void setTransporter(String transporter) {
		this.transporter = transporter;
	}

	public String getDispatcher() {
		return dispatcher;
	}

	public void setDispatcher(String dispatcher) {
		this.dispatcher = dispatcher;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Distribution [id=" + id + ", name=" + name + ", driver=" + driver + ", carcode=" + carcode + ", note="
				+ note + ", date=" + date + ", transporter=" + transporter + ", dispatcher=" + dispatcher + "]";
	}


    
}
