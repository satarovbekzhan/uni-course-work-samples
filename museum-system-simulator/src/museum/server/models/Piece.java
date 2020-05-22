package museum.server.models;

public abstract class Piece {
    private String id;
    private String title;
    private String year;
    private Artist author;

    public Piece(String id, String title, String year, Artist author) {
        this.id = id;
        this.title = title;
        this.year = year;
        this.author = author;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Artist getAuthor() {
        return author;
    }

    public void setAuthor(Artist author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "Piece{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", year='" + year + '\'' +
                ", author=" + author.toString() +
                '}';
    }
}
