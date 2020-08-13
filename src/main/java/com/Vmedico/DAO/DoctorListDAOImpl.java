package com.Vmedico.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Vmedico.Model.DoctorList;
@Repository
public class DoctorListDAOImpl implements DoctorListDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<DoctorList> getdoctorlist() {
		Session session=sessionFactory.getCurrentSession();
		Query<DoctorList> query=session.createQuery("from DoctorList",DoctorList.class);
		//Execute Query and getting the list
		List<DoctorList> doctorlist=query.getResultList();
		return doctorlist;
	}

	@Override
	public void savedoctor(DoctorList doctor) {
		Session session=sessionFactory.getCurrentSession();
		session.save(doctor);
		
	}

}
