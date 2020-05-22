package museum.server.models;

public class Sculpture extends Piece {
    private String material;
    private float weight;

    public Sculpture(String id, String title, String year, Artist author, String material, float weight) {
        super(id, title, year, author);
        this.material = material;
        this.weight = weight;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public float getWeight() {
        return weight;
    }

    public void setWeight(float weight) {
        this.weight = weight;
    }

    @Override
    public String toString() {
        return "Sculpture{" +
                "material='" + material + '\'' +
                ", weight=" + weight +
                "} " + super.toString();
    }
}
