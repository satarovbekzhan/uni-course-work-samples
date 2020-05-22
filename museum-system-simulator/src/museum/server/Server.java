package museum.server;

import museum.server.models.Ticket;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Server {
    private final Database db;
    private final int port;
    private final int threads;

    public Server(int port, int threads) {
        this.db = new Database();
        this.port = port;
        this.threads = threads;
    }

    public void start() throws IOException {
        try (ServerSocket listener = new ServerSocket(port)) {
            System.out.println("The server is listening on port " + port + "...");
            ExecutorService pool = Executors.newFixedThreadPool(threads);
            while (true) {
                pool.execute(new Handler(listener.accept(), db));
            }
        }
    }

    private static class Handler implements Runnable {
        private final Database db;
        private final Socket socket;
        private Scanner in;
        private PrintWriter out;
        private final String starterMessage;
        private final String endingMessage;

        Handler(Socket socket, Database db) {
            this.socket = socket;
            this.db = db;
            this.starterMessage = "Your session has successfully started!!!";
            this.endingMessage = "You have finished your session!!!";
        }

        private void send(String message) {
            String end = "\nending";
            out.println(message + end);
        }

        @Override
        public void run() {
            System.out.println("Connected: " + socket);
            try {
                in = new Scanner(socket.getInputStream());
                out = new PrintWriter(socket.getOutputStream(), true);
                send(starterMessage);
                while (in.hasNextLine()) {
                    String command = in.nextLine();
                    if (command.equals("quit")) break;
                    send(dispatch(command));
                }
                send(endingMessage);
            } catch (Exception e) {
                System.out.println("ERROR: " + socket);
            } finally {
                try {
                    socket.close();
                } catch (IOException ignored) {}
                System.out.println("Closed: " + socket);
            }
        }

        private String dispatch(String command) {
            if (command.equals("help")) {
                return db.getInstructions();
            } else if (command.equals("adduser")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    if (db.isHead(username)) {
                        send("enter a role ('head' or 'employee')");
                        var role = in.nextLine();
                        if (role.equals("head")) {
                            send("enter a new username for new head user");
                            var newUsername = in.nextLine();
                            send("enter a password for new head user");
                            var newPassword = in.nextLine();
                            return db.addHeadUser(newUsername, newPassword);
                        } else if (role.equals("employee")) {
                            send("enter a new username for new head user");
                            var newUsername = in.nextLine();
                            send("enter a password for new head user");
                            var newPassword = in.nextLine();
                            return db.addEmployeeUser(newUsername, newPassword);
                        } else return "invalid role name";
                    } else return "permission denied";
                } else return "incorrect username or password";
            } else if (command.equals("deleteuser")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    if (db.isHead(username)) {
                        send("enter an id of user you wanna delete");
                        var id = in.nextLine();
                        Object user = db.getUser(id);
                        if (user != null) {
                            send("are you sure to delete the " + user.toString() + " ('yes' or 'no')");
                            var choice = in.nextLine();
                            if (choice.equals("yes")) {
                                return db.deleteUser(id);
                            } else return "user not deleted";
                        } else return "user not found";
                    } else return "permission denied";
                } else return "incorrect username or password";
            } else if (command.equals("userslist")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    if (db.isHead(username)) {
                        return db.usersList();
                    } else return "permission denied";
                } else return "incorrect username or password";
            } else if (command.equals("addticket")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    send("enter the description of a new ticket");
                    var description = in.nextLine();
                    send("enter the price");
                    var price = in.nextLine();
                    send("how much time will ticket work (minutes)");
                    var duration = in.nextLine();
                    return db.addTicket(description, price, duration);
                } else return "incorrect username or password";
            } else if (command.equals("deleteticket")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    send("enter the id of a ticket you wanna delete");
                    var id = in.nextLine();
                    Object ticket = db.getTicket(id);
                    if (ticket != null) {
                        send("are you sure to delete the " + ticket.toString() + " ('yes' or 'no')");
                        var choice = in.nextLine();
                        if (choice.equals("yes")) {
                            return db.deleteTicket(id);
                        } else return "ticket not deleted";
                    } else return "ticket not found";
                } else return "incorrect username or password";
            } else if (command.equals("ticketslist")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    return db.ticketsList();
                } else return "incorrect username or password";
            } else if (command.equals("addartist")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    send("enter the name of an artist");
                    var name = in.nextLine();
                    send("enter the country artist born");
                    var country = in.nextLine();
                    send("give a short biography");
                    var biography = in.nextLine();
                    return db.addArtist(name, country, biography);
                } else return "incorrect username or password";
            } else if (command.equals("deleteartist")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    send("enter the id of an artist you wanna delete");
                    var id = in.nextLine();
                    Object artist = db.getArtist(id);
                    if (artist != null) {
                        send("are you sure to delete the " + artist.toString() + " ('yes' or 'no')");
                        var choice = in.nextLine();
                        if (choice.equals("yes")) {
                            return db.deleteArtist(id);
                        } else return "artist not deleted";
                    } else return "artist not found";
                } else return "incorrect username or password";
            } else if (command.equals("artistslist")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    return db.artistsList();
                } else return "incorrect username or password";
            } else if (command.equals("addpiece")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    send("what are you gonna to add ('sculpture' or 'painting')");
                    var type = in.nextLine();
                    if (type.equals("sculpture")) {
                        send("enter the title");
                        var title = in.nextLine();
                        send("enter the year");
                        var year = in.nextLine();
                        send("enter the artist id");
                        var id = in.nextLine();
                        send("enter material");
                        var material = in.nextLine();
                        send("enter weight");
                        var weight = in.nextLine();
                        return db.addSculpture(title, year, id, material, weight);
                    } else if (type.equals("painting")) {
                        send("enter the title");
                        var title = in.nextLine();
                        send("enter the year");
                        var year = in.nextLine();
                        send("enter the artist id");
                        var id = in.nextLine();
                        send("enter height");
                        var height = in.nextLine();
                        send("enter width");
                        var width = in.nextLine();
                        return db.addPainting(title, year, id, height, width);
                    } else return "invalid type of piece";
                } else return "incorrect username or password";
            } else if (command.equals("deletepiece")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    send("enter the id of a piece you wanna delete");
                    var id = in.nextLine();
                    Object piece = db.getPiece(id);
                    if (piece != null) {
                        send("are you sure to delete the " + piece.toString() + " ('yes' or 'no')");
                        var choice = in.nextLine();
                        if (choice.equals("yes")) {
                            return db.deletePiece(id);
                        } else return "piece not deleted";
                    } else return "piece not found";
                } else return "incorrect username or password";
            } else if (command.equals("pieceslist")) {
                send("enter your username");
                var username = in.nextLine();
                send("enter your password");
                var password = in.nextLine();
                if (db.validateUser(username, password)) {
                    return db.piecesList();
                } else return "incorrect username or password";
            } else if (command.equals("buy")) {
                if (db.noTickets()) return "no ticket yet";
                send(db.ticketsList() + "\nenter the ticket id you wanna to buy");
                var id = in.nextLine();
                Ticket ticket = db.getTicket(id);
                if (ticket != null) {
                    send("pay for ticket");
                    var cash = in.nextLine();
                    try {
                        if (ticket.getPrice() <= Integer.parseInt(cash)) {
                            return db.buyTicket(id);
                        } else return "you gave not enough money";
                    } catch (Exception e) {
                        return "you gave invalid cash";
                    }
                } else return "enter correct ticket id";
            } else if (command.equals("info")) {
                send("enter your ticket code");
                var code = in.nextLine();
                if (db.validatePurchasedTicket(code)) {
                    send("give an id object you would to get info");
                    var id = in.nextLine();
                    return db.getFullArtistOrPieceInfo(id);
                } else return "your ticket is invalid";
            }
            return "unknown command\nenter 'help' to get the list of commands";
        }
    }
}

