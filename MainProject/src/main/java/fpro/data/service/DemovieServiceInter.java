package fpro.data.service;

import java.util.List;

import fpro.data.dto.DemovieDto;
import fpro.data.dto.SangDto;

public interface DemovieServiceInter {
	public List<DemovieDto> getSomeDatas(String theater,String moviename);
	public SangDto getSangData(String num);
	public void updateSeat(DemovieDto dto);
	public DemovieDto getbookedData(String cartnum);
}
