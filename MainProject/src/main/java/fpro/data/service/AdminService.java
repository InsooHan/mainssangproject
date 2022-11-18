package fpro.data.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import fpro.data.mapper.AdminMapperInter;

@Service
public class AdminService implements AdminServiceInter {

	@Autowired
	AdminMapperInter mapperInter;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperInter.getTotalCount();
	}
	

}
