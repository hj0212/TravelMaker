package dto;

public class PhotosDTO {

	private int photo_seq;
	private String original_file_name;
	private String system_file_name;
	
	public PhotosDTO() {}

	public PhotosDTO(int photo_seq, String original_file_name, String system_file_name) {
		super();
		this.photo_seq = photo_seq;
		this.original_file_name = original_file_name;
		this.system_file_name = system_file_name;
	}

	public int getPhoto_seq() {
		return photo_seq;
	}

	public void setPhoto_seq(int photo_seq) {
		this.photo_seq = photo_seq;
	}

	public String getOriginal_file_name() {
		return original_file_name;
	}

	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}

	public String getSystem_file_name() {
		return system_file_name;
	}

	public void setSystem_file_name(String system_file_name) {
		this.system_file_name = system_file_name;
	}
	
	
	
	
}
