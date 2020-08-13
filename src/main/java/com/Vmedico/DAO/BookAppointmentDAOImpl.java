package com.Vmedico.DAO;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.Vmedico.Model.BookAppointment;
import com.Vmedico.Model.DoctorList;

@Repository
public class BookAppointmentDAOImpl implements BookAppointmentDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void saveappointment(BookAppointment bookappointment) {
		Session session=sessionFactory.getCurrentSession();
		session.save(bookappointment);
	}
	
	@Override
	public List<BookAppointment> getappointments() {
		Session session=sessionFactory.getCurrentSession();
		Query<BookAppointment> query=session.createQuery("from BookAppointment",BookAppointment.class);
		//Execute Query and getting the list
		List<BookAppointment> appointmentlist=query.getResultList();
		return appointmentlist;
	}

}
