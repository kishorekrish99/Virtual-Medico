package com.Vmedico.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="patients")
public class Patient {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	private String name;
	private Long phone;
	private String purpose;
	private String status;
	private String date;
	public Patient() {
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getPhone() {
		return phone;
	}
	public void setPhone(Long phone) {
		this.phone = phone;
	}
	public String getPurpose() {
		return purpose;
	}
	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Patient [id=" + id + ", name=" + name + ", phone=" + phone + ", purpose=" + purpose + ", status="
				+ status + ", date=" + date + "]";
	}
	public Patient(int id, String name, Long phone, String purpose, String status, String date) {
		super();
		this.id = id;
		this.name = name;
		this.phone = phone;
		this.purpose = purpose;
		this.status = status;
		this.date = date;
	}
	
}
