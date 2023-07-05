<%@ page import="com.itextpdf.text.Document" %>
<%@ page import="com.itextpdf.text.Paragraph" %>
<%@ page import="com.itextpdf.text.pdf.PdfPTable" %>
<%@ page import="com.itextpdf.text.pdf.PdfWriter" %>
<%@ page import="com.itextpdf.text.pdf.PdfPTable" %>
<%@ page import="com.itextpdf.text.pdf.PdfPCell" %>
<%@ page import="com.itextpdf.text.Font" %>
<%@ page import="com.itextpdf.text.FontFactory" %>
<%@ page import="com.itextpdf.text.pdf.BaseFont" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.itextpdf.text.Phrase" %>
<%@ page import="com.itextpdf.text.Font" %>

<%
    // Chemin du répertoire parent
    String parentDirectory = "C:/Program Files/Apache Software Foundation/Tomcat 10.0/webapps/Aroma/assets/";

    // Nom du fichier PDF
    String fileName = "facture.pdf";
    
    // Chemin complet du fichier PDF
    String filePath = parentDirectory + fileName;

    try {
        // Création du dossier parent s'il n'existe pas
        File parentDir = new File(parentDirectory);
        if (!parentDir.exists()) {
            parentDir.mkdirs();
        }
        
        // Création du document
        Document document = new Document();
        
        // Initialisation du writer
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(filePath));
        
        // Ouverture du document
        document.open();
        
        // Définition des polices de caractères
        BaseFont bfBold = BaseFont.createFont(BaseFont.HELVETICA_BOLD, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
        BaseFont bfNormal = BaseFont.createFont(BaseFont.HELVETICA, BaseFont.CP1252, BaseFont.NOT_EMBEDDED);
        
        // Création des objets de police
        Font fontTitle = new Font(bfBold, 24);
        Font fontSubtitle = new Font(bfBold, 16);
        Font fontText = new Font(bfNormal, 12);
        
        // Ajout du titre
        Paragraph title = new Paragraph("Facture", fontTitle);
        title.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(title);

        // Ajout numero facture
        Paragraph numfacture = new Paragraph("Facture n : 0001", fontText);
        document.add(numfacture);
        
        // Ajout de la date
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        String currentDate = dateFormat.format(new Date());
        Paragraph date = new Paragraph("Date: " + currentDate, fontText);
        date.setSpacingAfter(10f); // Espacement de 10 points après le paragraphe , io no ampina raha toa ka te hanisy espace nareo , mandingana ligne moa zany plus précisement 
        document.add(date);
        
        // Ajout des informations du client
        Paragraph companyInfo = new Paragraph();
        companyInfo.add(new Paragraph("Company :", fontSubtitle));
        companyInfo.add(new Paragraph("Aroma Andoharanofotsy", fontText));
        companyInfo.add(new Paragraph("034 00 000 00", fontText));
        companyInfo.setSpacingAfter(10f); // Espacement de 10 points après le paragraphe
        document.add(companyInfo);

        Paragraph clientInfo = new Paragraph();
        clientInfo.add(new Paragraph("Client:", fontSubtitle));
        clientInfo.add(new Paragraph("John Doe", fontText));
        clientInfo.add(new Paragraph("034 18 548 43", fontText));
        clientInfo.setSpacingAfter(10f); // Espacement de 10 points après le paragraphe
        document.add(clientInfo);


        // Ajout des détails de la facture
        // io 5 io no nombre de colonne an'ilay table
        PdfPTable table = new PdfPTable(5);
        table.setWidthPercentage(100);
        table.setSpacingBefore(10f);
        table.setSpacingAfter(10f);

        // Hauteur des lignes
        float rowHeight = 30f; // Spécifiez la hauteur souhaitée en points

        // En-tête du tableau
        PdfPCell headerCell1 = new PdfPCell(new Phrase("Designation"));
        headerCell1.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        headerCell1.setFixedHeight(rowHeight);
        table.addCell(headerCell1);

        PdfPCell headerCell2 = new PdfPCell(new Phrase("Quantite"));
        headerCell2.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        headerCell2.setFixedHeight(rowHeight);
        table.addCell(headerCell2);

        PdfPCell headerCell3 = new PdfPCell(new Phrase("Unite"));
        headerCell3.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        headerCell3.setFixedHeight(rowHeight);
        table.addCell(headerCell3);

        PdfPCell headerCell4 = new PdfPCell(new Phrase("Prix unitaire"));
        headerCell4.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        headerCell4.setFixedHeight(rowHeight);
        table.addCell(headerCell4);

        PdfPCell headerCell5 = new PdfPCell(new Phrase("Montant"));
        headerCell5.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        headerCell5.setFixedHeight(rowHeight);
        table.addCell(headerCell5);

        // Contenu du tableau
        PdfPCell contentCell1 = new PdfPCell(new Phrase("Parfum ylang ylang"));
        contentCell1.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell1.setFixedHeight(rowHeight);
        table.addCell(contentCell1);

        PdfPCell contentCell2 = new PdfPCell(new Phrase("2"));
        contentCell2.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell2.setFixedHeight(rowHeight);
        table.addCell(contentCell2);

        PdfPCell contentCell3 = new PdfPCell(new Phrase("2"));
        contentCell3.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell3.setFixedHeight(rowHeight);
        table.addCell(contentCell3);

        PdfPCell contentCell4 = new PdfPCell(new Phrase("Ariary 100000.00"));
        contentCell4.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell4.setFixedHeight(rowHeight);
        table.addCell(contentCell4);

        PdfPCell contentCell5 = new PdfPCell(new Phrase("Ariary 100000.00"));
        contentCell5.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell5.setFixedHeight(rowHeight);
        table.addCell(contentCell5);

        PdfPCell contentCell6 = new PdfPCell(new Phrase("Parfum geranium"));
        contentCell6.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell6.setFixedHeight(rowHeight);
        table.addCell(contentCell6);

        PdfPCell contentCell7 = new PdfPCell(new Phrase("1"));
        contentCell7.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell7.setFixedHeight(rowHeight);
        table.addCell(contentCell7);

        PdfPCell contentCell8 = new PdfPCell(new Phrase("1"));
        contentCell8.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell8.setFixedHeight(rowHeight);
        table.addCell(contentCell8);

        PdfPCell contentCell9 = new PdfPCell(new Phrase("Ariary 100000.00"));
        contentCell9.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell9.setFixedHeight(rowHeight);
        table.addCell(contentCell9);

        PdfPCell contentCell10 = new PdfPCell(new Phrase("Ariary 100000.00"));
        contentCell10.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        contentCell10.setFixedHeight(rowHeight);
        table.addCell(contentCell10);

        // Total HT
        PdfPCell cellTotalHt = new PdfPCell(new Phrase("TOTAL HT", new Font(bfBold, 11)));
        cellTotalHt.setColspan(4);
        cellTotalHt.setHorizontalAlignment(PdfPTable.ALIGN_CENTER);
        cellTotalHt.setFixedHeight(rowHeight);
        table.addCell(cellTotalHt);

        PdfPCell totalHtCell = new PdfPCell(new Phrase("Ariary 100000.00"));
        totalHtCell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        totalHtCell.setFixedHeight(rowHeight);
        table.addCell(totalHtCell);

        // Remise
        PdfPCell cellRemise = new PdfPCell(new Phrase("Remise", new Font(bfBold, 11)));
        cellRemise.setColspan(4);
        cellRemise.setHorizontalAlignment(PdfPTable.ALIGN_CENTER);
        cellRemise.setFixedHeight(rowHeight);
        table.addCell(cellRemise);

        PdfPCell remiseCell = new PdfPCell(new Phrase("Ariary 0.00"));
        remiseCell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        remiseCell.setFixedHeight(rowHeight);
        table.addCell(remiseCell);

        // Total TTC
        PdfPCell cellTotalTtc = new PdfPCell(new Phrase("TOTAL", new Font(bfBold, 11)));
        cellTotalTtc.setColspan(4);
        cellTotalTtc.setHorizontalAlignment(PdfPTable.ALIGN_CENTER);
        cellTotalTtc.setFixedHeight(rowHeight);
        table.addCell(cellTotalTtc);

        PdfPCell totalTtcCell = new PdfPCell(new Phrase("Ariary 100000.00"));
        totalTtcCell.setHorizontalAlignment(PdfPCell.ALIGN_CENTER); // Centrer le texte horizontalement
        totalTtcCell.setFixedHeight(rowHeight);
        table.addCell(totalTtcCell);

        document.add(table);

        Paragraph footer = new Paragraph();
        footer.add(new Paragraph("Arrete a la somme de cent mille Ariary ", fontText));
        footer.add(new Paragraph("Signature", fontText));
        footer.setSpacingAfter(10f); // Espacement de 10 points après le paragraphe
        document.add(footer);
        
        // Fermeture du document
        document.close();
        
        // Affichage d'un message de succès
        String servletPath = "/Aroma/vente/lien_facture";
        response.sendRedirect(servletPath);
        out.println("Le fichier PDF a ete cree avec succes !");
    } catch (Exception e) {
        // Gestion des erreurs
        out.println("Une erreur s'est produite lors de la création du fichier PDF : " + e.getMessage());
    }
%>
