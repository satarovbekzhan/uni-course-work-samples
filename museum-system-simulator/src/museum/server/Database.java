package museum.server;

import museum.server.models.*;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class Database {
    private final String instructions;
    private final Map<String, Date> purchasedTickets;
    private final DateFormat dateFormatter;
    private final List<User> users;
    private final List<Ticket> tickets;
    private final List<Artist> artists;
    private final List<Piece> pieces;

    public Database() {
        this.instructions = "Enter correct commands to make changes:\n" +
                "Информация! \n" +
                "[quit] - quit the program\n" +
                "[adduser] - add new user\n" +
                "[deleteuser] - delete existing user\n" +
                "[userslist] - get the list of all users\n" +
                "[addticket] - add new type of ticket\n" +
                "[deleteticket] - delete existing type of ticket\n" +
                "[ticketslist] - get the list of all ticket types\n" +
                "[addartist] - add new artist\n" +
                "[deleteartist] - delete existing artist\n" +
                "[artistslist] - get the list of all artists\n" +
                "[addpiece] - add new piece\n" +
                "[deletepiece] - delete existing piece\n" +
                "[pieceslist] - get the list of all pieces\n" +
                "[buy] - buy a ticket\n" +
                "[info] - get info about piece";
        this.purchasedTickets = new HashMap<>();
        this.dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        this.users = new ArrayList<>();
        this.tickets = new ArrayList<>();
        this.artists = new ArrayList<>();
        this.pieces = new ArrayList<>();
        //
        addHeadUser("admin", "admin");
        addEmployeeUser("bekzhan", "123465");
        addEmployeeUser("nurzatbek", "654321");

        addTicket("Temp Ticket", "120", "4");
        addTicket("Long Time Ticket", "480", "30");

        addArtist("Den", "Italy", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.");
        addArtist("John", "Germany", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.");
        addArtist("Eva", "Kyrgyzstan", "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.");

        addSculpture("One", "1886-04-24", artists.get(0).getId(), "Marble", "183.8");
        addSculpture("Two", "1886-04-24", artists.get(1).getId(), "Wood", "9.24");
        addSculpture("Three", "1886-04-24", artists.get(2).getId(), "Iron", "30");

        addPainting("Four", "1886-04-24", artists.get(0).getId(), "158", "100");
        addPainting("Five", "1886-04-24", artists.get(1).getId(), "34", "35");
        addPainting("Six", "1886-04-24", artists.get(2).getId(), "284", "144");
        //
    }

    public String getInstructions() {
        return this.instructions;
    }

    private String generateId() {
        return UUID.randomUUID().toString();
    }

    public String addHeadUser(String username, String password) {
        for (User user:users) {
            if (user.getUsername().equals(username)) {
                return "user with this username already exists";
            }
        }
        User user = new User(generateId(), username, password, Role.HEAD);
        users.add(user);
        return "head successfully created";
    }

    public String addEmployeeUser(String username, String password) {
        for (User user:users) {
            if (user.getUsername().equals(username)) {
                return "user with this username already exists";
            }
        }
        User user = new User(generateId(), username, password, Role.EMPLOYEE);
        users.add(user);
        return "employee successfully created";
    }

    public String deleteUser(String id) {
        for (User user:users) {
            if (user.getId().equals(id)) {
                users.remove(user);
                return "user successfully deleted";
            }
        }
        return "user not found";
    }

    public User getUser(String id) {
        for (User user:users) {
            if (user.getId().equals(id)) {
                return user;
            }
        }
        return null;
    }

    public String usersList() {
        StringBuilder list = new StringBuilder();
        for (User user:users) {
            list.append(user.toString()).append("\n");
        }
        return list.append("count: ").append(users.size()).toString();
    }

    public boolean validateUser(String username, String password) {
        for (User user:users) {
            if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
                return true;
            }
        }
        return false;
    }

    public boolean isHead(String username) {
        for (User user:users) {
            if (user.getUsername().equals(username) && user.getRole() == Role.HEAD) {
                return true;
            }
        }
        return false;
    }

    public String addTicket(String description, String price, String duration) {
        try {
            if (description.isBlank()) return "description can not be blank";
            if (price.isBlank() || Integer.parseInt(price) == 0) return "ticket can not be free";
            if (duration.isBlank() || Integer.parseInt(duration) == 0) return "ticket can not have no duration";
            Ticket ticket = new Ticket(generateId(), description, Integer.parseInt(price), Integer.parseInt(duration));
            tickets.add(ticket);
            return "new ticket successfully added";
        } catch (Exception e) {
            return "incorrect values" + e.getMessage();
        }
    }

    public String deleteTicket(String id) {
        for (Ticket ticket:tickets) {
            if (ticket.getId().equals(id)) {
                tickets.remove(ticket);
                return "ticket successfully deleted";
            }
        }
        return "ticket not found";
    }

    public Ticket getTicket(String id) {
        for (Ticket ticket:tickets) {
            if (ticket.getId().equals(id)) {
                return ticket;
            }
        }
        return null;
    }

    public String ticketsList() {
        StringBuilder list = new StringBuilder();
        for (Ticket ticket:tickets) {
            list.append(ticket.toString()).append("\n");
        }
        return list.append("count: ").append(tickets.size()).toString();
    }

    public String addArtist(String name, String country, String biography) {
        if (!name.isBlank()) {
            if (!country.isBlank()) {
                if (!biography.isBlank()) {
                    for (Artist artist:artists) {
                        if (artist.getName().equals(name)) {
                            return "artist with this name already exists";
                        }
                    }
                    Artist artist = new Artist(generateId(), name, country, biography);
                    artists.add(artist);
                    return "artist successfully created";
                } else return "name, country and biography can not be blank";
            } else return "name and country can not be blank";
        } else return "name can not be blank";
    }

    public String deleteArtist(String id) {
        for (Artist artist:artists) {
            if (artist.getId().equals(id)) {
                artists.remove(artist);
                return "artist successfully deleted";
            }
        }
        return "artist not found";
    }

    public Artist getArtist(String id) {
        for (Artist artist:artists) {
            if (artist.getId().equals(id)) {
                return artist;
            }
        }
        return null;
    }

    public String artistsList() {
        StringBuilder list = new StringBuilder();
        for (Artist artist:artists) {
            list.append(artist.toString()).append("\n");
        }
        return list.append("count: ").append(artists.size()).toString();
    }

    public String addSculpture(String title, String year, String author, String material, String weight) {
        Artist artist = getArtist(author);
        if (artist != null) {
            try {
                Piece piece = new Sculpture(generateId(), title, year, artist, material, Float.parseFloat(weight));
                pieces.add(piece);
                return "sculpture successfully added";
            } catch (Exception e) {
                return "incorrect values" + e.getMessage();
            }
        }
        return "artist not found";
    }

    public String addPainting(String title, String year, String author, String height, String width) {
        Artist artist = getArtist(author);
        if (artist != null) {
            try {
                Piece piece = new Painting(generateId(), title, year, artist, Float.parseFloat(height), Float.parseFloat(width));
                pieces.add(piece);
                return "painting successfully added";
            } catch (Exception e) {
                return "incorrect values" + e.getMessage();
            }
        }
        return "artist not found";
    }

    public String deletePiece(String id) {
        for (Piece piece:pieces) {
            if (piece.getId().equals(id)) {
                pieces.remove(piece);
                return "piece successfully deleted";
            }
        }
        return "piece not found";
    }

    public Piece getPiece(String id) {
        for (Piece piece:pieces) {
            if (piece.getId().equals(id)) {
                return piece;
            }
        }
        return null;
    }

    public String piecesList() {
        StringBuilder list = new StringBuilder();
        for (Piece piece:pieces) {
            list.append(piece.toString()).append("\n");
        }
        return list.append("count: ").append(pieces.size()).toString();
    }

    public boolean noTickets() {
        return tickets.isEmpty();
    }

    public String buyTicket(String id) {
        Ticket ticket = getTicket(id);
        if (ticket != null) {
            String code = generateId();
            long currentTime = System.currentTimeMillis();
            long after = currentTime + (ticket.getDuration() * 60000);
            Date date = new Date(after);
            purchasedTickets.put(code, date);
            return "[ " + code + " ] until " + dateFormatter.format(date);
        } else return "ticket not found";
    }

    public boolean validatePurchasedTicket(String id) {
        if (purchasedTickets.containsKey(id)) {
            Date currentDate = new Date(System.currentTimeMillis());
            Date ticketDate = purchasedTickets.get(id);
            return currentDate.before(ticketDate);
        } else return false;
    }

    public String getFullArtistOrPieceInfo(String id) {
        Artist artist = getArtist(id);
        if (artist != null) return artist.toString();
        Piece piece = getPiece(id);
        if (piece != null) return piece.toString();
        return "no object found\ntry to give correct id";
    }
}
