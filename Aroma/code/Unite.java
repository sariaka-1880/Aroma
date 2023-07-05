package assets;

public class Unite {
    private int id;
    private String nom;

    public Unite(){}

    public Unite(int id){
        setNom(nom);
    }

    public Unite(String nom){
        setNom(nom);
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
}
