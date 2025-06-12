//convert from CelsiusToFahrenheit

public class CelsiusToFahrenheit {
    public static decimal tempconverter(decimal myCelsius){
        decimal myFahrenheit = (myCelsius * 9/5);
 		system.debug('myFahrenheit' + myFahrenheit);    
        return myFahrenheit;
    }
}