/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package adweek3;

/**
 *
 * @author Mike
 */
public interface UnoSpeler {    
    public int zet(Kaart bovenste, Stapel hand);
    public String getNaam();
    public boolean enkeleKaart(Kaart bovenste, Kaart kaart);
    public Kaart.Soort kiesKleur(Stapel hand);
}
