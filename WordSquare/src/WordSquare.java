import java.lang.reflect.Array;
import java.util.ArrayList;

public class WordSquare {
    public ArrayList<String> words;
    public ArrayList<String> matchedWords = new ArrayList<String>();

    public WordSquare(ArrayList<String> words) {
        this.words = words;
    }

    public boolean process() {
        this.matchedWords.add(this.words.get(0));
        this.words.remove(0);

        for (String word: words) { // ball, area, lead, food, lady
            if (this.matchedWords.size() < 4) {
                checkWords(matchedWords, words, matchedWords.size()); // [ball], [area, lead, lady], 1
            }
        }

        if (matchedWords.size() == 4) {
            System.out.println("A Wordsquare can be created with: ");
            for (String match: matchedWords) {
                System.out.println(match);
            }
            return true;
        } else {
            return false;
        }
    }

    public boolean checkWords(ArrayList<String> matchedWords, ArrayList<String> inputWords, Integer position) {
        String searchString = searchString(this.matchedWords, position); // a

        for (String inputWord: inputWords) {
            if (this.matchedWords.contains(inputWord)) {
                continue;
            }

            String inputWordSub = inputWord.substring(0, this.matchedWords.size());

            if (inputWordSub.equals(searchString)) {
                this.matchedWords.add(inputWord);
                return true;
            } else {
                continue;
            }
        }

        return false;
    }

    public String searchString(ArrayList<String> matchedWords, Integer position) {
        String search = "";

        for (String matchedWord: matchedWords) {
            String subS = matchedWord.substring(position, position + 1);
            search += subS;
        }

        return search;
    }
}
