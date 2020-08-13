package com.Vmedico.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Vmedico.Model.NoAppointments;

@Repository
public class NoAppointmentDAOImpl implements NoAppointmentDAO {
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<NoAppointments> getnoofappointments() {
		Session session=sessionFactory.getCurrentSession();
		Query<NoAppointments> query=session.createQuery("from NoAppointments",NoAppointments.class);
		List<NoAppointments> noappointment=query.getResultList();
		return noappointment;
	}
}
