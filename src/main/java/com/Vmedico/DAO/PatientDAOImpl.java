package com.Vmedico.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Vmedico.Model.Patient;

@Repository
public class PatientDAOImpl implements PatientDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Patient> getPatientList() {
		Session session=sessionFactory.getCurrentSession();
		Query<Patient> query=session.createQuery("from Patient",Patient.class);
		List<Patient> patient=query.getResultList();

		return patient;
	}

	@Override
	public void savepatient(Patient patient) {
		Session session=sessionFactory.getCurrentSession();
		session.save(patient);
	}
	
	
}
