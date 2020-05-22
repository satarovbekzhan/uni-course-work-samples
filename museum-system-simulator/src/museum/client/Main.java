package museum.client;

public class Main {

    public static void main(String[] args) throws Exception {
        int port = Integer.parseInt(args[0]);
        String host = args[1];
        Client client = new Client(port, host);
        client.start();
    }
}
