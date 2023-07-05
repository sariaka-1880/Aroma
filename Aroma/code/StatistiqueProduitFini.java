package assets.produit;


public class StatistiqueProduitFini {
    double rendement_mois;
    String mois;
    int annee;


    public double getRendement_mois() {
        return rendement_mois;
    }
    public void setRendement_mois(double rendement_mois) {
        this.rendement_mois = rendement_mois;
    }
    public String getMois() {
        return mois;
    }
    public void setMois(String mois) {
        System.out.println("mois niova");
        this.mois = ChangeChar( mois );
        System.out.println(getMois());
    }
    public String ChangeChar( String mois ){
        mois =  mois.replace("Ã©", "é");
        mois = mois.replace("Ã»", "u");
        return mois;
    }
    public int getAnnee() {
        return annee;
    }
    public void setAnnee(int annee) {
        this.annee = annee;
    }
    @Override
    public String toString() {
        return "StatistiqueProduitFini [rendement_mois=" + rendement_mois + ", mois=" + mois + ", annee=" + annee + "]";
    }
}
