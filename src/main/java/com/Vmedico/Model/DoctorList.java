package com.Vmedico.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "doctorlist")
public class DoctorList {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
	private int id;
	@Column(name="name")
	private String name;
	@Column(name="phone")
	private Long phone;
	@Column(name="specification")
	private String specification;
	public DoctorList() {
		
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
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	@Override
	public String toString() {
		return "DoctorList [id=" + id + ", name=" + name + ", phone=" + phone + ", specification=" + specification
				+ "]";
	}
	public DoctorList( String name, Long phone, String specification) {
		super();
		this.name = name;
		this.phone = phone;
		this.specification = specification;
	}
	
}