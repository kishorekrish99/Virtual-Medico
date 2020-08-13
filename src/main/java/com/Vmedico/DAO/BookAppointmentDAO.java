package com.Vmedico.DAO;

import java.util.List;

import com.Vmedico.Model.BookAppointment;

public interface BookAppointmentDAO {

	public void saveappointment(BookAppointment bookappointment);

	public List<BookAppointment> getappointments();

}
