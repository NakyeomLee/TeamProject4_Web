package management;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class JoinUser {
	private String user_id;
	private String user_name;
	private String user_gender;
	private String user_birth;
	private String user_phone;
	private String user_address;
	private String user_grade;
}