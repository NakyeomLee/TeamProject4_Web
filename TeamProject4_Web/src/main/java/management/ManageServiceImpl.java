package management;

public class ManageServiceImpl implements ManageService {
	
	private static final ManageServiceImpl instance = new ManageServiceImpl();
	
	private ManageServiceImpl() {
	}
	
	public static ManageServiceImpl getInstance() {
		
		return instance;
	}
}