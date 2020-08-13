package com.Vmedico.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.Vmedico.Model.BookAppointment;
import com.Vmedico.Model.DoctorList;
import com.Vmedico.Model.NoAppointments;
import com.Vmedico.Model.Patient;
import com.Vmedico.Service.BookAppointmentService;
import com.Vmedico.Service.DoctorListService;
import com.Vmedico.Service.NoAppointmentsService;
import com.Vmedico.Service.PatientService;

@Controller
public class MainController {
	@Autowired
	private DoctorListService doctorlistservice;
	
	@Autowired
	private PatientService patientservice;
	
	@Autowired
	private NoAppointmentsService noappointmenservice;
	
	@Autowired
	private BookAppointmentService bookappointmentservice;
	
	@GetMapping("/appointments")
	public String appointments(Model model) {
		List<BookAppointment> appointments=bookappointmentservice.getappointments();
		model.addAttribute("appointments", appointments);
		return "Appointments";
	}
	
	@GetMapping("/patientslist")
	public String patientList(Model model) {
		List<Patient> patientlist=patientservice.getPatientList();
		Patient patient=new Patient();
		model.addAttribute("patient", patient);
		model.addAttribute("patientlist", patientlist);
		return "PatientList";
	}
	
	@GetMapping("/patientstatus")
	public String patientStatus() {
		return "PatientStatus";
	}
	
	@GetMapping("/labreports")
	public String labreports() {
		return "LabReports";
	}
	
	@GetMapping("/doctorlist")
	public String doctorList(Model model) {
		List<DoctorList> doctorlist=doctorlistservice.getdoctorlist();
		DoctorList doctor=new DoctorList();
		model.addAttribute("doctor",doctor);
		model.addAttribute("doctorlist",doctorlist);
		return "DoctorList";
	}
	
	@GetMapping("/noofappointments")
	public String noOfAppointmnets(Model model) {
		List<NoAppointments> appoinments=noappointmenservice.getnoofappointments();
		model.addAttribute("appoinments", appoinments);
		return "NoOfAppointments";
	}
	
	
	
	@GetMapping("/bookappointment")
	public String bookappointmnet(Model model) {
		
		BookAppointment bookappointment=new BookAppointment();
		model.addAttribute("bookappointment",bookappointment);
		return "BookAppointment";
	}
}