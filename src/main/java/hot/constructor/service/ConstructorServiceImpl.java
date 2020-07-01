package hot.constructor.service;

import org.springframework.stereotype.Service;

import hot.constructor.repository.ConstructorRepository;
import hot.member.domain.Constructor;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ConstructorServiceImpl implements ConstructorService {

	private final ConstructorRepository constructorRep;
	
	@Override
	public Constructor selectConstructor(int memberNo) {
		
		return constructorRep.findById(memberNo).orElse(null);
	}

}
