package fpro.data.service;

import java.util.List;

import fpro.data.dto.TheaterDto;

public interface TheaterServiceInter {
	public List<TheaterDto> getSomeDatas(String city);
}
