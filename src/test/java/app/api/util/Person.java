package app.api.util;



public class Person {

    public static class ComplexObject {
        private int id;
        private String name;

        public ComplexObject(int id, String name) {
            this.id = id;
            this.name = name;
        }

        public int getId() {
            return id;
        }

        public String getName() {
            return name;
        }
    }

    public static ComplexObject createComplexObject(int id, String name) {
        return new ComplexObject(id, name);
    }
}