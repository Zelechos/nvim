package test;

import java.util.*;

public class Main {

  public static void main (String[] args){
    System.out.println(factoryPersons());
  }
  
  public static List<Person> factoryPersons(){
    List<Person> persons = new ArrayList<>();
    persons.add(new Person("Alex", "Tumiri Huanca", 27));
    persons.add(new Person("Alan", "Turing", 43));
    persons.add(new Person("Linus", "Torvalds", 53));
    return persons;
  }
}
