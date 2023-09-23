
package uneatlantico.ejemplos.ficheros;

import java.io.*;

class FilesSystemExample {
    public static void main(String args[]) {

        String str;
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        System.out.print("Entra un texto para tu archivo que contenga algunos datos (`Parar´ para finalizar) ");
        try (FileWriter fw = new FileWriter("C:\\Users\\ProfesorUneatlántico\\Documents\\Docencia2024\\Bases de Datos I\\Semana-1\\CasoDe EstudioSistemasDeFicheros\\text.txt")) {

            do{
                System.out.print(": ");
                str = br.readLine();
                if(str.compareTo("Parar") == 0) break;
                str = str + "\r\n";
                fw.write(str); // escribir líneas en el archivo
            } while (str.compareTo("Parar") != 0);
        } catch (IOException exc) {
            System.out.println("I/O error: " + exc);
        }

    }
}

