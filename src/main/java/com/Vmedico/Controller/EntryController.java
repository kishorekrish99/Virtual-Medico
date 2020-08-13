package com.Vmedico.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.Vmedico.Model.BookAppointment;
import com.Vmedico.Model.DoctorList;
import com.Vmedico.Model.Patient;
import com.Vmedico.Service.BookAppointmentService;
import com.Vmedico.Service.DoctorListService;
import com.Vmedico.Service.PatientService;

@Controller
public class EntryController {
	@Autowired
	private PatientService patientservice;
	
	@Autowired
	private DoctorListService doctorlistservice;
	
	@Autowired
	private BookAppointmentService bookappointmentservice;
	
	@PostMapping("/savepatient")
	public String savePatient(@ModelAttribute Patient patient) {
		patientservice.savepatient(patient);
		System.out.println(patient);
		return "redirect:/patientslist";
	}
	
	@PostMapping("/savedoctor")
	public String savedoctor(@ModelAttribute DoctorList doctor) {
		doctorlistservice.savedoctor(doctor);
		return "redirect:/doctorlist";
	}
	
	@PostMapping("/saveappointment")
	public String saveappointment(@ModelAttribute BookAppointment bookappointment ) {
		bookappointmentservice.saveappointment(bookappointment);
		return "redirect:/bookappointment";
	}
}
