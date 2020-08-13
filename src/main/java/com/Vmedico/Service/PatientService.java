package com.Vmedico.Service;

import java.util.List;

import com.Vmedico.Model.Patient;

public interface PatientService {

	public List<Patient> getPatientList();

	public void savepatient(Patient patient);

	

	
}
