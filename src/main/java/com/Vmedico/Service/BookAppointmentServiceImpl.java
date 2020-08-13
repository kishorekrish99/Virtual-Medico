package com.Vmedico.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Vmedico.DAO.BookAppointmentDAO;
import com.Vmedico.Model.BookAppointment;

@Service
public class BookAppointmentServiceImpl implements BookAppointmentService {
	
	@Autowired
	private BookAppointmentDAO bookappointmentdao;
	
	@Override
	@Transactional
	public void saveappointment(BookAppointment bookappointment) {
		bookappointmentdao.saveappointment(bookappointment);
		
	}

	@Override
	@Transactional
	public List<BookAppointment> getappointments() {
		return bookappointmentdao.getappointments();
	}

}
