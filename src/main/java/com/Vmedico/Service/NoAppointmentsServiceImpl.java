package com.Vmedico.Service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Vmedico.DAO.NoAppointmentDAO;
import com.Vmedico.Model.NoAppointments;

@Service
public class NoAppointmentsServiceImpl implements NoAppointmentsService {
	@Autowired
	private NoAppointmentDAO noappointmentdao;

	@Override
	@Transactional
	public List<NoAppointments> getnoofappointments() {
		return noappointmentdao.getnoofappointments();
	}
}
