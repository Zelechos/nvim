public class Person {

  public String name;
  public String lastname;
  public int age;

  public Person(String name, String lastname, int age) {
    this.name = name;
    this.lastname = lastname;
    this.age = age;
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getLastName() {
    return this.lastname;
  }

  public void setLastName(String lastname) {
    this.lastname = lastname;
  }

  public int getAge() {
    return this.age;
  }

  public void setAge(int age) {
    this.age = age;
  }

}
