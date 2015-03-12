package cris;


import java.util.Random;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author 2DAWT
 */
public class Boleto {

    private int nApuestas;

    public Boleto(int apuestas) {
        this.nApuestas = apuestas;
    }

    public int getnApuestas() {
        return nApuestas;
    }

    public int[] getApuesta() {
        return obtenerApuesta();
    }

    public int getReintegro() {
        return obtenerReintegro();
    }

    public int obtenerReintegro() {
        Random r = new Random();
        return r.nextInt(9) + 1;
    }

    public int[] obtenerApuesta() {
        int[] aleatorios = new int[6];
        for (int i = 0; i < aleatorios.length; i++) {
            Boolean existe = true;
            int numero;
            Random r = new Random();
            do {
                numero = r.nextInt(49) + 1;
                if (!this.existe(aleatorios, numero)) {
                    existe = false;
                }
            } while (existe);
            aleatorios[i] = numero;

        }

        return aleatorios;
    }

    public boolean existe(int[] arr, int aleatorio) {
        for (int s : arr) {
            if (s == aleatorio) {
                return true;
            }
        }
        return false;
    }
}
