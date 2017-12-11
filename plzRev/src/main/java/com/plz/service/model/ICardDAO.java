package com.plz.service.model;

import java.util.HashMap;
import java.util.List;

public interface ICardDAO {

	List<HashMap<String, String>> getAllcardList();


	List<HashMap<String, String>> getcardcompany();

	List<HashMap<String, String>> cardSearch(HashMap<String, String> map);

	







	
}
