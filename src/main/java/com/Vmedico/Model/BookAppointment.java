package com.Vmedico.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class BookAppointment {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	private int uniqueid;
	private String category;
	private String purpose;
	private String date;
	private String slot;
	public BookAppointment() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUniqueid() {
		return uniqueid;
	}
	public void setUniqueid(int uniqueid) {
		this.uniqueid = uniqueid;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSlot() {
		return slot;
	}
	public void setSlot(String slot) {
		this.slot = slot;
	}
	public BookAppointment(int id, int uniqueid, String category, String purpose, String date, String slot) {
		super();
		this.id = id;
		this.uniqueid = uniqueid;
		this.category = category;
		this.purpose = purpose;
		this.date = date;
		this.slot = slot;
	}
	@Override
	public String toString() {
		return "BookAppointment [id=" + id + ", uniqueid=" + uniqueid + ", category=" + category + ", purpose="
				+ purpose + ", date=" + date + ", slot=" + slot + "]";
	}
	
}
