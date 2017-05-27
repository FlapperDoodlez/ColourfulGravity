import java.io.*;
void WriteLevels(ArrayList<Level> al) {
  try {
    FileOutputStream fos = new FileOutputStream("levels.dat");
    ObjectOutputStream oos = new ObjectOutputStream(fos);
    oos.writeObject(al);
    oos.close();
    fos.close();
  } 
  catch (IOException ioe) {
    ioe.printStackTrace();
  }
}

ArrayList<Level> ReadLevels() {
  ArrayList<Level> arrayList;
  try {
    FileInputStream fis = new FileInputStream("levels.dat");
    ObjectInputStream ois = new ObjectInputStream(fis);
    arrayList = (ArrayList<Level>) ois.readObject();
    ois.close();
    fis.close();
  }
  catch(IOException ioe) {
    ioe.printStackTrace();
    return null;
  }
  catch(ClassNotFoundException c) {
    System.out.println("Class not found");
    c.printStackTrace();
    return null;
  }
  return arrayList;
}