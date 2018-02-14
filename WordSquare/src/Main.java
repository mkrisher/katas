// determine if a given set of words can result in a word square

import java.io.*;
import java.util.*;

import java.lang.reflect.Array;

public class Main {
    static ArrayList<String> words = new ArrayList<String>();


    public static void main(String[] args) { // ball, area, lead, lady
        words.add("ball");
        words.add("food");
        words.add("lady");
        words.add("lead");
        words.add("area");

//        words.add("card");
//        words.add("area");
//        words.add("rear");
//        words.add("dart");

        WordSquare wordsquare = new WordSquare(words);
        boolean result        = wordsquare.process();

        if(result == false) {
            System.out.println("a wordsquare can not be created");
        }
    }
}
