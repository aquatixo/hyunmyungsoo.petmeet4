package hyunmyungsoo.petmeet.domain;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
   private String userId;
   private String userName;
   private String userNickname;
   private String userPw;
   
   private String userPhone;
   private LocalDate userBirth;
   
   private String userLocSi;
   private String userLocGu;
   private String userLocDong; 
}