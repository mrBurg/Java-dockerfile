@Service
public class ClientService {

    @Value("${client}")
    private String client;

    public String sayHello(){
        return "Hello!: " + client;
    }
}