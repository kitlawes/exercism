import java.util.ArrayList;
import java.util.List;

public class PangramChecker {
    public boolean isPangram(String input) {
        List<String> letters = new ArrayList<String>();
        for (int i = 97; i < 97 + 26; i++) {
            letters.add(String.valueOf((char) i));
        }
        input = input.toLowerCase();
        for (int i = 0; i < input.length(); i++) {
            letters.remove(String.valueOf(input.charAt(i)));
        }
        if (letters.isEmpty()) {
            return true;
        } else {
            return false;
        }
    }
}
