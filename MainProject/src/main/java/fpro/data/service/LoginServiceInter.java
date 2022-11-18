package fpro.data.service;

public interface LoginServiceInter {
	public String getName(String id); //아이디에 해당하는 이름 가져오기
	public int getIdPassCheck(String id, String pass); 
}
