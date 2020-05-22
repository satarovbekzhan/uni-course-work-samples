package museum.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Socket;
import java.util.Scanner;

public class Client {
    private final int port;
    private final String host;

    public Client(int port, String host) {
        this.port = port;
        this.host = host;
    }

    public void start() throws IOException {
        try (Socket socket = new Socket(host, port)) {
            Scanner scanner = new Scanner(System.in);
            Scanner in = new Scanner(socket.getInputStream());
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
            while (in.hasNextLine()) {
                String line = in.nextLine();
                if (line.equals("ending")) break;
                System.out.println(line);
            }
            System.out.print(">>> ");
            while (scanner.hasNextLine()) {
                String input = scanner.nextLine();
                out.println(input);
                while (in.hasNextLine()) {
                    String line = in.nextLine();
                    if (line.equals("ending")) break;
                    System.out.println(line);
                }
                if (input.equals("quit")) break;
                System.out.print(">>> ");
            }
        }
    }
}
