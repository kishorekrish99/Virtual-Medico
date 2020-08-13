package com.Vmedico.DAO;

import java.util.List;

import com.Vmedico.Model.Patient;

public interface PatientDAO {

	public List<Patient> getPatientList();

	public void savepatient(Patient patient);

}
