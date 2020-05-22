package museum.server;

public class Main {

    public static void main(String[] args) throws Exception {
        int port = Integer.parseInt(args[0]);
        int threads = Integer.parseInt(args[1]);
        System.out.println(port + " " + threads);
        Server server = new Server(port, threads);
        server.start();
    }
}
