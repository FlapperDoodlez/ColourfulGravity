import java.io.*;
void WriteLevels(ArrayList<Level> al) {
  FileOutputStream fos = new FileOutputStream("levels.dat");
  ObjectOutputStream oos = new ObjectOutputStream(fos);
  oos.writeObject(al);
  oos.close();
  fos.close();
}

ArrayList<Level> ReadLevels() {
  ArrayList<Level> arrayList;
  FileInputStream fis = new FileInputStream("levels.dat");
  ObjectInputStream ois = new ObjectInputStream(fis);
  arrayList = (ArrayList<Level>) ois.readObject();
  ois.close();
  fis.close();
  return arrayList;
}