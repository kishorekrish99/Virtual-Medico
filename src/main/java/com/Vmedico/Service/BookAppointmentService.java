package com.Vmedico.Service;

import java.util.List;

import com.Vmedico.Model.BookAppointment;

public interface BookAppointmentService {

	public void saveappointment(BookAppointment bookappointment);

	public List<BookAppointment> getappointments();

}
