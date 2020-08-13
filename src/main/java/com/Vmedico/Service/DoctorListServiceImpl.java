package com.Vmedico.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Vmedico.DAO.DoctorListDAO;
import com.Vmedico.Model.DoctorList;
@Service
public class DoctorListServiceImpl implements DoctorListService {
	
	@Autowired
	private DoctorListDAO doctorlistdao;

	@Override
	@Transactional
	public List<DoctorList> getdoctorlist() {
		return doctorlistdao.getdoctorlist();
	}

	@Override
	@Transactional
	public void savedoctor(DoctorList doctor) {
		doctorlistdao.savedoctor(doctor);
	}

	

}
