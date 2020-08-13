package com.Vmedico.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Vmedico.DAO.PatientDAO;
import com.Vmedico.Model.Patient;

@Service
public class PatientServiceImpl implements PatientService {
	@Autowired
	private PatientDAO patientdao;

	@Override
	@Transactional
	public List<Patient> getPatientList() {
		return patientdao.getPatientList();
	}

	@Override
	@Transactional
	public void savepatient(Patient patient) {
		patientdao.savepatient(patient);
		
	}
}
