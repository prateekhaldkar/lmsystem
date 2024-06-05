package utils;

import java.util.ArrayList;
import models.City;
import models.State;

public class SplitCities {
    public static City splitCity(String city,ArrayList<City> cities){
        int i = city.indexOf("(");
        String stat = city.substring(0,city.length()-1) ;
        city = city.substring(1, i);
        int index = cities.indexOf(new City(city,new State(stat)));

        return cities.get(index + 1);
    } 
}
