package fpro.data.service;

import java.util.List;

import fpro.data.dto.DemovieDto;

public interface DemovieServiceInter {
	public List<DemovieDto> getSomeDatas(String theater,String moviename);
}
