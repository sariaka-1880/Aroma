package assets;
import java.time.LocalDateTime;

public class Transaction {
    int numero_transaction;
    String description;
    LocalDateTime date;
    double entree;
    double sortie;

    
    public int getNumero_transaction() {
        return numero_transaction;
    }
    public void setNumero_transaction(int numero_transaction) {
        this.numero_transaction = numero_transaction;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public LocalDateTime getDate() {
        return date;
    }
    public String getDateString(){
        return getDate().toLocalDate().toString()+" "+getDate().toLocalTime().toString();
    }
    public void setDate(LocalDateTime date) {
        this.date = date;
    }
    public double getEntree() {
        return entree;
    }
    public void setEntree(double entree) {
        this.entree = entree;
    }
    public double getSortie() {
        return sortie;
    }
    public void setSortie(double sortie) {
        this.sortie = sortie;
    }
}
