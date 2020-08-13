package com.Vmedico.Model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="noappointments")
public class NoAppointments {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String date;
	private String totalAppintments;
	public NoAppointments() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTotalAppintments() {
		return totalAppintments;
	}
	public void setTotalAppintments(String totalAppintments) {
		this.totalAppintments = totalAppintments;
	}
	@Override
	public String toString() {
		return "NoAppointments [id=" + id + ", date=" + date + ", totalAppintments=" + totalAppintments + "]";
	}
	public NoAppointments(int id, String date, String totalAppintments) {
		super();
		this.id = id;
		this.date = date;
		this.totalAppintments = totalAppintments;
	}
	
}
