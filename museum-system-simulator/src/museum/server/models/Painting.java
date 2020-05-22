package museum.server.models;

public class Painting extends Piece {
    private float height;
    private float width;

    public Painting(String id, String title, String year, Artist author, float height, float width) {
        super(id, title, year, author);
        this.height = height;
        this.width = width;
    }

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getWidth() {
        return width;
    }

    public void setWidth(float width) {
        this.width = width;
    }

    @Override
    public String toString() {
        return "Painting{" +
                "height=" + height +
                ", width=" + width +
                "} " + super.toString();
    }
}
