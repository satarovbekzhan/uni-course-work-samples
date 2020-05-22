package museum.server.models;

public class Artist {
    private String id;
    private String name;
    private String country;
    private String biography;

    public Artist(String id, String name, String country, String biography) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.biography = biography;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getBiography() {
        return biography;
    }

    public void setBiography(String biography) {
        this.biography = biography;
    }

    @Override
    public String toString() {
        return "Artist{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", country='" + country + '\'' +
                ", biography='" + biography + '\'' +
                '}';
    }
}
