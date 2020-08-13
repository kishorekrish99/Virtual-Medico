package com.Vmedico.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.Vmedico.Model.DoctorList;

public interface DoctorListDAO  {

	public List<DoctorList> getdoctorlist();

	public void savedoctor(DoctorList doctor);

}
