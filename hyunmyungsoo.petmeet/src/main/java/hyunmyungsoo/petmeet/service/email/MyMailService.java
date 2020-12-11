package hyunmyungsoo.petmeet.service.email;

import hyunmyungsoo.petmeet.domain.Email;

public interface MyMailService {
	void send(Email msg);
}