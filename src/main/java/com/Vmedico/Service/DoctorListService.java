package com.Vmedico.Service;

import java.util.List;

import com.Vmedico.Model.DoctorList;

public interface DoctorListService {

	public List<DoctorList> getdoctorlist();

	public void savedoctor(DoctorList doctor);

	
}
