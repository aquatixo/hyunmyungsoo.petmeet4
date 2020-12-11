package hyunmyungsoo.petmeet.web.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import hyunmyungsoo.petmeet.domain.Reservation;
import hyunmyungsoo.petmeet.service.reservation.ReservationService;

@RestController
@RequestMapping
public class RestReservationController {
	@Autowired private ReservationService reservationService;
	
	@PostMapping("/reservation/reserve")   //this parameter is a json
	public boolean reserve(@RequestBody Reservation reservation) {
		return reservationService.reserve(reservation);
	}
}
